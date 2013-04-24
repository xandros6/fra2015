This directory contains the localization files for the FRA2015 project.

Supported languages are EN, ES, FR.

We have different sets of files:
* countries: localized names of countries
* locale: survey strings
* messages: UI labels
* validation: messages about validation rules for survey values.

We use `Spring libraries` to perform localization.
When the text for a given lang ```LANG``` is requested, the property is searched first 
in the file ```BASEFILENAME_LANG.properties```.
If the property is not found there, the default file ```BASEFILENAME.properties``` is then scanned.

We're keeping the english files updated. The default property file is derived from that one,
 with the string ```MISSING``` prepended, and a reference to the property name;
it's useful when reviewing missing properties in a translated prop file.

Please note that ```locale``` files may have some props that need customizations in the different languages.
The ```refq1faq```, ```refq2faq```, ..., ```refq21faq``` properties refer to documents that 
are language specific. It means that the default values should be left empty, while the english localization
may have some defined text in it. It means that the default property file should not be derived directly from the 
english one.

We'll have:
* locale_base.properties: english text, with empty refq*faq entries
* locale.properties: created from locale_base.properties, prepending the ```MISSING ref``` string.
* locale_en.properties: english text, with customized refq*faq entries
* locale_es.properties: spanish text, with customized refq*faq entries
* locale_fr.properties: french text, with customized refq*faq entries

We use this command to create the ```locale.properties``` file:
```
sed 's/\(^ref[^=]*\)=/\1=\[MISSING \1\] /g' locale_original.properties > locale.properties
```

In order to ease the translators' work, we may want to expose a page having the translated text,
 along with the related ref property name.  
We will create an 'extended' translated files containing these ref info:
```
sed 's/\(^ref[^=]*\)=/\1=\[\1\] /g' locale_es.properties > locale_xes.properties
```

Se we'll also have these files, similar to the original translated ones, but augmented with 
some info on the ref property names:  
* locale_xen.properties
* locale_xes.properties
* locale_xfr.properties

