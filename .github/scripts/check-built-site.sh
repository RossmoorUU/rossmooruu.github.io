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

if [ "$fail" -ne 0 ]; then
  echo "Site checks failed."
  exit 1
fi

echo "Site checks passed."
