import factory
from dublincore_resource.models import DublinCoreAgent
from wagtail.core.models import Page

from field_wagtail.models import (
    FieldOralHistory,
    FieldTimelineEvent,
    FieldTimelineResource,
    FieldTimelineCategory,
    FieldTimelinePage,
    HomePage
)


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
    text = factory.Faker('sentence', nb_words=4)

    class Meta:
        model = FieldTimelineEvent


class HomePageFactory(factory.DjangoModelFactory):
    title = factory.Faker('sentence', nb_words=4)
    path = "00010002"
    depth = 2
    body = "[]"

    class Meta:
        model = HomePage


class PageFactory(factory.DjangoModelFactory):
    title = factory.Faker('sentence', nb_words=4)
    path = factory.Sequence(lambda n: "00010009%04d" % n)
    depth = 3

    class Meta:
        model = Page


class FieldTimelinePageFactory(factory.DjangoModelFactory):
    title = factory.Faker('sentence', nb_words=4)
    path = factory.Sequence(lambda n: "00010009%04d" % n)
    depth = 3

    class Meta:
        model = FieldTimelinePage


""" Dublin Core Factories"""


class DublinCoreAgentFactory(factory.DjangoModelFactory):
    full_name = factory.Faker('name')
    identifier = factory.Faker('url')

    class Meta:
        model = DublinCoreAgent
