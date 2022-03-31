# README

This repository is a template repository for projects based on FastAPI. It comes with:

* [FastAPI](https://fastapi.tiangolo.com/)
* [alembic](https://alembic.sqlalchemy.org/en/latest/) for schema migration
* Postgres as database (via docker compose)
* mailhog for local email testing (via docker compose)

The template is based in large parts on the [Full Stack FastAPI and PostgreSQL - Base Project Generator](https://github.com/tiangolo/full-stack-fastapi-postgresql) by tiangolo.

## Prerequisites

You need to install the following software first:

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/install/)
* [Poetry](https://python-poetry.org/)

## Run app locally

### Install dependencies

This project comes with poetry as package dependency management tool. The dependencies are defined in `./pyproject.toml`

You can install all dependencies via:

```shell
$ poetry install
```

Then you can enter the newly created virtual environment via:

```shell
$ poetry shell
```

### Set environment variables

The application requires a bunch of environment variables to be set. You can export them into your environment, or create an `.env` file in the root directory. You can use the following content (only for local testing, not recommended for production):

```dotenv
PROJECT_NAME="FastAPI Template"
SERVER_HOST="http://localhost:8000"
BACKEND_CORS_ORIGINS='["http://localhost:8080", "http://localhost:3000"]'

POSTGRES_SERVER=localhost
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=app_db

SMTP_PORT=1025
SMTP_HOST=localhost
EMAILS_FROM_EMAIL=no-reply@example.com
EMAILS_FROM_NAME="FastAPI Backend"

EMAILS_ENABLED=True
FIRST_SUPERUSER=admin@example.com
FIRST_SUPERUSER_PASSWORD=test-1234
USERS_OPEN_REGISTRATION=True
```

### Start docker containers

Start the docker containers defined in file `./docker-compose.yml` via command `docker-compose up -d --no-recreate`. This starts all peripheral docker containers that are needed locally to run the application:

* `fastapi-template-db`: The database for the application (currently PostgreSQL)
* `mailhog`: [MailHog](https://github.com/mailhog/MailHog) is an email testing tool for developers. The SMTP server starts on port 1025 and the HTTP server starts on port 8025, so you can see all outgoing email under `http://localhost:8025`.

### Database initialization

To create the database schema via alembic and create a default admin user run:

```shell
$ ./scripts/init/start.sh
```

Please note that the script must be run from the root directory.

### Start server

To start the server please run:

```shell
$  uvicorn app.main:app --reload
```

## API Docs

After the server is started, the API Doc is available at [`http://127.0.0.1:8000/docs`](http://127.0.0.1:8000/docs) or [`http://127.0.0.1:8000/redoc`](http://127.0.0.1:8000/redoc).

## Run tests locally

To run all tests please run:

```shell
$ ./scripts/test/start.sh
```

If you want to have a coverage html report run:

```shell
$ ./scripts/test/start-cov-html.sh
```

## Dev Tools

The project also comes with the following developer tools:

* [flake8](https://flake8.pycqa.org/): Tool For Style Guide Enforcement
* [Mypy](http://mypy-lang.org/): Mypy is an optional static type checker for Python that aims to combine the benefits of dynamic (or "duck") typing and static typing.
* [Black](https://pypi.org/project/black/): Black is a PEP 8 compliant opinionated formatter.
* [isort](https://pycqa.github.io/isort/): isort is a Python library to sort imports alphabetically, and automatically separated into sections and by type. 
* [autoflake](https://pypi.org/project/autoflake/): autoflake removes unused imports and unused variables from Python code. It makes use of pyflakes to do this.

You can check your code with:

```shell
$ ./scripts/format/check.sh
```

You can run auto-formatting with:

```shell
$ ./scripts/format/format.sh
```