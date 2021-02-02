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

function increment_version
{
  declare -a part=( ${1//\./ } )
  declare    new
  declare -i carry=1

  new=$((part[2]+1))
  part[2]=${new}

  new="${part[*]}"
  echo -e "${new// /.}"
}

version=$(echo $(getVersion) | sed 's/version: //g' | sed 's/",//g')

newVersion=$(echo $(increment_version $version))

echo "$version > $newVersion"

sed "s/$version/$newVersion/" pubspec.yaml > changed.txt && mv changed.txt pubspec.yaml
