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

# Some mods have src/ folders, some don't
if [ -d "src" ]; then
    changelogfile="src/changelog.txt"
    infojsonfile="src/info.json"
    archivepath="src"
else
    changelogfile="changelog.txt"
    infojsonfile="info.json"
    archivepath="."
fi

# Extract properties for later use
branch=$(git branch | awk '/^\* / { print $2 }')
modname=$(awk '/"name":/ { gsub(/("|,)/, ""); print $2 }' $infojsonfile)
version=$(awk '/^Version:/ { print $2 }' $changelogfile | head -1)

# Datestamp changelog and commit
sed -i "3s/.*/Date: $(date -I)/" $changelogfile
git add $changelogfile
git commit -m "Prepare to release version $version"

# Create tag with changelog
changelog=$(awk "/Version: $version$/ { flag = 1 } /^--/ { flag = 0 } flag { gsub(/^  /, \"\"); print }" $changelogfile | tail -n +3)
git tag v$version -a -m "$changelog"

# Create archive and upload it
rootpath=$PWD
filename="${modname}_${version}.zip"
cd $archivepath
git archive --format=zip --prefix=$modname/ HEAD -o $filename
if [ "$1" != "--noupload" ]; then
    fmm upload $filename
    rm $filename
fi
cd $rootpath

# Increment version
newversion=$(echo "$version" | awk 'BEGIN { FS = "."; OFS = "." } { print $1, $2, $3 + 1 }')
sed -i "s/^  \"version\":.*\$/  \"version\": \"$newversion\",/" $infojsonfile
echo -e "---------------------------------------------------------------------------------------------------\nVersion: $newversion\nDate: ????\n  Features:\n$(cat $changelogfile)" > $changelogfile
git add $changelogfile $infojsonfile
git commit -m "Move to version $newversion"

# Push changes and tag
git push --atomic origin $branch v$version
