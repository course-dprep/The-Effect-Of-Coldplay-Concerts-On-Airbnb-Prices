DATA = ../../data

#step 1 download data  
$(DATA)/Chicago/Chicago_listings.csv $(DATA)/Chicago/Chicago_reviews.csv $(DATA)/Mexico/Mexico_listings.csv $(DATA)/Mexico/Mexico_reviews.csv $(DATA)/Dallas/Dallas_listings.csv $(DATA)/Dallas/Dallas_reviews.csv: download_data.R
	R --vanilla --args "" < "download_data.R"	
	
#step 2 merge data 
$(DATA)/Mexico/Mexico_merged.csv $(DATA)/Dallas/Dallas_merged.csv $(DATA)/Chicago/Chicago_merged.csv: $(DATA)/Mexico/Mexico_listings.csv $(DATA)/Mexico/Mexico_reviews.csv $(DATA)/Dallas/Dallas_listings.csv $(DATA)/Dallas/Dallas_reviews.csv $(DATA)/Chicago/Chicago_listings.csv $(DATA)/Chicago/Chicago_reviews.csv: merge_data.R
	R --vanilla --args "" < "merge_data.R"	

#step 3 clean data 
$(DATA)/Mexico/Mexico_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Chicago/Chicago_cleaned.csv: $(DATA)/Mexico/Mexico_merged.csv $(DATA)/Dallas/Dallas_merged.csv $(DATA)/Chicago/Chicago_merged.csv
	R --vanilla --args "" < "merge_data.R"	

clean:
	R -e "unlink('../../data/*.*')"
	
	
  

