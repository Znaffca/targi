# Generated by Django 2.1.5 on 2019-02-05 17:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('targi', '0004_uploadfile'),
    ]

    operations = [
        migrations.RenameField(
            model_name='uploadfile',
            old_name='photo',
            new_name='file',
        ),
    ]
