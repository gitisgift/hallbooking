# Generated by Django 3.1.4 on 2020-12-12 20:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('hall', '0005_auto_20201213_0119'),
    ]

    operations = [
        migrations.AlterField(
            model_name='booked',
            name='hallrequest',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='booked_request', to='hall.bookhallrequest'),
        ),
    ]