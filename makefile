all: $(GEN)/analysis/output/regression_table.txt $(GEN)/graph/Mexico/Mexico_graph.pdf $(GEN)/graph/Dallas/Dallas_graph.pdf $(GEN)/graph/Chicago/Chicago_graph.pdf $(DATA)/Chicago/Chicago_merged.csv

#step 1 download data  
$(DATA)/Chicago/Chicago_listings.csv $(DATA)/Chicago/Chicago_reviews.csv $(DATA)/Mexico/Mexico_listings.csv $(DATA)/Mexico/Mexico_reviews.csv $(DATA)/Dallas/Dallas_listings.csv $(DATA)/Dallas/Dallas_reviews.csv: src/data-preparation/download_data.R
		R --vanilla < "src/data-preparation/download_data.R"	

#merge data 
$(DATA)/Chicago/Chicago_merged.csv $(DATA)/Dallas/Dallas_merged.csv $(DATA)/Mexico/Mexico_merged.csv: $(DATA)/Chicago/Chicago_listings.csv $(DATA)/Chicago/Chicago_reviews.csv $(DATA)/Mexico/Mexico_listings.csv $(DATA)/Mexico/Mexico_reviews.csv $(DATA)/Dallas/Dallas_reviews.csv $(DATA)/Dallas/Dallas_listings.csv src/data-preparation/merge_data.R
	R --vanilla < "src/data-preparation/merge_data.R"

#clean data 
$(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv: $(DATA)/Chicago/Chicago_merged.csv  $(DATA)/Dallas/Dallas_merged.csv  $(DATA)/Mexico/Mexico_merged.csv src/data-preparation/clean_data.R
		R --vanilla < "src/data/data-preparation/clean_data.R"
		
#write output
#create graphs 
$(GEN)/graph/Mexico/Mexico_graph.pdf $(GEN)/graph/Dallas/Dallas_graph.pdf $(GEN)/graph/Chicago/Chicago_graph.pdf: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv src/analysis/graph.R
		R --vanilla "" < "src/analysis/graph.R"
		
#create regression table 		
$(GEN)/analysis/output/regression_table.txt: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv src/analysis/analyze.R
		R --vanilla "" < "src/analysis/analyze.R"
		