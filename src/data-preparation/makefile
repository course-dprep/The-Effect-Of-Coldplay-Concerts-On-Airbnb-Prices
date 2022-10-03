
All: ../../data/Mexico.csv

#step 2 
../../data/Mexico.csv: ../../data/Mexico/Mexico_listings.csv ../../Mexico/Mexico_reviews.csv merge_data.R
	R --vanilla --args "" < "merge_data.R"

../../data/Mexico/Mexico_listings.csv ../../Mexico/Mexico_reviews.csv: download_data.R
	Rscript download_data.R

clean:
	R -e "unlink('../../data/*.*')"



