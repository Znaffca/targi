"""targowiska URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, re_path, include

from targowiska import settings
from targi.views import MainPageView, AllMarketsView, MarketDetailView, AllArticlesView, ArticleDetailView, \
    WorkWithView, AboutView, ContactView, CreateUserView, AddMarketView, BasicSearchView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')),
    path('accounts/register/', CreateUserView.as_view(), name="register"),
    path(r'comments/', include('django_comments.urls')),
    path('', MainPageView.as_view(), name="main-page"),
    path('search/', BasicSearchView.as_view(), name="search"),
    path('cooperation/', WorkWithView.as_view(), name="cooperation"),
    path('about/', AboutView.as_view(), name="about-us"),
    path('contact/', ContactView.as_view(), name="contact"),
    path('markets/', AllMarketsView.as_view(), name="all-markets"),
    path('markets/add/', AddMarketView.as_view(), name="add-market"),
    re_path(r'^market_detail/(?P<slug>(\D)+)', MarketDetailView.as_view(), name="market-details"),
    path('articles/', AllArticlesView.as_view(), name="all-articles"),
    re_path(r'^article_detail/(?P<id>(\d)+)', ArticleDetailView.as_view(), name="article-details"),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
