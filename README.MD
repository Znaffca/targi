#targowiska - final project
Created as a final project of Python developer course. Still in progress

#### 12.02.2019 - what is working:
- main page:
    - last added markets
    - last added articles
    - basic search in top of the page
- login and registration
    - login page with links to registration
    - change password - only logged users
    - reset password by e-mail
    - registration to website
- markets and articles
    - display list of added markets, articles
    - pagination
    - add market from form
    - add market from fileform
    - link to download fileform
    - sending e-mail after add market to database
- comments
    - adding comments for all viewers
- logged users
    - link to profile (complete view not created yet)
    - edit profile form
- contact page
    - dispalyed contact form

#### To-Do-List:
 - create models, views and template for: "giełda, ogłoszenia"
 - create `@loginrequired` permissions for specific pages
 - add button "Edit" to market details page and article details page
 - create edit views for market and articles
 - update market details view:
    - display all parameters from database
    - add geolocation field to page, display map in website
    - add calendar with marked opened hours of specified market
 - update market and article list:
    - make button "Zgłoś" - active: button click will be send mail about errors founded in pages
 - Optimize code for Fileform add
 - Update Contact, Cooperation and About View
 - connect with `GUS TERYT API` to get access to all cities data
 
#### Known issues:
- comment submit will not redirecting to market details where the comment was posted; it returns a `HttpResponse Object` instead
- contact form raise `AttributeError` after post message
- add file form in `markets/add` is not secure before post an empty form
- mail message about password reset generate link started with `http://example.com`, not `localhost`
- and propably much more...