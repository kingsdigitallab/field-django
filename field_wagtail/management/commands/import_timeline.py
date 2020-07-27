"""
Import FIELD timeline events from csv

KDL (EH) 3/6/2020

"""
import argparse
import csv
from typing import Iterator

from django.conf import settings
from django.core.exceptions import ObjectDoesNotExist
from django.core.files import File
from django.core.files.images import ImageFile
from django.core.management.base import BaseCommand
from dublincore_resource.models import (
    DublinCoreRights,
    DublinCoreAgent
)
from wagtail.images.models import Image

from field_wagtail.models import (
    FieldTimelineEvent, FieldOralHistory,
    FieldTimelineResource, FieldTimelineCategory,
    FieldTimelineResourceImage, FieldTimelinePage, FieldTimelineEventItem
)

# Toggle attache events to default timeline.
# Set to false if initial run finished!
ATTACH_EVENTS = True
DEFAULT_TIMELINE_EVENT_TITLE = 'Timeline'


def create_category(category_name):
    category, created = FieldTimelineCategory.objects.get_or_create(
        category_name=category_name)
    return category


class Command(BaseCommand):
    help = 'Import FIELD timeline events from csv'
    verbose = 1  # show logging on screen

    min_row_length = 16
    events_created = 0
    events_updated = 0
    event_links = {}

    @staticmethod
    def import_rights(rights_file: Iterator[str]) -> str:
        """ Import rights tab into Dublin Core Rights object"""
        # rights_file = csv.reader(rightscsvfilename, delimiter=',')
        result = ''
        total_rights = 0
        for rights_line in rights_file:
            if rights_line and len(rights_line) == 2:
                DublinCoreRights.objects.get_or_create(
                    shorthand=rights_line[0],
                    statement=rights_line[1]
                )
                total_rights += 1
            else:
                result += "Bad rights line in csv: {}\n".format(rights_line)
        return result + "Total rights added/update {}\n".format(total_rights)

    def link_events(self) -> None:
        """Link together events based on dict built from csv"""

        for linker_id in self.event_links:
            # Get the event we're linking other events to
            linker_event = None
            try:
                linker_event = FieldTimelineEvent.objects.get(
                    unique_id=linker_id
                )
            except ObjectDoesNotExist:
                self.stdout.write("Linker event not found! ID P{}".format(
                    linker_id)
                )
            if linker_event:
                for linkee_id in self.event_links[linker_id]:
                    try:
                        # pdb.set_trace()
                        linkee_event = FieldTimelineEvent.objects.get(
                            unique_id=linkee_id.strip()
                        )
                        linker_event.linked_events.add(linkee_event)
                        if self.verbose == 1:
                            self.stdout.write(
                                "Event {} linked to {}\n".format(
                                    linkee_event.unique_id,
                                    linker_event.unique_id
                                )
                            )
                    except ObjectDoesNotExist:
                        self.stdout.write(
                            "Linkee event not found! ID {}".format(
                                linkee_id)
                        )

    def parse_resource_csv_line(self, line) -> None:
        if len(line[0]) > 0 and line[0].startswith("R"):
            resource_id = line[0]
            filename = line[1]
            try:
                resource = FieldTimelineResource.objects.get(
                    identifier=resource_id
                )
            except ObjectDoesNotExist:
                # New resource
                resource = FieldTimelineResource(
                    identifier=resource_id
                )
            resource.filename = filename
            resource.title = line[3]
            resource.date = line[4]

            resource.bibliographic_citation = line[15]
            # Lookup Dublin Core rights
            rights = DublinCoreRights.objects.filter(
                shorthand=line[8]
            )
            if rights and rights.count() > 0:
                resource.rights = rights[0]
            else:
                right, created = DublinCoreRights.objects.get_or_create(
                    shorthand=line[8],
                    statement=''
                )
                resource.rights = right
            resource.save()

            # Add creator/agents
            if line and len(line) > 5 and len(line[5]) > 0:
                # Add creator as DC Agent
                creator, create = DublinCoreAgent.objects.get_or_create(
                    full_name=line[5]
                )
                resource.creators.add(creator)
            # Add attached resource (currently only images)
            try:
                with open(
                        settings.MEDIA_ROOT
                        + settings.TIMELINE_IMAGE_FOLDER
                        + '/' + filename + '.'
                        + settings.TIMELINE_IMAGE_FORMAT,
                        'rb'
                ) as f:
                    image = Image(
                        title=line[0],
                        file=ImageFile(File(f), name=filename)
                    )
                    image.save()
                    if image and resource:
                        ri = FieldTimelineResourceImage(
                            resource=resource,
                            image=image
                        )
                        ri.save()
            except FileNotFoundError:
                self.stdout.write('File {} not found!'.format(filename))

    def parse_event_csv_line(self, line) -> None:
        # check for event id
        if len(line) >= self.min_row_length and len(line[1]) > 0:
            event_id = line[1]
            # Make sure this is an event id
            if line[1].startswith("F"):
                headline = line[6]
                text = line[7]
                tier = 0
                start_year = 0
                end_year = 0
                who = line[0]
                category_name = line[9]
                resource_id = line[11]
                category = None
                resource = None
                # Get/Create event category and resource
                if len(category_name) > 0:
                    category = create_category(category_name)
                if len(resource_id) > 0:
                    try:
                        resource = FieldTimelineResource.objects.get(
                            identifier=resource_id
                        )
                    except ObjectDoesNotExist:
                        self.stdout.write(
                            'Resource in event not found: {}'.format(
                                resource_id)
                        )
                if len(line[5]) > 0:
                    try:
                        if '-' in line[5]:
                            years = line[5].split('-')
                            start_year = int(years[0])
                            end_year = int(years[1])
                        else:
                            start_year = int(line[5])
                    except ValueError:
                        self.stdout.write('Bad year! {}'.format(line[5]))
                if len(line[10]) > 0:
                    try:
                        tier = int(line[10])
                    except ValueError:
                        self.stdout.write('Bad tier! {}'.format(line[10]))
                event, created = FieldTimelineEvent.objects.get_or_create(
                    unique_id=event_id,
                    tier=tier,
                    headline=headline,
                    text=text,
                    start_date_year=start_year,
                    end_date_year=end_year,
                    who=who,
                    additional_information=line[22]
                )
                if created:
                    self.events_created += 1
                else:
                    self.events_updated += 1

                # Attach category/event if present
                if category or resource:
                    if category:
                        event.category = category
                    if resource:
                        event.resource = resource
                if category or resource or created is False:
                    event.save()

                # If there are linked events, add them to the dict
                event_link_string = line[24]
                if event_link_string and len(event_link_string) > 0:
                    events_links = event_link_string.split(';')
                    self.event_links[event_id] = events_links

                # If the line has oral history information
                # create object and link it to event
                if len(line[16]) > 0:
                    oral_history, created = \
                        FieldOralHistory.objects.get_or_create(
                            timeline_event=event,
                            speaker=line[16],
                            place=line[17],
                            era=line[18],
                            text=line[19]
                        )
                    # Add rights if the exist
                    if oral_history and len(line[19]) > 0:
                        shorthand = line[19]
                        if 'Rights:' in shorthand:
                            shorthand = shorthand.replace('Rights:')
                        right, created = \
                            DublinCoreRights.objects.get_or_create(
                                shorthand=shorthand.lstrip()
                            )
                        oral_history.rights = right
                        oral_history.save()

    def add_arguments(self, parser) -> None:
        # csv file to parse
        parser.add_argument('csvfile', type=argparse.FileType('r'))
        parser.add_argument('resourcecsvfile', type=argparse.FileType('r'))
        parser.add_argument('rightsfile', type=argparse.FileType('r'))

    def attach_events_to_default_timeline(self):
        """ Convenience method for initial upload
        Checks if timeline page has been created, creates if not
        Then attaches all of the unattached events to it
        TOGGLE Off with ATTACH_EVENTS """
        if ATTACH_EVENTS:
            if FieldTimelinePage.objects.filter(
                    title=DEFAULT_TIMELINE_EVENT_TITLE).count() > 0:
                timeline_page = FieldTimelinePage.objects.get(
                    title=DEFAULT_TIMELINE_EVENT_TITLE
                )
            else:
                timeline_page, created = \
                    FieldTimelinePage.objects.get_or_create(
                        title=DEFAULT_TIMELINE_EVENT_TITLE,

                    )
            for event in FieldTimelineEvent.objects.all():
                FieldTimelineEventItem.objects.get_or_create(
                    page=timeline_page, event=event)

    def handle(self, *args, **options):
        # import rights tab
        self.import_rights(options['rightsfile'])
        resourcecsvfile = csv.reader(
            options['resourcecsvfile'], delimiter=',')
        csvfile = csv.reader(
            options['csvfile'], delimiter=',')

        # import DV resources from tab
        for resource_csv_line in resourcecsvfile:
            self.parse_resource_csv_line(resource_csv_line)

        # Import events
        x = 0
        for csv_line in csvfile:
            self.parse_event_csv_line(csv_line)
            x += 1
            print("{}\n".format(x))

        # Add event links
        if self.event_links and len(self.event_links) > 0:
            self.link_events()
        self.stdout.write("{} Events created, {} updated".format(
            self.events_created,
            self.events_updated
        ))
