'''
Created on 15 Feb 2018

@author: Geoffroy Noel
'''

from ._kdlcommand import KDLCommand
from django.db import connection
from django.db import transaction
from django.conf import settings


class Command(KDLCommand):
    '''
    '''
    help = 'KDL toolbox'

    def action_convert_richpages(self):
        from django.apps import apps
        c = self.convert_pages(apps, None)
        print(c)

    def convert_pages(self, apps, schema_editor):
        from kdl_wagtail.core.utils import migrate_wagtail_page_type

        def copy(page_from, page_to):
            # page_to.body = page_from.body
            pass

        mapping = {
            'models': {
                'from': ('kdl_wagtail_page', 'RichPage'),
                'to': ('kdl_wagtail_core', 'RichTextPage'),
            },
            'copy': copy,
        }
        migrate_wagtail_page_type(apps, schema_editor, mapping)

        # raise Exception('ROLLBACK')

    def action_flush(self):
        '''Django flush command usually fails with postgresql because
        of dependencies, not using cascade, and missing table.
        This command forcefully remove all tables under the public schema'''
        username = settings.DATABASES['default']['USER']

        with connection.cursor() as cursor:
            cursor.execute(
                'SELECT tablename FROM pg_tables '
                'WHERE schemaname=%s AND tableowner=%s',
                ['public', username]
            )

            sql_drop = 'drop table if exists "{}" cascade;'

            for row in cursor.fetchall():
                tablename = row[0]

                print(tablename)

                self._execute_sql(sql_drop.format(tablename))

    @transaction.atomic
    def _execute_sql(self, sql):
        ret = False

        with connection.cursor() as cursor:
            try:
                cursor.execute(sql)
                ret = True
            except Exception as e:
                print(e)

        return ret
