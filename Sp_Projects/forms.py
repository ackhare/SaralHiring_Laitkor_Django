from django import forms
from django.forms import Textarea
from .models import Projects
from Sp_Project_Po.models import ProjectPoProjects_bin,ProjectPos,ProjectPo_Info
from django.contrib.admin import widgets
from Sp_ProjectClient.models import Project_client
from django.utils.translation import ugettext_lazy as _
from functools import partial
from Sp_Users.Utila import TeamOpr
from haystack.query import EmptySearchQuerySet, SearchQuerySet
DateInput = partial(forms.DateInput, {'class': 'datepicker'})


from import_export import resources




class Project_Form(forms.ModelForm):
    start_period = forms.DateField(widget=DateInput(),required=True)
    end_period = forms.DateField(widget=DateInput(),required=True)
    project_name=forms.CharField()
    project_code=forms.CharField()
    class Meta:
        model = Projects
        widgets = {
            'project_description': Textarea(attrs={'cols': 10, 'rows': 10}),
             'project_notes': Textarea(attrs={'cols': 10, 'rows': 10}),
        }
        fields=('project_name','project_code','is_active_project','start_period'
         ,'end_period','project_notes','project_description','project_tax_exempt','project_requires_po')


class ProjectPobin_Form(forms.ModelForm):
    class Meta:
        model = ProjectPoProjects_bin
        fields=('projects_id','projectClient_id','timeEntries_id','project_is_activated')



class ProjectPoInfo_Form(forms.ModelForm):
    class Meta:
        model =ProjectPo_Info
        fields=('statuswa',)

class ProjectPos_Form(forms.ModelForm):
    active_from = forms.DateField(widget=DateInput())
    active_to = forms.DateField(widget=DateInput())
    projectpo_number=forms.CharField()
    current_amount=forms.CharField()
    orignal_amount=forms.CharField()
    class Meta:
        model = ProjectPos
        fields=('projectpo_number','orignal_amount','current_amount','active_from','active_to','project_po_is_active')


class Project_Client_Form(forms.ModelForm):
    client_name=forms.CharField()
    class Meta:
        model = Project_client
        fields=('client_name',)

class SearchForm(forms.Form):
    client_name = forms.CharField(required=False, label=_('Search'),
                        widget=forms.TextInput(attrs={'type': 'search'}))
    project_name = forms.CharField(required=False, label=_('Search'),
                        widget=forms.TextInput(attrs={'type': 'search'}))
    project_code=forms.CharField(required=False, label=_('Search'),
                        widget=forms.TextInput(attrs={'type': 'search'}))
    start_pay_period = forms.CharField(required=False, label=_('Search'),
                        widget=forms.TextInput(attrs={'type': 'search'}))
    end_pay_period = forms.CharField(required=False, label=_('Search'),
                        widget=forms.TextInput(attrs={'type': 'search'}))

    CHOICES=[('on','on'),
         ('off','off')]

    is_billable = forms.ChoiceField(required=False,choices=CHOICES, widget=forms.RadioSelect())

    def __init__(self, *args, **kwargs):
        self.searchqueryset = kwargs.pop('searchqueryset', None)
        self.load_all = kwargs.pop('load_all', False)

        if self.searchqueryset is None:
            self.searchqueryset = SearchQuerySet().models(ProjectPoProjects_bin)

        super(SearchForm, self).__init__(*args, **kwargs)

    def no_query_found(self):
        """
        Determines the behavior when no query was found.

        By default, no results are returned (``EmptySearchQuerySet``).

        Should you want to show all results, override this method in your
        own ``SearchForm`` subclass and do ``return self.searchqueryset.all()``.
        """
        return EmptySearchQuerySet()

    def search(self):
        if not self.is_valid():
            return self.no_query_found()
        # We want "title: Foo AND (tags:bar OR tags:moof)"
        sqs=self.searchqueryset.all()
        str_client=""
        str_project_name=""
        str_project_code=""
        str_start_date=""
        str_start_date=""
        bill=""
        if self.cleaned_data['client_name']:
           str_client=self.cleaned_data['client_name']
        if self.cleaned_data['project_name']:
           str_project_name=self.cleaned_data['project_name']
        if self.cleaned_data['project_code']:
           str_project_code=self.cleaned_data['project_code']


        if self.cleaned_data['start_pay_period'] and self.cleaned_data['end_period']:

           str_start_date=self.cleaned_data['start_pay_period']
           str_end_date=self.cleaned_data['end_period']
         #singles
        if str_project_name:
           sqs = self.searchqueryset.filter(project_name=str_project_name)
           print(str_project_name)

        if str_project_code:
           sqs = self.searchqueryset.filter(project_code=str_project_code)

        if str_client:
           sqs = self.searchqueryset.filter(client_name=str_client)

        if str_start_date and str_end_date:
           sqs = self.searchqueryset.filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))

        #doubles
        if str_project_name and str_client:
           sqs = self.searchqueryset.filter(project_name=str_project_name,client_name=str_client)
        if str_project_code and str_client:
           sqs = self.searchqueryset.filter(project_code=str_project_code,client_name=str_client)
        if str_project_name and  str_start_date and str_end_date:
           sqs = self.searchqueryset.filter(project_name=str_project_name).filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))
        if str_project_code and  str_start_date and str_end_date:
           sqs = self.searchqueryset.filter(project_code=str_project_code).filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))
        if str_client and  str_start_date and str_end_date:
           sqs = self.searchqueryset.filter(client_name=str_client).filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))

        #triplets
        if str_project_name and str_client and str_start_date and str_end_date:
           sqs = self.searchqueryset.filter(project_name=str_project_name,client_name=str_client).filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))
        if str_project_code and str_client and str_start_date and str_end_date:
           sqs = self.searchqueryset.filter(project_code=str_project_code,client_name=str_client).filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))

        if str_project_code and str_project_name and str_start_date and str_end_date:
           sqs = self.searchqueryset.filter(project_code=str_project_code,project_name=str_project_name).filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))

        if str_project_code and str_project_name and str_client:
           sqs = self.searchqueryset.filter(project_code=str_project_code,project_name=str_project_name).filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))

        if str_client and str_start_date and str_end_date:
           sqs = self.searchqueryset.filter(client_name=str_client).filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))

        #quadrlets
        if str_client and str_project_name and str_project_code and str_start_date and str_end_date:
           sqs = self.searchqueryset.filter(client_name=str_client,project_code=str_project_code,project_name=str_project_name).filter(mydate__gte=TeamOpr.datFormatTimeCard(str_start_date),mydate__lt=TeamOpr.datFormatTimeCard(str_end_date))


        return sqs
    def no_query_found(self):
          return self.searchqueryset.all()
    def get_suggestion(self):
        if not self.is_valid():
            return None

        return self.searchqueryset.spelling_suggestion(self.cleaned_data['q'])

class ProjectTimeSearchForm(SearchForm):

      def no_query_found(self):
          return self.searchqueryset.all()









class SearchForm1(SearchForm):

    def __init__(self, *args, **kwargs):
        self.searchqueryset = kwargs.pop('searchqueryset', None)
        self.load_all = kwargs.pop('load_all', False)

        if self.searchqueryset is None:
            self.searchqueryset = SearchQuerySet().models(ProjectPoProjects_bin)

        super(SearchForm, self).__init__(*args, **kwargs)

    def no_query_found(self):
        """
        Determines the behavior when no query was found.

        By default, no results are returned (``EmptySearchQuerySet``).

        Should you want to show all results, override this method in your
        own ``SearchForm`` subclass and do ``return self.searchqueryset.all()``.
        """
        return EmptySearchQuerySet()

    def search(self,project):
        if not self.is_valid():
            return self.no_query_found()


        if self.cleaned_data['start_pay_period'] and self.cleaned_data['end_period']:

           str_start_date=self.cleaned_data['start_pay_period']
           str_end_date=self.cleaned_data['end_period']
         #singles
        if project:
           sqs = self.searchqueryset.filter(project_name=project)
        return sqs
    def no_query_found(self):
          return self.searchqueryset.all()
    def get_suggestion(self):
        if not self.is_valid():
            return None

        return self.searchqueryset.spelling_suggestion(self.cleaned_data['q'])

class ProjectTimeSearchForm_get(SearchForm1):

      def no_query_found(self):
          return self.searchqueryset.all()




class ExportForm(forms.Form):
    file_format = forms.ChoiceField(
            label=_('Format'),
            choices=(),
            )

    def __init__(self, formats, *args, **kwargs):
        super(ExportForm, self).__init__(*args, **kwargs)
        choices = []
        for i, f in enumerate(formats):
            choices.append((str(i), f().get_title(),))
        if len(formats) > 1:
            choices.insert(0, ('', '---'))

        self.fields['file_format'].choices = choices







