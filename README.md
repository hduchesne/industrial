# Industrial

<!-- * [Français][doc-fr]) -->

This module is designed for marketers to create quickly and easily landing pages or microsites.

The release of this template set, can also be used to demonstrate the integration of an 
 external Digital Asset Manager (DAM) with Jahia jContent. In this module we use 
 [Widen][widen-website] as DAM.
 

* [Install](#install)
    * [Install dependencies](#install-dependencies)
        * [Install the module `Bootstrap 4 Package`](#install-the-module-bootstrap-4-package-)
        * [Install the module `animate`](#install-the-module-animate-)
    * [Install the Industrial module](#install-the-industrial-module)
* [Create a new website using `industrial` template set](#create-a-new-website-using-industrial-template-set)

It contains a template, three pages sample and a collection of components:
* Carousel (2 types: heading and testimonial)

    ![][100]
    
    ![101]
    
* Gallery image

    ![102]
    
* Features list

    ![104]
    
* Cards elements

    ![105]
    
* Text and illustration

    ![103]
    
* Navigation bar
* Footer components (about, contact, navigation)
* ...


This module contains a Jahia ready to use implementation of the free template [industrial][industrial-website],
based on the open source toolkit [Bootstrap 4][bs-website].
Following the concept of bootstrap 4, the template can be modified or used as his.



## Install
Industrial Template Set module depends on:
1. bootstrap 4
1. animate

Thus, before to install and run the Industrial module we need to ensure dependencies are satisfied

### Install dependencies

#### Install the module `Bootstrap 4 Package`: 
1. Goto `Administration` mode
1. Expand `System components` entry and click `Modules`
1. In the right panel click on top `Available modules` and search for *Bootstrap 4 Package*

    ![200]
    
1. Click the icon ![201] in the right of the package to download and install the module

#### Install the module `animate`: 
1. Goto `Administration` mode
1. Expand `System components` entry and click `Modules`
1. In the right panel click on top `Available modules` and search for *animate*

    ![202A]
    
1. Click the icon ![201] in the right of the package to download and install the module

#### Install the module `Widen Picker`: 

1. Goto `Administration` mode
1. Expand `System components` entry and click `Modules`
1. In the right panel click on top `Available modules` and search for *animate*

    ![202A]
    
1. Click the icon ![201] in the right of the package to download and install the module

### Install the Industrial module

Now the dependence is installed, industrial module is ready to deploy.

To install and deploy the module `Industrial` follow the next steps: 
1. Goto `Administration` mode
1. Expand `System components` entry and click `Modules`
1. In the right panel click on top `Available modules` and search for *Industrial*

    ![202I]
    
1. Click the icon ![201] in the right of the package to download and install the module

## Create a new website using `industrial` template set

The module industrial is now installed and ready to use. The module is a Jahia *template set*, it is enabled when a new website is created.

To create a new website using `industrial` follow the next steps:
1. Goto `Administration` mode
1. Click `Web Projects` entry and click `CREATE` in the right panel

    ![Create a new web project][000]

1. Fill the website name and key with the name you want and click NEXT

    ![Create a new web project][001]

1. Select the template set `industrial`
1. Choose modules to be deployed:
    1. `Bootstrap 4 Components`: this enable all default bootstrap 4 elements as the usefull `Layout and Grid`
    1. `Jahia Google Analytics`: this enable the `Google Analytics site settings` entry used to include your google analytics tag (explained later)
    
    ![Create a new web project][002]
<!--
## Use Jahia `Forms` and `jExperience` with an Industrial website
[read more][forms-jx]

## Google Analytics site settings
[read more][google-analytics]
-->
[000]: doc/images/000_create_new_site.png
[001]: doc/images/001_create_new_site.png
[002]: doc/images/002_create_new_site.png
[100]: doc/images/100_component_carousel.png
[101]: doc/images/101_component_carousel.png
[102]: doc/images/102_component_gallery.png
[103]: doc/images/103_component_text.png
[104]: doc/images/104_component_features.png
[105]: doc/images/105_component_cards.png
[200]: doc/images/200_modules_B4.png
[201]: doc/images/201_modules_download_icon.png
[202A]: doc/images/202_modules_animate.png
[202I]: doc/images/202_modules_industrial.png


[forms-jx]: doc/en/formsAndJexperience.md
[google-analytics]:doc/en/googleAnalytics.md

[bs-website]: https://getbootstrap.com/docs/
[industrial-website]: https://colorlib.com/wp/template/industrial/
[widen-website]: https://www.widen.com/

[doc-fr]: doc/fr/README.md