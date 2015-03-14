# flex-datafilterlib
DataFilterLib is a Flex Library that enables you to easily create filter functions for ArrayCollection. This library uses the internal filterFunction mechanism of the ArrayCollection but allows you to specify multiple functions in order to create complex filters (the basic ArrayCollection.filterFunction property only allows you to filter with one function). The Data Filters allows Data Binding to automatically refresh the data provider. Data filters can both be created in MXML or AS3 using the library's basic filters. Custom filters can also be added at runtime.

Have a look at these examples for demos and source code. Code fully documented (see ASDoc), feel free to contribute.

Most tutorials are written in French on https://flextutorialfr.wordpress.com, but you can find one written in english just here: https://flextutorialfr.wordpress.com/2010/06/01/datafilterlib-using-the-datafilterlib-with-actionscript-code-only/ Other examples should be quite straightfoward once you have a look at the examples's sources.

This library is free of use, even commercial use.


# flex-datafilterlib (french)
DataFilterLib est une librairie Flex permettant de créer facilement des fonctions de filtres pour une ArrayCollection. Elle utilise le mécanisme interne des ArrayCollection (la propriété filterFunction) pour filtrer la donnée mais permet de spécifier plusieurs filterFunction pour un filtrage plus complexe (la propriété ArrayCollection.filterFunction ne prend qu'une fonction de base). Les Data Filters peuvent aussi utiliser le Data Binding pour mettre automatiquement la donnée à jour. Ils peuvent être crées aussi bien en MXML qu'en ActionScript en utilisant les types de base de la librairie. Des filtres personnalisés peuvent aussi être ajoutés.

Voir les exemples pour les démos et le code source. Code entièrement documenté (voir l'ASDoc), les contributions seront les bienvenues.

Cette librairie est libre d'usage, même commercial.


# Future additions
Filtering XMLListCollection easily for Tree (using another Descriptor)
Filtering Date Objects capabilities
Latest Modifications
27/06/2010 : Added parameters initialization in DataFilterLib 1.0.3 for pure AS initialisation

01/06/2010 : Wrote a simple pure AS example on my blog (english: https://flextutorialfr.wordpress.com/2010/06/01/datafilterlib-using-the-datafilterlib-with-actionscript-code-only/) and added it to the gallery examples

30/09/2009 : Two new examples with source: Multiple Filters et Custom Filters

28/09/2009 : Addition of an "ignoreCase" property used for case sensitivity with DataFilterSingleValue filters

04/11/2009 : Addition of a "filterJokers" property to indicate wildcards for the filter (see example "Using Jokers")
