from django.db import models
from django.db.models import DO_NOTHING
from django.template.defaultfilters import slugify

# Create your models here.

# Province list created. List is constant so  all values we're putted to list of tuples

PROVINCE_CHOICES = (
    ('DS', 'dolnośląskie'),
    ('LB', 'lubelskie'),
    ('LD', 'łódzkie'),
    ('MZ', 'mazowieckie'),
    ('PK', 'podkarpackie'),
    ('PM', 'pomorskie'),
    ('SK', 'świętokrzyskie'),
    ('WP', 'wielkopolskie'),
    ('KP', 'kujawsko-pomorskie'),
    ('LS', 'lubuskie'),
    ('MP', 'małopolskie'),
    ('OP', 'opolskie'),
    ('PL', 'podlaskie'),
    ('SL', 'śląskie'),
    ('WM', 'warmińsko-mazurskie'),
    ('zp', 'zachodniopomorskie'),
)

MARKET_PARKING = (
    (1, "Brak"),
    (2, "Płatny strzeżony"),
    (3, "Płatny niestrzeżony"),
    (4, "Bezpłatny"),
)

BOOLEANS = (
    (1, "Tak"),
    (2, "Nie"),
    (3, "Brak informacji"),
)

CHOICES = (
    (1, "Tak"),
    (2, "Częściowo"),
    (3, "Nie"),
    (4, "Brak informacji"),
)

MARKET_TYPE = (
    (1, 'Targowisko'),
    (2, 'Ryneczek'),
    (3, 'Giełda tematyczna'),
    (4, 'Jarmark okoliczościowy'),
    (5, 'Targi branżowe'),
    (6, 'Rzemieślnik'),
    (7, 'Centrum Handlowe'),
    (8, 'Giełda rolno-towarowa'),
)


class TownAndCities(models.Model):
    name = models.CharField(max_length=32)
    province = models.CharField(max_length=2, choices=PROVINCE_CHOICES)

    def __str__(self):
        return f'{self.name}'


class Products(models.Model):
    category = models.CharField(max_length=32)
    icon = models.FileField(upload_to='icons', blank=True, null=True)

    def __str__(self):
        return f'{self.category}'


class PhotoAlbum(models.Model):
    market = models.ForeignKey('Market', on_delete=models.CASCADE, related_name="market_id", verbose_name="Targ")
    photo = models.ImageField(upload_to='add_photos/', blank=True, null=True, verbose_name="Zdjęcia")
    uploaded = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.market.name}, image: {self.photo}'


class Market(models.Model):
    name = models.CharField(max_length=64, verbose_name="Nazwa")
    slug = models.SlugField(max_length=64, unique=True)
    type = models.IntegerField(choices=MARKET_TYPE, verbose_name="Rodzaj")
    products = models.ManyToManyField(Products, verbose_name="Przedmiot handlu")
    town_city = models.ForeignKey(TownAndCities, related_name="town_address",
                                  verbose_name="Miejscowość", on_delete=DO_NOTHING)
    administrator = models.CharField(max_length=255, verbose_name="Zarządca")
    address = models.CharField(max_length=128, verbose_name="Adres")
    geolocation = models.CharField(max_length=64, verbose_name="Współrzędne geograficzne")
    is_active = models.BooleanField(default=True, verbose_name="Czy jest czynne")
    cured_area = models.IntegerField(choices=CHOICES, verbose_name="Utwardzona nawierzchnia")
    is_indoor = models.IntegerField(choices=CHOICES, verbose_name="Zadaszenie przejść")
    handicaps = models.IntegerField(choices=CHOICES, verbose_name="Udogodnienia dla niepełnosprawnych")
    is_toilet = models.BooleanField(verbose_name="Toalety")
    public_transport = models.BooleanField(verbose_name="Zasięg transportu publicznego")
    taxi_range = models.BooleanField(verbose_name="Zasięg taxi")
    parking = models.IntegerField(choices=MARKET_PARKING, default=1, verbose_name="Parking")
    cycle_places = models.BooleanField(verbose_name="Miejsca dla rowerów")
    radio_info = models.BooleanField(verbose_name="Radiowęzeł")
    atm_nearby = models.BooleanField(verbose_name="Bankomat w pobliżu")
    date_added = models.DateTimeField(auto_now_add=True)
    description = models.TextField(verbose_name="Opis")
    photo_1 = models.ImageField(upload_to='photos/', null=True, blank=False, verbose_name="Zdjęcie główne")

    def __str__(self):
        return f'{self.name}'

    def _get_slug(self):
        slug = slugify(self.name)
        unique_slug = slug
        num = 1
        while Market.objects.filter(slug=unique_slug).exists():
            unique_slug = f"{slug}-{num}"
            num += 1
        return unique_slug

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = self._get_slug()
        super().save(*args, **kwargs)


class Article(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    published = models.DateTimeField(blank=True, null=True)
    slug = models.SlugField(max_length=200, unique=True)

    def _get_slug(self):
        slug = slugify(self.title)
        unique_slug = slug
        num = 1
        while Article.objects.filter(slug=unique_slug).exists():
            unique_slug = f"{slug}-{num}"
            num += 1
        return unique_slug

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = self._get_slug()
        super().save(*args, **kwargs)

    def __str__(self):
        return f'{self.title} - {self.author}'


class UploadFile(models.Model):
    file = models.FileField(upload_to='forms/', blank=True, null=True, verbose_name="Plik .docx")
    uploaded = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.file.name
