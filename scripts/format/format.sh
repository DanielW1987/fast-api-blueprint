#!/bin/sh -e
set -x

sh ./scripts/format/format-imports.sh
autoflake --remove-all-unused-imports --recursive --remove-unused-variables --in-place app --exclude=__init__.py
black app
isort app
