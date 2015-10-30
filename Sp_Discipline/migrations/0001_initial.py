# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Disciplines',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('discipline_name', models.CharField(verbose_name='disipline_name', max_length=128, blank=True, null=True, unique=True)),
                ('abbr', models.CharField(verbose_name='abbreviations', max_length=128, blank=True, null=True, unique=True)),
                ('desc', models.TextField(verbose_name='desciption', max_length=128, blank=True, null=True, unique=True)),
                ('is_active_dis', models.BooleanField(verbose_name='is_active_disc', default='False')),
            ],
        ),
    ]
