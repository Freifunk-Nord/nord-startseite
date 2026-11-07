Startseite der Community Freifunk Nord
======================================

Webseite: http://www.ffnord.net/blog.html

Um einen Blog Beitrag zu erstellen brauchst du keine weitere Software. Das Blog kannst du **direkt im Browser [hier auf Github](https://github.com/ffnord/nord-blog) bearbeiten**.

Um die Hauptseiten zu bearbeiten, clone dises Repository und installiere ein paar Abhngigkeiten, dann kannst du auch bei dir lokal eine Kopie erstellen und testen:

Dependencies
------------

* [Hugo](https://gohugo.io/) >= 0.162

Install
-------

On Ubuntu/Debian:

    sudo apt-get install hugo
    git clone <repo-url> startseite
    cd startseite/

Structure
---------

 * `hugo.yaml`: site configuration, community data below `params`
 * `content/`: the pages as HTML, blog posts in `content/blog/`
 * `layouts/`: page frame (`baseof.html`), blog post layout and shortcodes
 * `assets/karte.svg`: community map on the start page
 * `static/`: copied to the site as is (images, fonts, ...)
 * `static/stylesheets/app.css`: the whole design, no CSS framework or build step

Pages read values from `hugo.yaml` with the `config` shortcode, for example

    {{< config "community.mail_info" >}}

Customization
-------------
Customize the text/configuration in the following files:

 * `hugo.yaml`
 * `content/treffen.html`
 * `content/mitmachen.html`
 * `content/distributor.html`

Before you deploy the included `content/impressum.html` please contact
the "Förderverein Freie Netzwerke e. V." and ask for their
permission to do so. Thanks.

Build
-----

```
hugo
```

or
```
hugo server
```
