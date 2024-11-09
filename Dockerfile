FROM python:3.10-slim

RUN useradd -ms /bin/bash celeryuser

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV POETRY_VIRTUALENVS_CREATE=false

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN ~/.local/bin/poetry install --no-root

COPY . .

USER celeryuser

EXPOSE 8000

CMD ["./start.sh"]
