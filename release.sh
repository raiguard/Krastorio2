#!/bin/sh

## CROWDIN

# Quote sources
for file in $(find ./locale -name "*.cfg"); do
  perl -pi -e 's/\"/\\\"/g' $file
  perl -pi -e 's/([^=])=(.*)/\1="\2"/' $file
done

# Sync with Crowdin
crowdin push sources --config=.crowdin.yml
crowdin pull --config=.crowdin.yml

# Unquote translations
for file in $(find ./locale -name "*.cfg"); do
  perl -pi -e 's/([^=])="(.*)"/\1=\2/' $file
  perl -pi -e 's/\\\"/\"/g' $file
done

git add .
git commit -m "Update Crowdin translations"

## RELEASE

# Source: https://git.sr.ht/~raiguard/dotfiles/tree/master/item/bin/mkmodrelease
mkmodrelease $1
