# rossmooruu.org

The website for the **Unitarian Universalists of Rossmoor** — a club for
Unitarian Universalists living in the Rossmoor 55+ community in Walnut Creek,
California. We meet once a month, on the **second Friday**, at 11:30 am in the
Vista Room of the Hillside Complex. We are a club, not a church: the nearest UU
congregation is Mount Diablo UU Church.

Live site: <https://rossmooruu.org>

## Stack

| Piece | What it is |
|---|---|
| Build | Jekyll 3.x (GitHub Pages' own build image) |
| Hosting | GitHub Pages, deployed on every push to `main` |
| Styling | Bootstrap 5.3.4 from jsDelivr, plus `assets/css/styles.css` |
| Type | Fraunces (headings) and Inter (body) from Google Fonts |
| Plugins | `jekyll-sitemap` (see `_config.yml`) |
| Tooling | None. No Gemfile, no Node, no build step to install |

`assets/css/styles.css` is the only stylesheet that matters. It defines design
tokens (`--paper`, `--ink`, `--teal`, `--amber`, type scale) at the top, and
everything below is written in terms of them.

## Editing content

Almost all of the site's content lives in `_data/`. You rarely need to touch a
page template.

### The next program

This is the most common edit — the homepage hero card reads from here.

`_data/next_program.yml` is a **list**, even though it usually holds one entry:

```yaml
- title: Love Beyond a Lifetime
  subtitle: Organ Donation as an Act of Faith
  date: Friday, November 13, 2026
  month_abbr: Nov          # for the date badge
  day: "13"                # quoted, for the date badge
  description: ...
  image: sonya_wilson.webp
  image_alt: Sonya Wilson
  speaker: Sonya Wilson
  speaker_bio: ...
  image2: damita_barbee.webp
  speaker2: Damita Barbee
  speaker2_bio: ...
  month: 2026-11
```

Two gotchas, both of which have bitten this site:

- **A stray `-` on its own line at the end of the file** creates an empty list
  entry. The homepage then renders a blank program card with an empty `<img>`
  and empty headings. The built-site check now fails the build if that happens.
- **`speaker_bio` is not `biography`.** `next_program.yml` uses `speaker_bio`
  and `speaker2_bio`; the past-program files use `biography`. Using the wrong
  key renders nothing, silently.

Images go in `assets/images/` and should be **WebP** where possible — most are
displayed at a few hundred pixels wide, and a 1.4 MB PNG for a 500 px photo is
how this repo got slow before.

### Confirmed future programs

`_data/upcoming_programs.yml` holds the months after the current one, for the
"Coming up" row. Keep it minimal — a date plus whatever is actually settled.
An entry with a date and nothing else renders a card with just the date; an
entry with a speaker and no title uses the speaker as the heading.

### Past programs

- `_data/past_programs.yml` — the current year
- `_data/past_programs_2025.yml` — the 2025 archive
- `_data/rmuu_past_programs.csv` — older years, rendered by `older_programs.md`

Fields are `title`, `date`, `description`, `image`, `image_alt`, `speaker`,
`biography`, `month`.

### Navigation

`_data/navigation.yml` drives the navbar. An item is either a plain link:

```yaml
- name: Visit
  link: /visit
```

or a dropdown, where the parent gets `link: \#` and a `dropdown:` list.

### Adding a page

Create a file such as `visit.md` with front matter:

```yaml
---
layout: default
title: Visit Us
description: Shown as the meta description for this page.
---
```

Jekyll outputs it at `/visit.html`, and — this is worth knowing — GitHub Pages
serves it at both `/visit.html` and `/visit`. The navbar uses the extensionless
form for most pages.

## Layout and includes

| File | Purpose |
|---|---|
| `_layouts/default.html` | The only layout: `<head>`, title/meta/OG tags, JSON-LD, header, content, footer |
| `_includes/navigation.html` | The navbar, rendered from `_data/navigation.yml` |
| `_includes/footer.html` | Site footer: identity, meeting details, links |
| `_includes/signup.html` | Mailing-list section on the homepage |
| `_includes/banner.html` | Optional announcement banner (currently commented out on the homepage) |

`_layouts/default.html` also emits JSON-LD for search engines, typed as
`Organization`. Contact and meeting details in the footer and the JSON-LD should
be kept in step if the address ever changes.

## Mailing list

The sign-up section (`_includes/signup.html`) is wired to EmailOctopus but is
currently in fallback mode: it shows an "email us and we'll add you" button.

To switch it to a real form, create an **inline** form in the EmailOctopus
dashboard (Grow → Forms), copy the id out of the `</> Add to your website`
snippet, and set it in `_config.yml`:

```yaml
emailoctopus_form_id: "2840c726-..."
```

Do **not** put the EmailOctopus API key in this repo. The site is static, so
every file here is served to every visitor, and that key can read and delete
contacts. It belongs in `.env` on a machine, never in a commit.

## Local preview

```bash
bundle install
bundle exec jekyll serve --livereload   # http://localhost:4000
```

The `Gemfile` pins the `github-pages` gem — the same toolchain GitHub Pages
builds with — so a local build renders the same site as the deploy. Without it,
a bare `gem install jekyll` gets you Jekyll 4 on a site built by Jekyll 3.9,
and the two do not render identically.

This needs Ruby 2.7 or newer. If your Ruby is older, skip it: every pull request
uploads the built site as a downloadable `built-site` artifact.

## Deployment

```
push to a branch  →  open a pull request  →  "Build Jekyll (PR)" builds + checks
                                          →  merge to main
                                          →  "Deploy Jekyll with GitHub Pages" publishes
```

- **`main` has no branch protection.** A merge publishes to the live site
  immediately, and nothing blocks a red PR from being merged anyway. The PR
  build is the only gate, so treat a failing check as a stop. Worth fixing in
  Settings → Branches: require the `build` check before merging.
- The PR workflow (`.github/workflows/jekyll-build-pr.yml`) builds with the same
  `actions/jekyll-build-pages` action that deploys, so a green PR build means
  the deploy build will also succeed.
- The deploy workflow (`.github/workflows/jekyll-gh-pages.yml`) runs only on
  pushes to `main`, or manually from the Actions tab.
- The custom domain `rossmooruu.org` is configured in the repository's Pages
  settings. `docs/CNAME` appears to be a leftover from an earlier setup.

## Automated checks

`.github/scripts/check-built-site.sh` runs against `_site` on every pull
request. It fails the build on:

1. A missing `index.html`, `404.html`, `robots.txt` or `sitemap.xml`.
2. An `<img>` whose `src` ends in `/` — an empty filename.
3. Empty heading elements (`<h2></h2>`).
4. An `<img>` with no `alt` attribute at all (an empty `alt` is fine for
   decorative images).
5. A link or `src` pointing at a local file that is not in the build. This is
   the one that catches asset deletions.

It also **lists** — without failing — every file in `assets/` that nothing
references. That list is how 76 MB of old newsletter PDFs stayed invisible for
a year, so read it when it appears in a build log.

Run it locally against a build with:

```bash
bash .github/scripts/check-built-site.sh _site
```

## Known cleanup work

Recorded here so it is not rediscovered later. Most of what used to be on this
list is gone — see the note at the end.

- `uua_statements.md` is an orphan page with no inbound links.
- **The two privacy policies disagree, and the older one is the one published.**
  `privacy_policy.html` is the live page: ~10,000 words from a policy generator,
  dated April 2025, and it neither names the organisation nor gives a street
  address — its only contact is a Gmail address. `privacy_policy.md` is a
  shorter, hand-written policy dated October 2025 that does name the club and
  gives a registered address and a `privacy@rossmooruu.org` contact. Choosing
  which text is authoritative is a decision for the club, not a tidy-up: it
  changes what the public is told about their data. The `.md` is excluded from
  the build meanwhile, so at least the raw copy at `/privacy_policy.md` is gone.
- `docs/CNAME` is a leftover from an earlier Pages setup; it is published as
  `/docs/CNAME`. Nothing uses it.
- Git history still contains the removed newsletter PDFs (~67 MB). Reclaiming
  that space needs a deliberate history rewrite and a force-push, not a cleanup
  commit.

Removed in the cleanup pass, kept here in case any of it is wanted back — all
of it is recoverable from git history:

- `index_one_speaker.md`, `index_multiple_speakers.md`, `index_picnic.md` —
  superseded homepages, still published at their own URLs. `index_picnic.md`
  was a seasonal one announcing a "no August meeting" and a brown-bag picnic on
  September 11, with real copy worth reusing if the club wants that page back.
- `next_program.md` — rendered an empty page; it looped over
  `site.data.next_program_draft`, which never existed.
- `contact.html` and `assets/js/contact_script.js` — the page posted its form to
  `/api/contact`, which does not exist on a static host, so submissions were
  silently dropped into the console. Replaced by `contact.md`, which uses the
  site layout and links to the club's email.
- `_data/events.yml` and `_data/events.yml.bak` — unused.
