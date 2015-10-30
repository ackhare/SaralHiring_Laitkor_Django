# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Sp_Companies', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Divisions',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, primary_key=True, auto_created=True)),
                ('description', models.CharField(verbose_name='description', blank=True, null=True, max_length=128)),
                ('division_name', models.CharField(verbose_name='division_name', unique=True, null=True, blank=True, max_length=128)),
                ('user_who_created', models.ForeignKey(blank=True, null=True, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'divisions',
                'verbose_name_plural': 'Divisions',
            },
        ),
        migrations.CreateModel(
            name='DivisionsCompany_join',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, primary_key=True, auto_created=True)),
                ('primary_contact', models.CharField(verbose_name='primary_contact', blank=True, null=True, max_length=128)),
                ('is_active', models.BooleanField(verbose_name='is_active', default='False')),
                ('company_id', models.ForeignKey(blank=True, null=True, to='Sp_Companies.Companies')),
                ('division_id', models.ForeignKey(blank=True, null=True, to='Sp_Divisions.Divisions')),
                ('primary_contact_id', models.ForeignKey(blank=True, null=True, to=settings.AUTH_USER_MODEL, max_length=128)),
            ],
        ),
    ]
