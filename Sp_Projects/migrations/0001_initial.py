# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.conf import settings
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('Sp_Contacts', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Sp_Divisions', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Projects',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('project_code', models.CharField(blank=True, unique=True, verbose_name='project_code', null=True, max_length=128)),
                ('project_name', models.CharField(blank=True, verbose_name='project_name', null=True, max_length=128)),
                ('client_billable_hrs', models.TimeField(blank=True, verbose_name='client_billable_hrs', null=True)),
                ('non_billable_hrs', models.TimeField(blank=True, verbose_name='non_biallable_hrs', null=True)),
                ('project_description', models.TextField(blank=True, verbose_name='project_description', null=True, max_length=128)),
                ('created_date', models.DateTimeField(default=datetime.date(2015, 8, 28), verbose_name='created_date')),
                ('last_updat', models.DateTimeField(default=datetime.date(2015, 8, 28), verbose_name='last_updated')),
                ('start_period', models.DateTimeField(default=django.utils.timezone.now, verbose_name='start_period')),
                ('recently_viewed', models.DateTimeField(default=django.utils.timezone.now, verbose_name='recently_viewed')),
                ('end_period', models.DateTimeField(default=django.utils.timezone.now, verbose_name='end_period')),
                ('project_notes', models.TextField(blank=True, verbose_name='project_notes', null=True, max_length=128)),
                ('is_archived', models.BooleanField(default='False', verbose_name='is_archived')),
                ('was_recently_viewed', models.BooleanField(default='False', verbose_name='was_recently_viewed')),
                ('is_active_project', models.BooleanField(default='False', verbose_name='is_active_project')),
                ('project_tax_exempt', models.BooleanField(default='False', verbose_name='project_tax_exempt')),
                ('project_requires_po', models.BooleanField(default='False', verbose_name='project_requires_po')),
                ('related_projects', models.CharField(blank=True, verbose_name='related_projects', null=True, max_length=128)),
                ('team_ids', models.CharField(blank=True, verbose_name='team_ids', null=True, max_length=128)),
                ('contacts_id', models.ForeignKey(to='Sp_Contacts.Contacts', blank=True, null=True)),
                ('division_id', models.ForeignKey(to='Sp_Divisions.Divisions', blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Projects_PM',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('pm_id', models.ForeignKey(to=settings.AUTH_USER_MODEL, blank=True, null=True)),
            ],
        ),
        migrations.AddField(
            model_name='projects',
            name='pro_pm',
            field=models.ForeignKey(to='Sp_Projects.Projects_PM', blank=True, null=True),
        ),
        migrations.AddField(
            model_name='projects',
            name='user_id',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL, blank=True, null=True),
        ),
    ]
