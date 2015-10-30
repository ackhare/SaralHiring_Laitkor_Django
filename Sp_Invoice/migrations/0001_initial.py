# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('Sp_Projects', '__first__'),
        ('Sp_Project_Po', '__first__'),
        ('Sp_Companies', '0001_initial'),
        ('Sp_Divisions', '0001_initial'),
        ('Sp_TimeEntries', '__first__'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Invoice_Reports',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('comments', models.CharField(verbose_name='user_comments', blank=True, null=True, max_length=128)),
                ('is_billable', models.CharField(verbose_name='is_bilable', blank=True, null=True, max_length=128)),
                ('duration_per_user', models.CharField(verbose_name='duration_per_user', blank=True, null=True, max_length=128)),
                ('discipline_per_user', models.CharField(verbose_name='discipline_per_user', blank=True, null=True, max_length=128)),
                ('last_edited', models.DateTimeField(verbose_name='last_edited', default=datetime.datetime(2015, 8, 28, 11, 23, 40, 77918))),
            ],
        ),
        migrations.CreateModel(
            name='InvoiceHeaders',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('invoice_number', models.CharField(verbose_name='invoice_number', blank=True, unique=True, null=True, max_length=128)),
                ('invoice_date', models.DateTimeField(verbose_name='invoice_date', blank=True, null=True)),
                ('invoice_amount', models.CharField(verbose_name='invoice_amount', blank=True, null=True, max_length=128)),
                ('project_totals', models.CharField(verbose_name='project_totals', blank=True, null=True, max_length=128)),
                ('client_totals', models.CharField(verbose_name='client_totals', blank=True, null=True, max_length=128)),
                ('comments', models.CharField(verbose_name='comments', blank=True, null=True, max_length=128)),
                ('statuswa', models.CharField(verbose_name='statuswa', blank=True, null=True, max_length=128)),
                ('created_by', models.CharField(verbose_name='created_by', blank=True, null=True, max_length=128)),
                ('companies_id', models.ForeignKey(to='Sp_Companies.Companies', blank=True, null=True)),
                ('divisions_id', models.ForeignKey(to='Sp_Divisions.Divisions', blank=True, null=True)),
                ('projectpo_id', models.ForeignKey(to='Sp_Project_Po.ProjectPos', blank=True, null=True)),
                ('projects_id', models.ForeignKey(to='Sp_Projects.Projects', blank=True, null=True)),
                ('user_id', models.ForeignKey(to=settings.AUTH_USER_MODEL, blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='InvoiceLines',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('invoice_comments', models.CharField(verbose_name='invoice_comments', blank=True, null=True, max_length=128)),
                ('invoiceHeaders_id', models.ForeignKey(to='Sp_Invoice.InvoiceHeaders', blank=True, null=True)),
                ('timeEntriers_id', models.ForeignKey(unique=True, to='Sp_TimeEntries.TimeEntries', blank=True, null=True)),
            ],
        ),
        migrations.AddField(
            model_name='invoice_reports',
            name='invoice_id',
            field=models.ForeignKey(to='Sp_Invoice.InvoiceHeaders', blank=True, null=True),
        ),
        migrations.AddField(
            model_name='invoice_reports',
            name='project_po_info',
            field=models.ForeignKey(to='Sp_Project_Po.ProjectPos', blank=True, null=True),
        ),
        migrations.AddField(
            model_name='invoice_reports',
            name='timeEntries_id',
            field=models.ForeignKey(to='Sp_TimeEntries.TimeEntries', blank=True, null=True),
        ),
        migrations.AddField(
            model_name='invoice_reports',
            name='user_id',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL, blank=True, null=True, max_length=128),
        ),
    ]
