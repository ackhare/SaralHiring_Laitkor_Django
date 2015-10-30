# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('Sp_Projects', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Teams',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, primary_key=True, auto_created=True)),
                ('disc_ids', models.CharField(null=True, max_length=128, verbose_name='UserIds', blank=True)),
                ('default_dis_id', models.CharField(null=True, max_length=128, verbose_name='UserId_default', blank=True)),
                ('team_member_id', models.CharField(null=True, max_length=128, verbose_name='team_mem_id', blank=True)),
                ('full_name', models.CharField(null=True, max_length=128, verbose_name='full_name', blank=True)),
                ('project_id', models.ForeignKey(to='Sp_Projects.Projects', blank=True, null=True)),
                ('user_id', models.ForeignKey(to=settings.AUTH_USER_MODEL, blank=True, null=True)),
            ],
        ),
    ]
