DATA = ../../data
GEN = ../../gen

all: $(GEN)/analysis/output/regression_table.txt $(GEN)/graph/Mexico/Mexico_graph.pdf $(GEN)/graph/Dallas/Dallas_graph.pdf $(GEN)/graph/Chicago/Chicago_graph.pdf

#create graphs 
$(GEN)/graph/Mexico/Mexico_graph.pdf $(GEN)/graph/Dallas/Dallas_graph.pdf $(GEN)/graph/Chicago/Chicago_graph.pdf: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv graph.R
		R --vanilla "" < "graph.R"

#create regression table 		
$(GEN)/analysis/output/regression_table.txt: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv analyze.R
		R --vanilla "" < "analyze.R"
