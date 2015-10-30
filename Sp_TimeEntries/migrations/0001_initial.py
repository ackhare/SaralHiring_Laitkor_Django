# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('Sp_Companies', '0001_initial'),
        ('Sp_Projects', '0001_initial'),
        ('Sp_ProjectClient', '0001_initial'),
        ('Sp_Discipline', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Events',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', auto_created=True, serialize=False)),
                ('notes', models.CharField(max_length=128, verbose_name='notes', blank=True, null=True)),
                ('events', models.CharField(max_length=128, verbose_name='events', blank=True, null=True)),
                ('start_period', models.DateField(verbose_name='start_period', default=datetime.datetime(2015, 8, 28, 11, 24, 33, 515474))),
                ('end_period', models.DateField(verbose_name='end_period', default=datetime.datetime(2015, 8, 28, 11, 24, 33, 515502))),
                ('project_id', models.ForeignKey(blank=True, to='Sp_Projects.Projects', null=True)),
                ('user_id', models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='TimeEntries',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', auto_created=True, serialize=False)),
                ('flag_value_billable', models.CharField(max_length=128, verbose_name='flag_value_billable', blank=True, null=True)),
                ('discipline_id', models.ForeignKey(blank=True, to='Sp_Discipline.Disciplines', null=True)),
                ('my_Pro_client_id', models.ForeignKey(blank=True, to='Sp_ProjectClient.Project_client', null=True)),
                ('payperiod_id', models.ForeignKey(unique=True, to='Sp_Companies.PayPeriod', null=True, blank=True)),
                ('project_id', models.ForeignKey(blank=True, to='Sp_Projects.Projects', null=True)),
                ('user_id', models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
        ),
    ]
