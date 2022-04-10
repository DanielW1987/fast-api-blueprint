#!/usr/bin/env bash

set -e
set -x

USE_FILE_BASED_DB=True pytest --cov=app --cov-report=term-missing app/tests "${@}"
