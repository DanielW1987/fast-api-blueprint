#! /usr/bin/env bash

# Check database connection
python3 ./app/bootstrap/database_connection_test.py

# Run migrations
alembic -c "./scripts/init/alembic.ini" upgrade head

# Create initial data
python3 ./app/bootstrap/initial_data.py
