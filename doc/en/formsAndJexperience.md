# Use Jahia `Forms` and `jExperience` with an Industrial website
Jahia offers an extension to build and deploy easily HTML Forms. In addition, form's fields can be mapped to User profile attribute. Values are stored in *jCustomer* through *jExperience*.
## Enable `Forms` and `jExperience`
Before to use *Forms* and *jExperience* ensure modules are deployed in *jContent*

### Check if `Forms` is installed
1. Goto `Administration` mode
1. Expand `System components` entry and click `Modules`
1. Search if `Forms core` is available

    ![400]

If module is not deployed ...

### Check if `jExperience` & `jExperience Forms bridge` are installed
Jahia offer the capability to map form's fields to User profile attribute. Values are stored in *jCustomer* through *jExperience*. To enable this great feature, jCustomer needs 2 modules :
1. `jExperience`
1. `jExperience Forms bridge`

Thus, we need to check if the required module are available in our instance :

1. Goto `Administration` mode
1. Expand `System components` entry and click `Modules`
1. Search if `jExperience` & `jExperience Forms bridge` are available

    ![300]

If module is not deployed ...

Then activate both for you sitecd ..

When modules are available for your website you can find new entry in the settings tab of your website

![500]

[300]: ../images/300_jExperience_is_enabled.png
[400]: ../images/400_Forms_is_enabled.png
[500]: ../images/500_jX_Form_active.png