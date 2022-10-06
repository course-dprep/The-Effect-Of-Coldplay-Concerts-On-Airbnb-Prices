#step 1 download data  

../../data/Mexico/Mexico_listings.csv ../../Mexico/Mexico_reviews.csv: download_data.R
	Rscript download_data.R
	
../../data/Chicago/Chicago_listings.csv ../../Chicago/Chicago_reviews.csv: download_data.R
	Rscript download_data.R
	
../../data/Dallas/Dallas_listings.csv ../../Dallas/Dallas_reviews.csv: download_data.R
	Rscript download_data.R

#step 2 merge data 
../../data/Mexico/Mexico_merged.csv: ../../data/Mexico/Mexico_listings.csv ../../Mexico/Mexico_reviews.csv merge_data.R
	R --vanilla --args "" < "merge_data.R"

../../data/Dallas/Dallas_merged.csv: ../../data/Dallas/Dallas_listings.csv ../../Dallas/Dallas_reviews.csv merge_data.R
	R --vanilla --args "" < "merge_data.R"
	
../../data/Chicago/Chicago_merged.csv: ../../data/Chicago/Chicago_listings.csv ../../Chicago/Chicago_reviews.csv merge_data.R
	R --vanilla --args "" < "merge_data.R"
	
clean:
	R -e "unlink('../../data/*.*')"

#step 3 clean data 
../../data/Chicago/Chicago_cleaned.csv: ../../data/Chicago/Chicago_merged.csv clean_data.R
	R --vanilla --args "" < "clean_data.R"
	
../../data/Dallas/Dallas_cleaned.csv: ../../data/Dallas/Dallas_merged.csv clean_data.R
	R --vanilla --args "" < "clean_data.R"
		
../../data/Mexico/Mexico_cleaned.csv: ../../data/Mexico/Mexico.csv clean_data.R
	R --vanilla --args "" < "clean_data.R"
	
	
clean:
	R -e "unlink('../../data/*.*')"
