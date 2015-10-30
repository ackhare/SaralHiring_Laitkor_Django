# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('Sp_ProjectClient', '0001_initial'),
        ('Sp_TimeEntries', '__first__'),
        ('Sp_Projects', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProjectPo_Info',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('statuswa', models.CharField(max_length=128, blank=True, verbose_name='statuswa', null=True)),
                ('current_date', models.DateTimeField(default=datetime.date(2015, 8, 28), verbose_name='current_date')),
                ('last_changed_date', models.DateTimeField(default=datetime.date(2015, 8, 28), verbose_name='last_changed_date')),
            ],
        ),
        migrations.CreateModel(
            name='ProjectPoProjects_bin',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('project_is_activated', models.BooleanField(default='False', verbose_name='project_is_activated')),
                ('projectClient_id', models.ForeignKey(to='Sp_ProjectClient.Project_client', blank=True, null=True)),
                ('projects_id', models.ForeignKey(to='Sp_Projects.Projects', blank=True, null=True)),
                ('timeEntries_id', models.ForeignKey(to='Sp_TimeEntries.TimeEntries', blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='ProjectPos',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('projectpo_number', models.CharField(null=True, max_length=128, blank=True, verbose_name='projectpo_number', unique=True)),
                ('active_from', models.DateField(max_length=128, blank=True, verbose_name='active_from', null=True)),
                ('active_to', models.DateField(max_length=128, blank=True, verbose_name='active_to', null=True)),
                ('project_po_is_active', models.BooleanField(default='False', verbose_name='project_po_is_active')),
                ('orignal_amount', models.CharField(max_length=128, blank=True, verbose_name='orignal_amount', null=True)),
                ('current_amount', models.CharField(max_length=128, blank=True, verbose_name='current_amount', null=True)),
                ('created_by', models.CharField(max_length=128, blank=True, verbose_name='created_by', null=True)),
            ],
        ),
        migrations.AddField(
            model_name='projectpo_info',
            name='projectpos_id',
            field=models.ForeignKey(to='Sp_Project_Po.ProjectPos', blank=True, null=True),
        ),
        migrations.AddField(
            model_name='projectpo_info',
            name='projects_id',
            field=models.ForeignKey(to='Sp_Projects.Projects', blank=True, null=True),
        ),
    ]
