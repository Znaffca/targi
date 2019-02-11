from django.contrib import admin
from targi.models import Market, TownAndCities, Products, Article, PhotoAlbum, UploadFile, UserProfile

admin.site.register(Market)
admin.site.register(TownAndCities)
admin.site.register(Products)
admin.site.register(Article)
admin.site.register(PhotoAlbum)
admin.site.register(UploadFile)
admin.site.register(UserProfile)
