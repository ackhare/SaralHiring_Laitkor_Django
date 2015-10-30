# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
    ]

    operations = [
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, verbose_name='ID', serialize=False)),
                ('title', models.CharField(max_length=32, verbose_name='title')),
                ('description', models.CharField(max_length=100, verbose_name='description')),
            ],
            options={
                'verbose_name_plural': 'events',
                'verbose_name': 'event',
                'ordering': ('title',),
            },
        ),
        migrations.CreateModel(
            name='EventType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, verbose_name='ID', serialize=False)),
                ('abbr', models.CharField(max_length=4, unique=True, verbose_name='abbreviation')),
                ('label', models.CharField(max_length=50, verbose_name='label')),
            ],
            options={
                'verbose_name_plural': 'event types',
                'verbose_name': 'event type',
            },
        ),
        migrations.CreateModel(
            name='Note',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, verbose_name='ID', serialize=False)),
                ('note', models.TextField(verbose_name='note')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='created')),
                ('object_id', models.PositiveIntegerField(verbose_name='object id')),
                ('content_type', models.ForeignKey(to='contenttypes.ContentType', verbose_name='content type')),
            ],
            options={
                'verbose_name_plural': 'notes',
                'verbose_name': 'note',
            },
        ),
        migrations.CreateModel(
            name='Occurrence',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, verbose_name='ID', serialize=False)),
                ('start_time', models.DateTimeField(verbose_name='start time')),
                ('end_time', models.DateTimeField(verbose_name='end time')),
                ('event', models.ForeignKey(to='swingtime.Event', editable=False, verbose_name='event')),
            ],
            options={
                'verbose_name_plural': 'occurrences',
                'verbose_name': 'occurrence',
                'ordering': ('start_time', 'end_time'),
            },
        ),
        migrations.AddField(
            model_name='event',
            name='event_type',
            field=models.ForeignKey(to='swingtime.EventType', verbose_name='event type'),
        ),
    ]
