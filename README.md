# Airbnb Prices during the Coldplay Worldtour 'Music of the Spheres' **Maybe change project name as well**
**Only summarize the research --> this is how the project should look like, not the readme** --> main results in bullet point format, maybe screenshots. 
explains the project’s goal, and provides instructions to potential contributors/replicators on how to run the project.
Better still, if you link to other files within the repository so that the reader not only knows what the project is about but also which files are a priority.

# "Music of the Spheres": The effect of big events on Airbnb prices.

To what extent are Airbnb prices affected by big events and are roomtype and distance of influence?

## Motivation

With this dataset, the impact of big events on Airbnb prices in a city are analyzed. More specific; the impact of the Coldplay Worldtour on 3 major cities (Chicago, Dallas and Mexico City). Within this relation, the influence of the type of room and the distance between the Airbnb and the event are studied as well. This study is interesting for both Airbnb owner as well as Airbnb itself to check whether a price increase during a big event is feasible.

## Method and results

First, introduce and motivate your chosen method, and explain how it contributes to solving the research question/business problem.

To get our results, data from [insideairbnb](http://insideairbnb.com/get-the-data) is retrieved. Via [songkick](http://songkick.com), we found the locations where Coldplay's concerts took place. From those locations, three were available via the insideairbnb database. The datasets "listing" and "reviews" are merged to create a new dataset. Before analysis, this new dataset is filtered for interesting variables and cleaned up. To measure this effect of the distance between the event location and the Airbnb, a new variable "distance" is created in the cleaned dataset. With this cleaned up dataset, it is possible to retrieve usefull information concerning our research quetions.

Second, summarize your results concisely. Make use of subheaders where appropriate.



## Repository overview

Provide an overview of the directory structure and files, for example:

├── README.md
├── data
├── gen
│   ├── analysis
│   ├── data-preparation
│   └── paper
└── src
    ├── analysis
    ├── data-preparation
    └── paper


## Running instructions

Explain to potential users how to run/replicate your workflow. If necessary, touch upon the required input data, which secret credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow.


## More resources

Point interested users to any related literature and/or documentation.


## About

Explain who has contributed to the repository. You can say it has been part of a class you've taken at Tilburg University.
