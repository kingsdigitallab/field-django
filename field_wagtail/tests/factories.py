import factory

from field_wagtail.models import (
    FieldOralHistory,
    FieldTimelineEvent,
    FieldTimelineResource,
    FieldTimelineCategory
)

from dublincore_resource.models import DublinCoreAgent


class FieldOralHistoryFactory(factory.DjangoModelFactory):
    speaker = factory.Faker('name')
    place = factory.Faker('city')
    text = factory.Faker('sentence', nb_words=8)

    class Meta:
        model = FieldOralHistory


class FieldTimelineCategoryFactory(factory.DjangoModelFactory):
    category_name = factory.Faker('sentence', nb_words=2)

    class Meta:
        model = FieldTimelineCategory


class FieldTimelineResourceFactory(factory.DjangoModelFactory):
    identifier = factory.Sequence(lambda n: "R%03d" % n)
    link_url = factory.Faker('url')

    class Meta:
        model = FieldTimelineResource


class FieldTimelineEventFactory(factory.DjangoModelFactory):
    unique_id = factory.Sequence(lambda n: "F%03d" % n)
    category = factory.SubFactory(FieldTimelineCategoryFactory)
    resource = factory.SubFactory(FieldTimelineResourceFactory)

    class Meta:
        model = FieldTimelineEvent


""" Dublin Core Factories"""


class DublinCoreAgentFactory(factory.DjangoModelFactory):
    full_name = factory.Faker('name')
    identifier = factory.Faker('url')

    class Meta:
        model = DublinCoreAgent
