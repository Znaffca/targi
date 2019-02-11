from django.contrib.auth.models import User
from django import forms
from django.forms import ModelForm
from targi.models import Market, PhotoAlbum, UploadFile, UserProfile


class AddUserForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput, label="Hasło")
    password2 = forms.CharField(widget=forms.PasswordInput, label="Powtórz hasło")

    class Meta:
        model = User
        fields = ('username', 'first_name', 'email')

    def clean_password2(self):
        check = self.cleaned_data
        if check['password'] != check['password2']:
            raise forms.ValidationError('Hasła nie zgadzają się!!!')
        return check['password2']


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


class ProfileForm(forms.ModelForm):

    class Meta:
        model = UserProfile
        fields = ('date_of_birth', 'description', 'photo')
        widgets = {
            'description': forms.Textarea,
            'date_of_birth': forms.DateInput,
        }


class UserEditForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email')
