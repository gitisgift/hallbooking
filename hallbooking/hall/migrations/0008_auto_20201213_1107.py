# Generated by Django 3.1.4 on 2020-12-13 11:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('hall', '0007_auto_20201213_0829'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bookhallrequest',
            name='found_hall',
        ),
        migrations.AddField(
            model_name='bookhallrequest',
            name='suggested_hall',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='hall.hall'),
        ),
    ]