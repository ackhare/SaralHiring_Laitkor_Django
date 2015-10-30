# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Sp_Contacts', '__first__'),
    ]

    operations = [
        migrations.CreateModel(
            name='Companies',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('company_name', models.CharField(verbose_name='company_name', max_length=128, blank=True, null=True)),
                ('company_short_name', models.CharField(verbose_name='company_short_name', max_length=128, blank=True, null=True)),
                ('company_code', models.CharField(verbose_name='company_code', max_length=128, unique=True, blank=True, null=True)),
                ('contact_id', models.ForeignKey(blank=True, to='Sp_Contacts.Contacts', unique=True, null=True)),
            ],
            options={
                'verbose_name_plural': 'Company',
                'verbose_name': 'Company',
            },
        ),
        migrations.CreateModel(
            name='PayPeriod',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('start_payp', models.CharField(verbose_name='start_payperioid', max_length=128, blank=True, null=True)),
                ('end_payp', models.CharField(verbose_name='end_payperiod', max_length=128, blank=True, null=True)),
                ('duration', models.CharField(verbose_name='duration', max_length=128, blank=True, null=True)),
                ('description', models.CharField(verbose_name='description', max_length=128, blank=True, null=True)),
                ('date_of_day', models.CharField(verbose_name='date_of_day', max_length=128, blank=True, null=True)),
                ('did_proj_manag', models.BooleanField(verbose_name='did_proj_manag', default=False)),
            ],
        ),
    ]
