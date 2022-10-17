DATA = ../../data

all: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv 

#step 1 download data  
$(DATA)/Chicago/Chicago_listings.csv $(DATA)/Chicago/Chicago_reviews.csv $(DATA)/Mexico/Mexico_listings.csv $(DATA)/Mexico/Mexico_reviews.csv $(DATA)/Dallas/Dallas_listings.csv $(DATA)/Dallas/Dallas_reviews.csv: download_data.R
	R --vanilla < "download_data.R"	

#merge data 
$(DATA)/Chicago/Chicago_merged.csv $(DATA)/Dallas/Dallas_merged.csv $(DATA)/Mexico/Mexico_merged.csv: $(DATA)/Chicago/Chicago_listings.csv $(DATA)/Chicago/Chicago_reviews.csv $(DATA)/Mexico/Mexico_listings.csv $(DATA)/Mexico/Mexico_reviews.csv $(DATA)/Dallas/Dallas_reviews.csv $(DATA)/Dallas/Dallas_listings.csv merge_data.R
	R --vanilla < "merge_data.R"

#clean data 
$(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv: $(DATA)/Chicago/Chicago_merged.csv  $(DATA)/Dallas/Dallas_merged.csv  $(DATA)/Mexico/Mexico_merged.csv clean_data.R
	R --vanilla < "clean_data.R"