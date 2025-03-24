FIELD
=====

Farm-level Interdisciplinary approaches to Endemic Livestock Disease

.. image:: https://img.shields.io/badge/License-MIT-yellow.svg
    :target: https://opensource.org/licenses/MIT
    :alt: MIT
.. image:: https://img.shields.io/badge/built%20with-Cookiecutter%20Django-ff69b4.svg?logo=cookiecutter
     :target: https://github.com/pydanny/cookiecutter-django/
     :alt: Built with Cookiecutter Django
.. image:: https://img.shields.io/badge/code%20style-black-000000.svg
    :target: https://github.com/ambv/black
    :alt: Black code style

Overview
--------

This is the repository for Farm-level Interdisciplinary approaches to Endemic Livestock Disease (FIELD), currently maintained by King's Digital Lab(https://github.com/kingsdigitallab/).

This project has been redesigned to run in a Docker container, aimed at an Openstack deployment.

The project is made up of several distinct parts:

* Django/Wagtail CMS.  The main site is made in Django, using Wagtail as a CMS, to hold a repository of images, blog posts about the project, and a timeline.
* Fields (https://stories.field-wt.co.uk/).  This is a static copy of a separate site that holds the work of the writers in residence during the project.  It was originally developed with Shorthand (https://shorthand.com/)
* Livestock game (field_game app in Django).  A mobile-first, simple board game, developed with Phaser(https://phaser.io/).  The player is a farmer who must balance keeping their herd healthy and trying to make the most money to win the game.  It was originally designed as part of a behavioural research project aimed at an undergraduate audiences, which is why the rules are quite simple, and why it was developed to be a browser game for accessibility.  It was developed by Elliott Hall at KDL and Ewan Colman, a research on the project.

Containers:
-----------

- [nginx-proxy](https://hub.docker.com/r/nginxproxy/nginx-proxy): This is the primary entry point for the stack, running on 80.  It automatically builds a proxy to other containers.
- [django 3.2](https://hub.docker.com/layers/library/python/3.6-slim-buster/images/sha256-5dd134d6d97c67dd02e4642ab24ecbb9d23059ea018a8b5185784d29dce2f37a?context=explore): The main container for the project (see more detailed description below.)
- [nginx](https://hub.docker.com/_/nginx): This is the static data container, serving Django's static content.
- Postgres [12.3](https://www.postgresql.org/docs/12/index.html)): The database container for Django above.
- elasticsearch [7.10](https://hub.docker.com/_/elasticsearch): The indexing container, used by Wagtail for its search function.
- kdl-apache-proxy: This proxy serves the Fields stories site, which was originally a separate site (see above)

Settings
--------

See detailed `cookiecutter-django settings documentation`_.

.. _cookiecutter-django settings documentation: http://cookiecutter-django-kingsdigitallab.readthedocs.io/en/latest/settings.html



    # Django
    DJANGO_READ_DOT_ENV_FILE=True
    DJANGO_SETTINGS_MODULE=config.settings.production
    DJANGO_ALLOWED_HOSTS=
    DJANGO_SECRET_KEY=
    DJANGO_ADMIN_URL=


    # Security
    # ------------------------------------------------------------------------------
    # TIP: better off using DNS, however, redirect is OK too
    DJANGO_SECURE_SSL_REDIRECT=False


    # django-allauth
    # ------------------------------------------------------------------------------
    DJANGO_ACCOUNT_ALLOW_REGISTRATION=True



    # Elasticsearch
    # ------------------------------------------------------------------------------
    discovery.type=single-node

    # Database
    # ------------------------------------------------------------------------------
    # PostgreSQL
    # ------------------------------------------------------------------------------
    POSTGRES_HOST=db
    POSTGRES_PORT=5432
    POSTGRES_DB=
    POSTGRES_USER=
    POSTGRES_PASSWORD=
    DATABASE_URL=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}



    # django-allauth
    # ------------------------------------------------------------------------------
    DJANGO_ACCOUNT_ALLOW_REGISTRATION=True

    # django-compressor
    # ------------------------------------------------------------------------------
    COMPRESS_ENABLED=False
    COMPRESS_OFFLINE=True

    # Redis
    # ------------------------------------------------------------------------------
    REDIS_URL=redis://redis:6379/0

    # https://django-auth-ldap.readthedocs.io/
    # ------------------------------------------------------------------------------
    LDAP_SERVER_URI=
    LDAP_BIND_DN=
    LDAP_BIND_PASSWORD=

    LDAP_BASE_DC=
    LDAP_BASE_GROUP=

    LDAP_FIRST_NAME_FIELD=givenName
    LDAP_LAST_NAME_FIELD=sn
    LDAP_EMAIL_FIELD=mail


Fill in the database credentials and Django variables.  If deploying via a CI pipeline such as Gitlab, this file will need to be included in its variables (in the KDL setup, we encode this in base64 and add it to the CI/CD variables in the repository settings.)



Development
-----------

Local with Docker
^^^^^^^^^^^^^^^^^

See detailed `cookiecutter-django development with Docker documentation`_.

.. _cookiecutter-django development with Docker documentation: https://cookiecutter-django-kingsdigitallab.readthedocs.io/en/latest/developing-locally-docker.html

Local without Docker
^^^^^^^^^^^^^^^^^^^^

See detailed `cookiecutter-django local development documentation`_.

.. _cookiecutter-django local development documentation: https://cookiecutter-django-kingsdigitallab.readthedocs.io/en/latest/developing-locally.html

Basic Commands
--------------

Setting Up Your Users
^^^^^^^^^^^^^^^^^^^^^

* To create a **normal user account**, just go to Sign Up and fill out the
  form. Once you submit it, you'll see a "Verify Your E-mail Address" page. Go
  to your console to see a simulated email verification message. Copy the link
  into your browser. Now the user's email should be verified and ready to go.

* To create an **superuser account**, use this command::

    $ python manage.py createsuperuser

For convenience, you can keep your normal user logged in on Chrome and your
superuser logged in on Firefox (or similar), so that you can see how the site
behaves for both kinds of users.

Type checks
^^^^^^^^^^^

Running type checks with mypy:

::

  $ mypy field

Test coverage
^^^^^^^^^^^^^

To run the tests, check your test coverage, and generate an HTML coverage report::

    $ coverage run -m pytest
    $ coverage html
    $ open htmlcov/index.html

Running tests with py.test
~~~~~~~~~~~~~~~~~~~~~~~~~~

::

  $ pytest

Live reloading and Sass CSS compilation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Moved to `Live reloading and SASS compilation`_.

.. _`Live reloading and SASS compilation`: http://cookiecutter-django-kingsdigitallab.readthedocs.io/en/latest/live-reloading-and-sass-compilation.html





Deployment
----------

- After deployment, don't forget to run python manage.py update_index to build the search index.  This won't happen automatically.



Docker
^^^^^^

See detailed `cookiecutter-django Docker documentation`_.

.. _`cookiecutter-django Docker documentation`: http://cookiecutter-django-kingsdigitallab.readthedocs.io/en/latest/deployment-with-docker.html



