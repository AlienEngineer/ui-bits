#!/bin/bash

function getVersion {
input="pubspec.yaml"
while IFS= read -r line
do
  if [[ $line == *"version"* ]]; then
    echo "$line"
    return
  fi

done < "$input"
}

version=$(echo $(getVersion) | sed 's/version: //g' | sed 's/",//g')

line=$(head -n 1 CHANGELOG.md)

if [[ $1 == "" ]]; then
  echo "please provide what has changed."
  exit 1
fi

if [[ $line == "## [$version]" ]]; then
  echo "appended to $line"
    sed "1 a\\
- $1
    " CHANGELOG.md > changed.txt && mv changed.txt CHANGELOG.md
  exit 0
fi

echo "## [$version]
- $1

$(cat CHANGELOG.md)" > CHANGELOG.md

