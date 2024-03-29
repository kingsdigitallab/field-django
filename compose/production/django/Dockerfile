FROM node:10-stretch-slim as image-npm

WORKDIR /app
COPY ./package*.json /app/
RUN npm ci && npm cache clean --force
RUN tar czf node_modules.tar.gz node_modules

FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
  # dependencies for building Python packages
  && apt-get install -y build-essential \
  # psycopg2 dependencies
  && apt-get install -y libpq-dev \
  # Translations dependencies
  && apt-get install -y gettext \
  && apt-get install -y libldap2-dev libsasl2-dev ldap-utils \
  # cleaning up unused files
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*

RUN addgroup --system django \
  && adduser --system --ingroup django django

# Requirements are installed here to ensure they will be cached.
COPY ./requirements /requirements
RUN pip install -U pip
RUN pip install --no-cache-dir -r /requirements/production.txt \
  && rm -rf /requirements

COPY --chown=django:django ./compose/production/django/entrypoint /entrypoint
RUN sed -i 's/\r$//g' /entrypoint
RUN chmod +x /entrypoint

COPY --chown=django:django ./compose/production/django/start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start
COPY --chown=django:django . /app

RUN mkdir -p /app/field/media && chmod -R ugo+rwx /app/field/media && chown -R django:django /app/field/media

USER django

WORKDIR /app

COPY --from=image-npm /app/node_modules.tar.gz /
RUN tar xzf /node_modules.tar.gz

ENTRYPOINT ["/entrypoint"]
