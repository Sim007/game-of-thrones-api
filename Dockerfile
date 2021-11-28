FROM python:3.8-slim-buster

WORKDIR /code

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV APP_USER=costa

RUN groupadd -r ${APP_USER} && useradd --create-home -g ${APP_USER} ${APP_USER}

RUN pip install --upgrade pip

COPY requirements.txt .

RUN pip install -r requirements.txt && rm -rf /var/lib/apt/lists/*

COPY --chown=${APP_USER}:${APP_USER} . .

USER ${APP_USER}

