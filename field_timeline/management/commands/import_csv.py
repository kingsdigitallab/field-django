"""
Import FIELD timeline events from csv

KDL (EH) 3/6/2020

"""
import argparse
import csv
import pdb
from django.core.exceptions import ObjectDoesNotExist
from django.core.management.base import BaseCommand, CommandError
from field_timeline.models import (TimelineSlide, FieldTimelineEvent,
                                   FieldTimelineResource, FieldTimelineCategory
                                   )


def create_category(category_name):
    category, created = FieldTimelineCategory.objects.get_or_create(
        category_name=category_name)
    return category




class Command(BaseCommand):

    help = 'Import FIELD timeline events from csv'
    verbose = 1 # show logging on screen

    min_row_length = 16
    events_created = 0
    events_updated = 0
    event_links = {}

    def link_events(self):
        """Link together events based on dict built from csv"""

        for linker_id in self.event_links:
            # Get the event we're linking other events to
            linker_event = None
            try:
                linker_event = FieldTimelineEvent.objects.get(
                    unique_id=linker_id
                )
            except ObjectDoesNotExist as ex:
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
                    except ObjectDoesNotExist as ex:
                        self.stdout.write(
                            "Linkee event not found! ID {}".format(
                                linkee_id)
                        )


    def parse_csv_line(self,line):
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
                image_ref = line[12]
                caption = line[13]
                photographer = line[14]
                credit = line[15]
                url = line[16]
                category = None
                resource = None
                # Get/Create event category
                if len(category_name) > 0:
                    category = create_category(category_name)
                # Get/create resource
                if len(resource_id) > 0:
                    resource, created = \
                        FieldTimelineResource.objects.get_or_create(
                        resource_id=resource_id,
                        image_ref=image_ref,
                        caption=caption,
                        photographer=photographer,
                        credit=credit,
                        url=url
                    )
                if len(line[5]) > 0:
                    try:
                        if '-' in line[5]:
                            years=line[5].split('-')
                            start_year = int(years[0])
                            end_year = int(years[1])
                        else:
                            start_year = int(line[5])
                    except ValueError as verr:
                        self.stdout.write('Bad year! {}'.format(line[5]))
                if len(line[10]) > 0:
                    try:
                        tier = int(line[10])
                    except ValueError as verr:
                        self.stdout.write('Bad tier! {}'.format(line[10]))
                event, created = FieldTimelineEvent.objects.get_or_create(
                    unique_id=event_id,
                    tier=tier,
                    headline=headline,
                    text=text,
                    start_date_year=start_year,
                    end_date_year=end_year,
                    who=who
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
                if category or resource or created == False:
                    event.save()

                #If there are linked events, add them to the dict
                event_link_string = line[24]
                if event_link_string and len(event_link_string) > 0:
                    events_links = event_link_string.split(';')
                    self.event_links[event_id] = events_links

    def add_arguments(self, parser):
        # csv file to parse
        parser.add_argument('csvfile', type=argparse.FileType('r'))


    def handle(self, *args, **options):
        csvfile = csv.reader(options['csvfile'], delimiter=',')
        # for each line in csv
        x = 0
        for csv_line in csvfile:
            self.parse_csv_line(csv_line)
            x+=1
            print("{}\n".format(x))
        # Add event links
        if self.event_links and len(self.event_links) > 0:
            self.link_events()
        self.stdout.write("{} Events created, {} updated".format(
            self.events_created,
            self.events_updated
        ))