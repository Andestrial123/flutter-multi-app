#!/bin/bash

dart run easy_localization:generate --source-dir ./assets/translations
dart run build_runner build --delete-conflicting-outputs