
All: ../../data/Mexico.csv

#step 2 
../../data/Mexico.csv: ../../data/Mexico_listings.csv ../../Mexico_reviews.csv merge_data.R
	R --vanilla --args "" < "merge_data.R"






