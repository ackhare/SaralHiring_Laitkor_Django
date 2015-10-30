# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('Sp_Projects', '__first__'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Sp_Companies', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Project_client',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, primary_key=True, verbose_name='ID')),
                ('client_name', models.CharField(blank=True, null=True, max_length=128, verbose_name='client_name')),
                ('client_id', models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('company_id', models.ForeignKey(blank=True, to='Sp_Companies.Companies', null=True)),
                ('projects_id', models.ForeignKey(unique=True, to='Sp_Projects.Projects')),
            ],
        ),
    ]
