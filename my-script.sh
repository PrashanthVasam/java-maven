#!/bin/bash

# Extract the current version number from pom.xml
newVersion=$(grep -oPm1 "(?<=<version>)[^-]+" pom.xml)

# Check if the current version is the same as the previous version
if [ "$newVersion" == 1.9.21 ]; then
  echo "ERROR: Version $newVersion already exists. Please try with a different version."
  exit 1
else
  echo "Previous version: 1.9.21"
  echo "Actual version: $newVersion"
  echo "The build is processing!"

  # Set the appversion variable to the new version number
  echo "::set-env name=appversion::$newVersion"

  # Tag only main branches
  if [[ "$GITHUB_REF" == "refs/heads/release" || "$GITHUB_REF" == "refs/heads/master" ]]; then
    tagname="$newVersion-${GITHUB_REF##*/}-$GITHUB_RUN_NUMBER"
    echo "Creating tag: tagname"
    git tag tagname
    git -c http.extraheader="AUTHORIZATION: bearer ${{ secrets.GITHUB_TOKEN }}" push origin --tags
  else
    echo "Branch $GITHUB_REF is not a tag candidate"
  fi

  exit 0
fi
