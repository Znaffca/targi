# Generated by Django 2.1.5 on 2019-02-01 16:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('targi', '0002_auto_20190201_1420'),
    ]

    operations = [
        migrations.AddField(
            model_name='market',
            name='photo_1',
            field=models.ImageField(blank=True, null=True, upload_to='photos/', verbose_name='Zdjęcie główne'),
        ),
    ]