# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Contacts',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('primary_contact', models.CharField(blank=True, max_length=128, null=True, verbose_name='primary_contact')),
                ('secondary_contact', models.CharField(blank=True, max_length=128, null=True, verbose_name='secondary_contact')),
                ('user_id', models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
                'verbose_name': 'Contacts',
                'verbose_name_plural': 'Contacts',
            },
        ),
    ]
