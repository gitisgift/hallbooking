# Generated by Django 3.1.4 on 2020-12-12 19:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hall', '0003_remove_hall_is_booked'),
    ]

    operations = [
        migrations.AddField(
            model_name='bookhallrequest',
            name='found_hall',
            field=models.BooleanField(default=False),
        ),
    ]
