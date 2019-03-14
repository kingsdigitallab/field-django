
def migrate_wagtail_page_type(apps, schema_editor, mapping):
    '''
    Fairly generic method to convert all instances of one direct subtype
    of wagtail page into another.

    Returns the number of converted pages.

    This is supposed to be called from a data migration operation function.

    https://docs.djangoproject.com/en/2.2/topics/migrations/#data-migrations

    Method:

    A record from the specific Page type table is copied into the new type
    table. But the parent record in wagtailcore_page is left intact
    (same id, title, slug, webpath) apart from its content_type.

    All fields with the names are automatically copied. Other fields and
    custom transforms can be done in a custom copy function
    attached to the 'mapping' dictionary.

    An OPTIONAL 'select' entry in 'mapping' links to a function that can
    further filter the default django queryset of all pages to convert.

    IT IS RECOMMENDED TO BACK UP YOUR DATABASE BEFORE USING THIS FUNCTION.

    Example:

    def my_migration_operation(apps, schema_editor):

        def copy(page_from, page_to):
            page_to.field_a = page_from.field_b

        def select(qs):
            return qs.filter(title__icontains='banana')

        mapping = {
            'models': {
                'from': ('kdl_wagtail_page', 'RichPage'),
                'to': ('kdl_wagtail_core', 'RichTextPage'),
            },
            'copy': copy,
            'select': select,
        }

        convert_pages(apps, schema_editor, mapping)

    '''

    PageFrom = apps.get_model(*mapping['models']['from'])
    PageTo = apps.get_model(*mapping['models']['to'])

    pages_to = []

    pages_from = PageFrom.objects.all()
    select = mapping.get('select', None)
    if select:
        pages_from = select(pages_from)
    copy = mapping.get('copy', None)

    from django.contrib.contenttypes.models import ContentType
    content_type_to = ContentType.objects.filter(
        app_label=mapping['models']['to'][0],
        model=mapping['models']['to'][1].lower()
    ).first()

    for page_from in pages_from:
        page_to = PageTo()

        # naive conversion: we copy all the fields which have a common name
        # this will at least copy all the fields from Page table
        # See wagtail.core.models.Page.copy()
        for field in page_to._meta.get_fields():
            #             print(field.name, getattr(
            #                 page_from, field.name, None
            #             ))

            # Ignore reverse relations
            if field.auto_created:
                continue

            # Ignore m2m relations - they will be copied as child objects
            # if modelcluster supports them at all (as it does for tags)
            if field.many_to_many:
                continue

            if hasattr(page_from, field.name):
                setattr(page_to, field.name, getattr(
                    page_from, field.name, None
                ))

        # particular cases
        page_to.id = page_from.id
        page_to.page_ptr_id = page_from.page_ptr_id
        page_to.content_type_id = content_type_to.pk

        # custom copy
        if copy:
            copy(page_from, page_to)

        pages_to.append(page_to)

    # Remove all the converted page
    # we use a raw statement instead of .delete() because we want to keep
    # the parent Page record.
    # TODO: for large number of ids, we might need to process this in chunk.
    # TODO: ANY in the the where clause may not work with other RDBMS than psql
    page_from_ids = [
        int(v) for v in
        PageFrom.objects.all().values_list('page_ptr_id', flat=True)
    ]
    from django.db import connection
    with connection.cursor() as cursor:
        cursor.execute(
            'DELETE FROM {} WHERE page_ptr_id = ANY(%s)'.format(
                PageFrom._meta.db_table),
            [page_from_ids]
        )

    # now we can save the converted pages (without duplicate values)
    for page_to in pages_to:
        page_to.save()

    return len(pages_to)
