# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import django.utils.timezone
import Sp_Users.models


class Migration(migrations.Migration):

    dependencies = [
        ('Sp_Companies', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Files',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('user_files', models.FileField(max_length=128, null=True, blank=True, upload_to=Sp_Users.models.get_upload_path)),
                ('user_id', models.ForeignKey(to=settings.AUTH_USER_MODEL, null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Roles',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('roles', models.CharField(verbose_name='roles', max_length=128, null=True, blank=True)),
            ],
            options={
                'verbose_name': 'Roles',
                'verbose_name_plural': 'Roles',
            },
        ),
        migrations.CreateModel(
            name='UserRelations',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('relationName', models.CharField(verbose_name='relationName', max_length=128, null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('disciplines', models.CharField(verbose_name='disciplines', max_length=128, null=True, blank=True)),
                ('alternate_email', models.CharField(verbose_name='alternate_email', max_length=128, null=True, blank=True)),
                ('intials', models.CharField(verbose_name='intials', max_length=128, null=True, blank=True)),
                ('phone_work', models.CharField(verbose_name='phone work', max_length=128, null=True, blank=True)),
                ('phone_cell', models.CharField(verbose_name='phone cell', max_length=128, null=True, blank=True)),
                ('phone_fax', models.CharField(verbose_name='phone fax', max_length=128, null=True, blank=True)),
                ('mail_adress1', models.CharField(verbose_name='mail adress1', max_length=128, null=True, blank=True)),
                ('mail_adress2', models.CharField(verbose_name='mail adress2', max_length=128, null=True, blank=True)),
                ('city', models.CharField(verbose_name='city', max_length=128, null=True, blank=True)),
                ('state', models.CharField(verbose_name='state', max_length=128, null=True, blank=True)),
                ('billing_adress1', models.CharField(verbose_name='billing adress1', max_length=128, null=True, blank=True)),
                ('billing_adress2', models.CharField(verbose_name='billing adress2', max_length=128, null=True, blank=True)),
                ('zip', models.CharField(verbose_name='zip', max_length=128, null=True, blank=True)),
                ('date_joined', models.DateTimeField(verbose_name='date joined', default=django.utils.timezone.now)),
                ('activation_key', models.TextField(max_length=40, null=True, blank=True)),
                ('key_expires', models.DateTimeField(verbose_name='key_expires', default=django.utils.timezone.now)),
                ('profile_image', models.ImageField(max_length=128, null=True, blank=True, upload_to=Sp_Users.models.get_upload_path)),
                ('has_pm_previ', models.BooleanField(verbose_name='has_pm_previ', default=False)),
                ('is_absolute_admin', models.BooleanField(verbose_name='is_absolute_admin', default=False)),
                ('company_id', models.ForeignKey(to='Sp_Companies.Companies', null=True, blank=True)),
                ('role_id', models.ForeignKey(to='Sp_Users.Roles', null=True, blank=True)),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
                ('userrelation_id', models.ForeignKey(to='Sp_Users.UserRelations', null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Vacations',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('vacation_duration', models.CharField(verbose_name='vacation_duration', max_length=128, null=True, blank=True)),
                ('vacation_taken', models.CharField(verbose_name='vacation_taken', max_length=128, null=True, blank=True)),
                ('vacation_start_date', models.DateField(verbose_name='vacation_start', default=django.utils.timezone.now)),
                ('vacation_end_date', models.DateField(verbose_name='vacation_end', default=django.utils.timezone.now)),
                ('total_vacation', models.CharField(verbose_name='total_vacation', max_length=128, null=True, blank=True)),
                ('user_id', models.ForeignKey(to=settings.AUTH_USER_MODEL, null=True, blank=True)),
            ],
        ),
    ]
