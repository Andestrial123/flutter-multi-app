#!/bin/bash

# Функция для увеличения номера сборки
increment_build_number() {
  local version_line=$(grep '^version:' pubspec.yaml)
  local version=$(echo "$version_line" | awk '{print $2}')
  local build_number=$(echo "$version" | cut -d '+' -f2)

  local new_build_number=$((build_number + 1))
  local new_version=$(echo "$version" | sed "s/+$build_number$/+$new_build_number/")

  # Обновляем строку версии
  sed -i.bak "s/^version:.*/version: $new_version/" pubspec.yaml

  echo "Updated pubspec.yaml to version $new_version"
}

increment_build_number