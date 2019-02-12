import time
import docx
from django.contrib.postgres.search import SearchVector
from django.core.mail import send_mail, BadHeaderError
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.forms import modelformset_factory
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, redirect
from django.views import View

from targi.doc_import import find_tuple_val, find_products, find_city, is_active, find_choices
from targowiska.local_settings import EMAIL_HOST_USER, E_MAIL_ADDRESS_USER
from targi.forms import AddUserForm, AddMarketForm, ContactForm, UploadForm, UserEditForm, ProfileForm
from targi.models import Article, Market, PhotoAlbum, UploadFile, UserProfile


# Main Page

class MainPageView(View):

    def get(self, request):
        last_articles = Article.objects.all().order_by('-published')[:4]
        last_markets = Market.objects.all(). order_by('-date_added')[:3]
        return render(request, 'targi/index.html', {'articles': last_articles, 'markets': last_markets})


# Search results

class BasicSearchView(View):

    def get(self, request):
        query = self.request.GET.get('q')
        results_m = Market.objects.annotate(search=SearchVector('name', 'description')).filter(search=query)
        results_a = Article.objects.annotate(search=SearchVector('title', 'text')).filter(search=query)
        return render(request, 'targi/search.html', {"results_m": results_m, "results_a": results_a, "q": query})


# Cooperation Page

class WorkWithView(View):

    def get(self, request):
        return render(request, 'targi/work_with_us.html')


# About Us Page

class AboutView(View):

    def get(self, request):
        return render(request, 'targi/about.html')


# Contact Page with contact form - partially working

class ContactView(View):

    def get(self, request):
        form = ContactForm()
        return render(request, 'targi/contact.html', {"form": form})

    def post(self, request):
        form = ContactForm(request.POST)
        if form.is_valid():
            subject = form.cleaned_data['name']
            from_email = form.cleaned_data['email']
            message = form.cleaned_data['comments']
            title = f'Polskie targi - pytanie od: {subject} - {from_email}'
            try:
                send_mail(title, message, EMAIL_HOST_USER, [E_MAIL_ADDRESS_USER], fail_silently=False)
                return HttpResponseRedirect('/contact')
            except Exception:
                return HttpResponse('Błędne dane <a href="{% url \'contact\' %}">Spróbuj jeszcze raz</a> ')


# Markets Catalog

class AllMarketsView(View):

    def get(self, request):
        all_markets = Market.objects.all().order_by('-date_added')
        paginator = Paginator(all_markets, 3)
        page = request.GET.get('page')
        try:
            markets = paginator.get_page(page)
        except PageNotAnInteger:
            markets = paginator.page(1)
        except EmptyPage:
            markets = paginator.page(paginator.num_pages)
        return render(request, 'targi/markets.html', {'markets': markets})


# Market Details

class MarketDetailView(View):

    def get(self, request, slug):
        market = Market.objects.get(slug=slug)
        photos = PhotoAlbum.objects.filter(market=market)
        return render(request, 'targi/market_details.html', {"market": market, "photos": photos})


# Market Add
# Market Add from file harcoded - need improvement

class AddMarketView(View):

    def get(self, request):
        form = AddMarketForm()
        form2 = UploadForm()
        image_form = modelformset_factory(PhotoAlbum, fields=('photo',), extra=3)
        formset = image_form(queryset=PhotoAlbum.objects.none())
        return render(request, 'targi/market_form.html', {"form": form, "image_form": formset, "form2": form2})

    def post(self, request):
        form = AddMarketForm(request.POST, request.FILES)
        form2 = UploadForm(request.POST, request.FILES)
        image_form = modelformset_factory(PhotoAlbum, fields=('photo',), extra=3)
        formset = image_form(request.POST, request.FILES)

        if form.is_valid() and formset.is_valid():
            post = form.save()

            for form in formset:
                try:
                    photo = PhotoAlbum(market=post, photo=form.cleaned_data['photo'])
                    photo.save()
                except Exception as e:
                    break
            try:
                send_mail('Dodano nowe targowisko',
                            'Do twojej aplikacji dodano nowy targ! Sprawdź jego poprawność w panelu administracyjnym',
                            EMAIL_HOST_USER,
                            [E_MAIL_ADDRESS_USER],
                            fail_silently=False)
                return HttpResponseRedirect('/markets/')
            except Exception:
                return HttpResponse("Wystąpił błąd podczas wysyłania. Mimo wszystko formularz został dodany")
        elif form2.is_valid():
            form2.save()
            time.sleep(2)
            instance = UploadFile.objects.all().order_by('-uploaded')[0]
            document = docx.Document(instance.file)
            import_list = []
            for row in document.tables[0].rows:
                if row.cells[0].text == 'TYP POLA':
                    pass
                else:
                    if row.cells[0].text:
                        import_list.append(row.cells[1].text)
            form3 = AddMarketForm(initial=
                {
                    'name': import_list[0],
                    'type': find_tuple_val(import_list[1]),
                    'products': find_products(import_list[2]),
                    'town_city': find_city(import_list[3]),
                    'administrator': import_list[4],
                    'address': import_list[5],
                    'geolocation': import_list[6],
                    'is_active': is_active(import_list[7]),
                    'cured_area': find_choices(import_list[8]),
                    'is_indoor': find_choices(import_list[9]),
                    'handicaps': find_choices(import_list[10]),
                    'is_toilet': is_active(import_list[11]),
                    'public_transport': is_active(import_list[12]),
                    'taxi_range': is_active(import_list[13]),
                    'parking': import_list[14],
                    'cycle_places': is_active(import_list[15]),
                    'radio_info': is_active(import_list[16]),
                    'atm_nearby': is_active(import_list[17]),
                    'description': import_list[18],
                }
            )
            formset2 = image_form(queryset=PhotoAlbum.objects.none())
            return render(request, 'targi/market_form.html', {"form": form3, "image_form": formset2, "form2": form2})


# All Articles

class AllArticlesView(View):

    def get(self, request):
        all_articles = Article.objects.all()
        paginator = Paginator(all_articles, 3)
        page = request.GET.get('page')
        try:
            articles = paginator.get_page(page)
        except PageNotAnInteger:
            articles = paginator.page(1)
        except EmptyPage:
            articles = paginator.page(paginator.num_pages)

        return render(request, 'targi/articles.html', {"articles": articles})


# Article Detail

class ArticleDetailView(View):

    def get(self, request, id):
        article = Article.objects.get(pk=id)
        return render(request, 'targi/article_details.html', {'article': article})


# User Registration

class CreateUserView(View):
    def get(self, request):
        form = AddUserForm()
        return render(request, 'targi/sign_in.html', {"form": form})

    def post(self, request):
        form = AddUserForm(request.POST)
        if form.is_valid():
            new_user = form.save(commit=False)
            new_user.set_password(form.cleaned_data['password'])
            new_user.save()
            UserProfile.objects.create(user=new_user)
            return render(request, "targi/register_done.html", {"new_user": new_user})
        return render(request, 'targi/sign_in.html', {"form": form})


# User Edit

class UserEdit(View):
    def get(self, request):
        user_form = UserEditForm(instance=request.user)
        user_profile_form = ProfileForm(instance=request.user.userprofile)
        return render(request, 'targi/user_edit.html', {"user_form": user_form, "user_profile": user_profile_form})

    def post(self, request):
        user_form = UserEditForm(instance=request.user, data=request.POST)
        user_profile_form = ProfileForm(instance=request.user.userprofile, data=request.POST, files=request.FILES)
        if user_form.is_valid() and user_profile_form.is_valid():
            user_form.save()
            user_profile_form.save()
            return render(request, 'targi/user_edit.html', {"user_form": user_form, "user_profile": user_profile_form})


# User View

class UserView(View):
    def get(self, request):
        return render(request, 'targi/profile.html', {"user": request.user})
