FROM node:10-stretch-slim as image-npm

WORKDIR /app
COPY ./package*.json /app/
RUN npm ci && npm cache clean --force
#RUN tar czf node_modules.tar.gz node_modules

FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update \
  # dependencies for building Python packages
  && apt-get install -y build-essential \
  && apt-get install -y python3-dev \
  && apt-get install -y libldap2-dev libsasl2-dev ldap-utils \
  # psycopg2 dependencies
  && apt-get install -y libpq-dev \
  # Translations dependencies
  && apt-get install -y gettext \
  # cleaning up unused files
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*

# Requirements are installed here to ensure they will be cached.
RUN mkdir -p /requirements
COPY ./volumes/django/requirements /requirements
RUN pip install -U pip
RUN pip install -U pip-tools \
  && pip-compile --annotate --resolver=backtracking --quiet /requirements/base.in \
  && pip-compile --annotate --resolver=backtracking --quiet /requirements/local.in \
  && pip-compile --annotate --resolver=backtracking --quiet /requirements/production.in
RUN pip install -r /requirements/production.txt

WORKDIR /app

RUN mkdir node_modules
COPY --from=image-npm  /app/node_modules /app/node_modules

COPY ./compose/openstack/django/entrypoint /entrypoint
RUN sed -i 's/\r$//g' /entrypoint
RUN chmod +x /entrypoint

COPY ./compose/openstack/django/start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start
COPY --chown=django:django ./volumes/django /app





ENTRYPOINT ["/entrypoint"]
