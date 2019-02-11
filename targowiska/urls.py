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
from django.contrib.auth import views as auth_views
from targi.views import MainPageView, AllMarketsView, MarketDetailView, AllArticlesView, ArticleDetailView, \
    WorkWithView, AboutView, ContactView, CreateUserView, AddMarketView, BasicSearchView, UserEdit, UserView

urlpatterns = [
    # admin panel
    path('admin/', admin.site.urls),
    # login, logout
    path('accounts/', include('django.contrib.auth.urls')),
    # register
    path('accounts/register/', CreateUserView.as_view(), name="register"),
    # change password - only authenticated users
    path('password_change/', auth_views.PasswordChangeView.as_view(), name='change-password'),
    path('password_change/done/', auth_views.PasswordChangeDoneView.as_view(), name='change-password-done'),
    # reset password
    path('password_reset/', auth_views.PasswordResetView.as_view(), name='password-reset'),
    path('password_reset/done/', auth_views.PasswordResetDoneView.as_view(), name='reset-done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(), name="complete-reseting"),
    # django comments view
    path(r'comments/', include('django_comments.urls')),
    # basic views
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
    # profile views
    path('profile/edit/', UserEdit.as_view(), name="edit-profile"),
    path('profile/', UserView.as_view(), name="profile"),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
