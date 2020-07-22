# from django.http import HttpResponse
# import json
# from django.urls import reverse
# from django.http import HttpResponse
# from django.views.generic import TemplateView, View
#
# from field_timeline.models import FieldTimelineEvent


# Create your views here.


# class TimelineTemplateView(TemplateView):
#     """
#     FIELD Time line view using Timeline JS 3 """
#     template_name = 'field_timeline/timeline.html'
#
#
#     def get_timeline_json_url(self, request):
#         timeline_url = reverse('timeline_json')
#         # Add filter GET variable
#         filters = ''
#         if 'category' in request.GET:
#             filters='category={}'.format(request.GET['category'])
#         if len(filters) > 0:
#             timeline_url+='?'+filters
#         return timeline_url
#
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context["ev_target_class"] = FieldTimelineEvent.ev_target_class
#         context['timeline_json_url'] = self.get_timeline_json_url(
#             self.request)
#         return context
#
#
# class TimelineJSONView(View):
#     """
#     Return events as JSON for async requests
#     """
#
#
#     def get_events(self, request):
#         """
#         Get events based on http request
#         Add them to the current context
#         :param request:request with filter args
#         :return: queryset of FieldTimelineEvent objects
#         """
#
#         # get event objects
#         events = FieldTimelineEvent.objects.all()
#         # Add filtering
#         if 'category' in request.GET:
#             if len(request.GET['category']) > 0:
#                 events.filter(category__category_name=request.GET['category'])
#         return events
#
#     def events_to_slides(self, events):
#         """Convert a FieldTimelineEvent object queryset into a list of
#         slides using FieldTimelineEvent.get_timeline_data()
#         :return: list of dicts for timeline slides
#         """
#         slides = list()
#         for event in events:
#             slides.append(event.get_timeline_data())
#         return slides
#
#     def get(self, request, *args, **kwargs):
#         events = self.get_events(request)
#         slides = list()
#         if events:
#             slides = self.events_to_slides(events)
#         timeline = {'events': slides}
#         return HttpResponse(json.dumps(timeline),
#                             content_type='application/json')
