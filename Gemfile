source "https://rubygems.org"

# Pin the toolchain to the gems GitHub Pages' own build image ships with.
#
# Without this, `gem install jekyll` gives you Jekyll 4 while the site is built
# with Jekyll 3.9 on GitHub Pages, and the two do not render the same site —
# which is how a local preview can look fine while the deploy does not. The
# gh-pages gem also pins the Liquid, kramdown and sass versions.
#
# Local use:
#   bundle install
#   bundle exec jekyll serve --livereload
gem "github-pages", group: :jekyll_plugins

# Required by github-pages' own dependency chain on Ruby 3.0+; harmless on
# older Rubies where it is already a default gem.
gem "webrick", "~> 1.8"
