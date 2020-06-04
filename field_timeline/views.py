from django.shortcuts import render
from django.views.generic import TemplateView,View

# Create your views here.

def getEvents(request,context):
    """
    Get events based on http request
    Add them to the current context
    :param request:request with filter args
    :param context:
    :return: context
    """
    # todo: Add filtering
    #         # get event objects
    return context

class TimelineView(TemplateView):
    """
    FIELD Time line view using Timeline JS 3
    """
    template_name = 'field_timeline/timeline.html'


    def get_context_data(self, **kwargs):
        context = super(TimelineView, self).get_context_data(**kwargs)
        return context

    def get(self, request, *args, **kwargs):

        render(request,self.template_name)

