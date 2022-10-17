# "Music of the Spheres": The effect of big events on Airbnb prices.

To what extent are Airbnb prices affected by big events and are roomtype and distance of influence?

![](https://bestmusicsheet.com/wp-content/uploads/2021/11/Coldplay-World-Concert-Tour-in-2022-3.jpeg)

## Research Motivation

With this dataset, the impact of big events on Airbnb prices in a city are analyzed. More specific; the impact of the Coldplay Worldtour on 3 major cities (Chicago, Dallas and Mexico City). Within this relation, the influence of the type of room and the distance between the Airbnb and the event are studied as well. This study is interesting for both Airbnb owner as well as Airbnb itself to check whether a price increase during a big event is feasible.

## Method and results

To get our results, data from [insideairbnb](http://insideairbnb.com/get-the-data) is retrieved. Via [songkick](http://songkick.com), we found the locations where Coldplay's concerts took place. From those locations, three were available via the [insideairbnb](http://insideairbnb.com/get-the-data) database. The datasets "listing" and "reviews" are merged to create a new dataset. Before analysis, this new dataset is filtered for interesting variables and cleaned up. To measure this effect of the distance between the event location and the Airbnb, a new variable "distance" is created in the cleaned dataset. With this cleaned up dataset, it is possible to retrieve usefull information concerning our research questions, using a regression analysis.

For all three cities that were analyzed, we did not find significant results in price changes during the Coldplay concerts. Peaks in prices that were found, mostly arised during weekends. Changes in prices were relatively constant over time. Furthermore, for the moderating effects no significant results were found as well. The distance between the event location and the Airbnb did not have an effect on price changes, same as the roomtype. An explanation for this might be found in the size of the city, relative to the event. Because of the size of the city, demand in Airbnbs/alternatives might not be impacted too much by even big events like a Coldplay concert. 

## Repository overview

The directory structure is as follows:
```
├── .github
├── src
|   ├── analysis
|       ├── analyze.R
|       ├── graph.R
|       ├── makefile
|   ├── data-preparation
|       ├── clean_data.R
|       ├── download_data.R
|       ├── makefile
|       ├── merge_data.R
├── data
├── gen
|   ├── output
|   ├── temp         
├── .gitignore
├── README.md
├── RMarkdown.Rmd
└── Makefile
```

## Running instructions

All of the data, analysis and plots can be run using the main makefile. R will make sure the proper packages will be installed if necessary. To make the main makefile run, Windows OS users will have to install [Make](https://gnuwin32.sourceforge.net/packages/make.htm). For Mac and Linux OS users, this will automatically be installed.When Make is installed, it is possible to run the makefile in RStudio. 

First, type "make -n" in the Terminal. R wil then show you everything it will run. If you type in "make", R wil run all the code. This can take some time. When R is done, all the output will be generated.

## Resources

Relevant resources include:
* [insideairbnb](http://insideairbnb.com/get-the-data)
* [songkick](http://songkick.com)

## About

This repository was created as a part of the Data Preparation and Workflow Managemant course in the Marketing Analytics Master of Tilburg University. The following students contributed to the creation of this repository:

* Thierry Lahaije
* Niels Rahder
* Eveline de Veld
* Thomas van Dijk
