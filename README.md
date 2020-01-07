# industrial

This module is designed for marketers to create quickly and easily landing pages or microsites.
It contains a template, two pages sample and a collection of components :
* Carousel (2 types : heading and testimonial)

    ![](./src/main/resources/images/readme/100_component_carousel.png)
    
    ![](./src/main/resources/images/readme/101_component_carousel.png)
    
* Gallery image

    ![](./src/main/resources/images/readme/102_component_gallery.png)
    
* Features list

    ![](./src/main/resources/images/readme/104_component_features.png)
    
* Cards elements

    ![](./src/main/resources/images/readme/105_component_cards.png)
    
* Text and illustration

    ![](./src/main/resources/images/readme/103_component_text.png)
    
* Navigation bar
* Footer components (about, contact, navigation)
* ...


This module contains a Jahia ready to use implementation of the free template [industrial](https://colorlib.com/wp/template/industrial/), based on the open source toolkit [Bootstrap 4](https://getbootstrap.com/docs/).
Following the concept of bootstrap 4, the template can be modified or used as his.

## Install
As it is built on top of bootstrap 4, the module has a dependence with it. So, before to install the Industrial module you need to check if the dependence is satisfied.

### Install dependence

To install the module `Bootstrap 4 Package` follow the next steps : 
1. Goto `Administration` mode
1. Expand `System components` entry and click `Modules`
1. In the right panel click on top `Available modules` and search for *Bootstrap 4 Package*

    ![](./src/main/resources/images/readme/200_modules_B4.png)
    
1. Click the icon ![](./src/main/resources/images/readme/201_modules_download_icon.png) in the right of the package to download and install the module

### Install the Industrial module

Now the dependence is installed, industrial module is ready to deploy.

To install and deploy the module `Industrial` follow the next steps : 
1. Goto `Administration` mode
1. Expand `System components` entry and click `Modules`
1. In the right panel click on top `Available modules` and search for *Industrial*

    ![](./src/main/resources/images/readme/202_modules_industrial.png)
    
1. Click the icon ![](./src/main/resources/images/readme/201_modules_download_icon.png) in the right of the package to download and install the module

## Create a new website using `industrial` template set

The module industrial is now installed and ready to use. The module is a Jahia *template set*, it is enabled when a new website is created.

To create a new website using `industrial` follow the next steps :
1. Goto `Administration` mode
1. Click `Web Projects` entry and click `CREATE` in the right panel

    ![Create a new web project](./src/main/resources/images/readme/000_create_new_site.png)

1. Fill the website name and key with the name you want and click NEXT

    ![Create a new web project](./src/main/resources/images/readme/001_create_new_site.png)

1. Select the template set `industrial`
1. Choose modules to be deployed :
    1. `Bootstrap 4 Components` : this enable all default bootstrap 4 elements as the usefull `Layout and Grid`
    1. `Jahia Google Analytics` : this enable the `Google Analytics site settings` entry used to include your google analytics tag (explained later)
    
    ![Create a new web project](./src/main/resources/images/readme/002_create_new_site.png)


## Google Analytics site settings
Jahia offer to you an easy way to include your google analytics tag in your html page. To configure this feature follow the next steps :
1. Goto `Edit Mode`
1. In `PAGES` menu right click your site name and click `Edit`
1. In the edit form goto `Options` section
1. Enable the `Google Analytics site settings` entry :
    1. fill your *Google Analytics site ID*
    1. (optional) update the cookie live time
