
all: gen/graph/Mexico/Mexico_graph.pdf gen/graph/Dallas/Dallas_graph.pdf gen/graph/Chicago/Chicago_graph.pdf gen/analysis/output/regression_table.txt

#create graphs 
gen/graph/Mexico/Mexico_graph.pdf gen/graph/Dallas/Dallas_graph.pdf gen/graph/Chicago/Chicago_graph.pdf : Data/Chicago/Chicago_cleaned.csv data/Mexico/Mexico_cleaned.csv data/Dallas/Dallas_cleaned.csv src/analysis/graph.R
		R --vanilla "" < "src/analysis/graph.R"
		
#create regression table 		
gen/analysis/output/regression_table.txt: data/Chicago/Chicago_cleaned.csv data/Dallas/Dallas_cleaned.csv data/Mexico/Mexico_cleaned.csv src/analysis/analyze.R
		R --vanilla "" < "src/analysis/analyze.R"
		
		
