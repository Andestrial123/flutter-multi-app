#!/bin/bash

increment_build_number() {
  local version_line=$(grep "^version:" pubspec.yaml)
  local version=$(echo "$version_line" | awk '{print $2}')
  local current_build_number=$(echo "$version" | cut -d '+' -f2)

  local new_build_number=$((current_build_number + 1)) # Это можно увеличить или использовать GITHUB_RUN_NUMBER

  local new_version="${version%+*}+${GITHUB_RUN_NUMBER}"

  sed -i.bak "s/^version:.*/version: $new_version/" pubspec.yaml

  echo "Updated pubspec.yaml to version $new_version"
}

increment_build_number
