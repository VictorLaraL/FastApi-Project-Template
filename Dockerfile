FROM python:3.10.10-slim

# Best practice for declare who is the maintainer
LABEL maintainer="VictorLara"

# Send env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./requirements/requirements.txt /tmp/requirements.txt
COPY .requirements/requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client jpeg-dev && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base postgresql-dev musl-dev zlib zlib-dev && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [$DEV = "true"]; \
        then /py//bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    apk del .tmp-build-deps
