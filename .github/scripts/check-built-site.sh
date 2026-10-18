#!/usr/bin/env bash
# Sanity checks on the built site.
#
# Each check below corresponds to a defect that reached production and was not
# caught by anything: an <img> with an empty filename, headings left empty by
# data files with a stray trailing dash, and a typo that survived several
# content updates. If a check fails, the fix belongs in the source, not here.
set -uo pipefail

site="${1:-_site}"
fail=0

note() { printf '  %s\n' "$1"; }
fail_check() { printf 'FAIL: %s\n' "$1"; fail=1; }

echo "Checking $site"

if [ ! -d "$site" ]; then
  fail_check "build output $site does not exist"
  exit 1
fi

for required in index.html 404.html robots.txt sitemap.xml; do
  if [ -f "$site/$required" ]; then
    note "ok: $required"
  else
    fail_check "missing $required in the built site"
  fi
done

# 1. Images must have a filename. An empty src renders a broken-image icon and
#    is how a stray "-" in a data file shows up on the homepage.
if matches=$(grep -rEno 'src="[^"]*assets/images/"' "$site" 2>/dev/null); then
  fail_check "image tag with an empty filename:"
  printf '%s\n' "$matches" | sed 's/^/    /'
else
  note "ok: no empty image src"
fi

# 2. No empty headings; they are the other half of the same data bug.
if matches=$(grep -rEno '<h[1-6]></h[1-6]>' "$site" 2>/dev/null); then
  fail_check "empty heading elements:"
  printf '%s\n' "$matches" | sed 's/^/    /'
else
  note "ok: no empty headings"
fi

# 3. Every image needs alt text attribute (empty alt is valid for decorative
#    images, but the attribute must be present).
if matches=$(grep -rPno '<img(?![^>]*\balt=)[^>]*>' "$site" 2>/dev/null); then
  fail_check "image without an alt attribute:"
  printf '%s\n' "$matches" | sed 's/^/    /'
else
  note "ok: every image has an alt attribute"
fi

# 4. Every local file a page points at must exist in the build. This is the
#    counterweight to deleting assets: it catches a removed file that a page
#    still links to, which is otherwise only noticed by a visitor getting a 404.
#    Refs are resolved against each page's own directory, and HTML comments are
#    stripped first, so commented-out SSR script fragments are not read as links.
missing=""
while IFS= read -r page; do
  pagedir=$(dirname "${page#"$site"/}")
  [ "$pagedir" = "." ] && pagedir=""
  while IFS= read -r ref; do
    [ -z "$ref" ] && continue
    case "$ref" in
      *://*|mailto:*|tel:*|data:*|javascript:*|"#"*|\\#*) continue ;;
    esac
    path="${ref%%#*}"   # drop any fragment
    path="${path%%\?*}" # drop any query
    [ -z "$path" ] && continue
    if [ "${path#/}" != "$path" ]; then
      cand="$site/${path#/}"       # root-relative
    else
      cand="$site/$pagedir/$path"  # relative to the page
    fi
    if [ -e "$cand" ] || [ -e "$cand/index.html" ] || [ -e "$cand.html" ]; then
      continue
    fi
    missing="$missing
    ${page#"$site"/} -> $ref"
  done < <(perl -0777 -pe 's/<!--.*?-->//gs' "$page" \
             | grep -ohE '(src|href)="[^"]+"' \
             | sed -E 's/^(src|href)="//; s/"$//' | sort -u)
done < <(find "$site" -name '*.html' 2>/dev/null | sort)
if [ -n "$missing" ]; then
  fail_check "page links to a local file that is not in the build:$missing"
else
  note "ok: every local link resolves to a built file"
fi

# 5. Report files in assets/ that nothing points at. Informational rather than
#    a failure — this is how 76MB of newsletters accumulated in assets/pdfs
#    without anyone noticing, and a list in the log is what makes it visible.
unreferenced=""
while IFS= read -r f; do
  rel="${f#"$site"/}"
  base=$(basename "$rel")
  if ! grep -rqF "$base" "$site" --include='*.html' 2>/dev/null; then
    unreferenced="$unreferenced
    $rel"
  fi
done < <(find "$site/assets" -type f 2>/dev/null | sort)
if [ -n "$unreferenced" ]; then
  note "unreferenced files in assets/ (informational):$unreferenced"
else
  note "ok: every file in assets/ is referenced"
fi

if [ "$fail" -ne 0 ]; then
  echo "Site checks failed."
  exit 1
fi

echo "Site checks passed."
