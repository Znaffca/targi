from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.forms import ModelForm
from targi.models import Market, PhotoAlbum, UploadFile


class AddUserForm(UserCreationForm):

    email = forms.EmailField(max_length=254, help_text='Wymagane. Wprowadź prawidłowy adres e-mail', label="E-Mail")
    username = forms.CharField(max_length=30, help_text=False, label="Nazwa użytkownika")
    password1 = forms.CharField(widget=forms.PasswordInput, label="Hasło")
    password2 = forms.CharField(widget=forms.PasswordInput, label="Powtórz hasło")


class AddMarketForm(ModelForm):

    class Meta:
        model = Market
        exclude = ['slug', 'date_added']


class AddMarketPhotoForm(ModelForm):

    class Meta:
        model = PhotoAlbum
        fields = ('photo',)


class ContactForm(forms.Form):
    from_email = forms.EmailField(required=True)
    subject = forms.CharField(required=True)
    message = forms.CharField(widget=forms.Textarea, required=True)


class UploadForm(forms.ModelForm):

    class Meta:
        model = UploadFile
        fields = ('file',)
