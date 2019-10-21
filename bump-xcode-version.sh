component=${1:-"patch"}
version=$(/usr/libexec/PlistBuddy -c 'Print CFBundleShortVersionString' Info.plist)
IFS="." read major minor patch <<< "$version"
echo "Bumping $component of $version"
if [[ "$component" = 'major' ]]; then
    major=$((major + 1))
    minor=0
    patch=0
elif [[ "$component" = 'minor' ]]; then
    minor=$((minor + 1))
    patch=0
elif [[ "$component" = 'patch' ]]; then
    patch=$((patch + 1))
fi
version="${major}.${minor}.${patch}"
echo "Bumped to $version"
/usr/libexec/PlistBuddy -c "Set CFBundleShortVersionString ${version}" Info.plist