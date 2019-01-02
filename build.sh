#!/bin/bash
export VERSION=$(cat VERSION)
export MESSAGE="Release of version v$VERSION"

# create release
mix nerves.artifact
export FILE=$(ls .nerves/artifacts/$REPO-portable-$VERSION/*.tar.gz)

# create tag
git tag -a v$VERSION -m $MESSAGE
git push origin --tags

# create release for the tag
curl --data "{\"tag_name\":\"v$VERSION\",\"target_commitish\":\"master\",\"name\":\"v$VERSION\",\"body\":"$MESSAGE",\"draft\":false,\"prerelease\":false}" https://api.github.com/repos/$USERNAME/$REPO/releases?access_token=$GITHUB_TOKEN
export RELEASE_ID=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "https://api.github.com/repos/$USERNAME/$REPO/releases/tags/v$VERSION" | jq -r '.id')
curl -H "Authorization: token $GITHUB_TOKEN" -H "Content-Type: $(file -b --mime-type $FILE)" --data-binary @$FILE "https://uploads.github.com/repos/$USERNAME/$REPO/releases/$RELEASE_ID/assets?name=$(basename $FILE)"