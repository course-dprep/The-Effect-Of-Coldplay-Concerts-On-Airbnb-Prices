# Airbnb Prices during the Coldplay Worldtour 'Music of the Spheres' **Maybe change project name as well**
**Only summarize the research --> this is how the project should look like, not the readme** --> main results in bullet point format, maybe screenshots. 
## Table of contents
[1. Our Project](https://github.com/course-dprep/team-assignment-team-5#1-Our-Project)
- Description of the research
- Relevance
- Research questions
- Conceptual model

[2. Method](https://github.com/course-dprep/team-assignment-team-5#2-Method)
- Data
- Variables
- Research method

[3. Results and Conclusion](https://github.com/course-dprep/team-assignment-team-5#3-Results-and-Conclusion)

[4. Repository](https://github.com/course-dprep/team-assignment-team-5#4-Repository)
- Files
- Structure

## 1. Our Project - **Still need to add**: Choice for research method (regression), way of deployment, conclusion. Needs to be reproducible. 
### Description of the research
In our research we study the price changes of Airbnb's in different cities in the period of a Coldplay concert of the worldtour 'Music of the Spheres'. We will look at the prices during a Coldplay concert and the periods before and after the concert to study the price differences caused by the Coldplay concerts. Furthermore, we will look at the influence of the type of listing, and the influence of the distance between an Airbnb and the place of the concert on the relationship of the concert on the price of the Airbnb.

Since the tour of Coldplay started in March 2022 and will continue till July 2023, we are not able to study all cities. However, results of our study can help other cities by predicting prices of Airbnb's. The cities we will study are Mexico City, Dallas, and Chicago. 

We will use data about the listings from Airbnb retrieved by "http://insideairbnb.com/get-the-data", and to find the concert dates we will use data from "http://songkick.com".

### Relevance
We will look at the changes in prices during Coldplay concerts in three different cities. Therefore, our study will be relevent for Airbnb hosts to determine their prices when a big event is taking place in the city when there is an effect of a big event on prices. Furthermore, we study the effect for only three cities and a in a lot of other cities there will be a Coldplay concert of this tour as well. Whenever there is an effect of the concerts on the prices for Airbnb's, other cities can raise there prices in the period of the upcoming Coldplay concert. 

Besides that, we will look at the influence of distance between the place of the concert and the place of the Airbnb and the influence of the type of the listing. This gives insight in whether the distance between an Airbnb and the place of a big event and/or whether the type of a listing during a typical event influences the price. So, Airbnb's cna have different price changes during a big event and should maybe react different than other Airbnb's. 

### Research questions

1. "To what extent do prices of Airbnb's differ during Coldplay concerts in the cities Dallas, Chicago, and Mexico City?"
2. "To what extent does the distance between an Airbnb and the place of the concert influence the relationship between the prices of an Airbnb during a Coldplay concert?"
3. "To what extent does the type of the listing influence the relationship between the prices of an Airbnb during a Coldplay concert?

### Conceptual model

![Assignment dprep (2)](https://user-images.githubusercontent.com/38066744/195048115-211db366-c55f-4ff3-8ca2-dd5b18a81b26.png)
## 2. Method

### Dataset
**Which packages did we use?**
First, we retreived data from "http://insideairbnb.com/get-the-data" to get the data from Airbnb listings. The data from this website was at the moment of starting this assignment only available till mid June 2022. Therefore, we had to check in which cities a Coldplay concert has taken place before mid June 2022. To find the dates of all Coldplay concerts of the tour 'Music of the Spheres' we used "http://songkick.com". We then found that the only suitable cities for our dataset are Mexico City, Dallas, and Chicago. 

After retrieving the data, we continued to merge the 'listing' and 'reviews' datasets for each country. Then, we cleaned the data by removing unneccassary variables in the dataset. We reduced the dataset by filtering for the dates one month before and one month after te Coldplay concert for each city and we removed outliers by removing prices above $9999.00. We also created new variables, including the distance between the Airbnb listing and the place of the Coldplay concert, and a dummy variable of whether the listing was during the Coldplay concerts or not. An overview of the variables can be found in the next section. 

### Variables

In the following table, a clear overview of all used variables is shown:

| **Variable name**                        | **Variable explanation**                                     |
| ---------------------------------------- |--------------------------------------------------------------|
| price_in_dollars                   (Y)   | Price of the Airbnb in dollars                               |
| date                               (X1)  | The date of the listing                                      |
| DuringConcert                      (X2)  | Dummy whether the date is during the concert                 |
| distance                           (X3)  | The distance between the Airbnb and the place of the concert |
| room_type                          (X4)  | The type of the listing                                      |

### Research method

To study the effect of Coldplay concerts on the price of an Airbnb influenced by the distance between the place of the Coldplay concert and the place of the Airbnb and the type of the listing, we will use a regression. The dependent variable is the Airbnb price in dollars, and the independent variables are the 'X' variables in the table above. We have also looked at the interaction of the interaction between DuringConcert and distance (X5), and the interaction between DuringConcert and room_type (X6). Which gives us the following regression: 

Y = b0 + b1X1 + b2X2 + b3X3 + b4X4 + b5X5 + b6X6

In the next session, the results of the regression will be presented. 

**Analysis and deployement**

## 4. Results and Conclusion
### Results
### Conclusion 

## 5. Repository
### Files
### Structure

