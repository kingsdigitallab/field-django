from mailchimp3.mailchimpclient import MailChimpError
from mailchimp3 import MailChimp
from django.conf import settings

# OK < 100
MC_SUBSCRIBED = 1
MC_UNSUBSCRIBED = 2
MC_RESUBSCRIBED = 3
MC_PENDING = 4
# ERROR > 100
# permanently deleted, we can't re-subscribe them with the API it seems
# only the user can re-sub with a mailchimp form
MC_CLEANED = 101
MC_ERROR_IN_MC = 201
MC_MEMBER_EXISTS = 202


class MailingList(object):

    def __init__(self):
        self.client = MailChimp(settings.MAILCHIMP_API_KEY)

    def subscribe(self, user):
        '''
        (Re)subscribe a user to a Mailchimp newsletter

        merge_vars = {
            'EMAIL': '',
            'FNAME': '',
            'LNAME': '',
            'ORG': '',
        }

        Returns one of the MC_XXX code see const above:
            MC_SUBSCRIBED
            MC_RESUBSCRIBED
            MC_CLEANED

        Newsletter id and mailchimp account id should be set up in settings.py

        //developer.mailchimp.com/documentation/mailchimp/reference/lists/members/

        create_or_update() would be a convenient call to do anything in one
        single request. However we can't do that as it would allow anyone with
        your email address to change your first and last name in the list.
        So we need to set the names only when the member is created (as it
        requires email verification). We thus have to separate the two cases:
        the user already exists in the list or they don't.
        '''
        ret = self._create_user(user)
        print('create', ret)
        if ret in [MC_MEMBER_EXISTS]:
            ret = self._update_user(user)
            print('update', ret)
        return ret

    def _create_user(self, user):
        ret = MC_ERROR_IN_MC

        try:
            res = self.client.lists.members.create(
                settings.MAILCHIMP_LIST_ID,
                {
                    'email_address': user['EMAIL'],
                    'status': 'subscribed',
                    'merge_fields': user,
                }
            )
            if res['status'] == 'subscribed':
                ret = MC_SUBSCRIBED
        except MailChimpError as e:
            # print('args', e.args)
            error = e.args[0]
            if error['status'] == 400 and error['title'] == 'Member Exists':
                ret = MC_MEMBER_EXISTS
            elif (
                    error['status'] == 400
                    and error['title'] == 'Forgotten Email Not Subscribed'):
                ret = MC_CLEANED
            else:
                raise e

        return ret

    def _update_user(self, user):
        ret = MC_ERROR_IN_MC

        import hashlib

        hash = hashlib.md5(user['EMAIL'].lower().encode('utf')).hexdigest()

        try:
            res = self.client.lists.members.update(
                settings.MAILCHIMP_LIST_ID,
                hash,
                {
                    'email_address': user['EMAIL'],
                    'status': 'subscribed',
                }
            )
            # print(res)
            if res['status'] == 'subscribed':
                ret = MC_SUBSCRIBED
        except MailChimpError as e:
            # print(e.args)
            raise e

        return ret
