from targi.models import MARKET_TYPE, CHOICES, Products, TownAndCities


def find_tuple_val(value):
    for m in MARKET_TYPE:
        if value in m:
            return m[0]


def find_products(value):
    val_list = value.split(', ')
    objects = []
    for val in val_list:
        transformed = val.capitalize()
        objects.append(Products.objects.get(category=transformed))
    return objects


def find_city(value):
    return TownAndCities.objects.get(name=value)


def is_active(value):
    if value.lower() == "tak":
        return True
    else:
        return False


def find_choices(value):
    for v in CHOICES:
        if value in v:
            return v[0]
