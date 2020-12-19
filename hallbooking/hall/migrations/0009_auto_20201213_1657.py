# Generated by Django 3.1.4 on 2020-12-13 16:57

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('hall', '0008_auto_20201213_1107'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='bookhallrequest',
            options={'ordering': ('id',)},
        ),
        migrations.AddField(
            model_name='bookhallrequest',
            name='hall_q',
            field=models.IntegerField(default=1),
        ),
        migrations.AlterField(
            model_name='booked',
            name='hallrequest',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='booked_request', to='hall.bookhallrequest'),
        ),
        migrations.AlterField(
            model_name='bookhallrequest',
            name='end_date',
            field=models.DateTimeField(help_text='please use date time format like %d-%m-%Y %I:%M %p'),
        ),
        migrations.AlterField(
            model_name='bookhallrequest',
            name='start_date',
            field=models.DateTimeField(default=django.utils.timezone.now, help_text='please use date time format %d-%m-%Y %I:%M %p'),
        ),
    ]
