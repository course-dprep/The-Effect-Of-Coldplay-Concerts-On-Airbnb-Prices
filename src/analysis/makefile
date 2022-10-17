all: $(GEN)/analysis/output/regression_table.txt $(GEN)/graph/Mexico/Mexico_graph.pdf $(GEN)/graph/Dallas/Dallas_graph.pdf $(GEN)/graph/Chicago/Chicago_graph.pdf

#write output
#create graphs 
$(GEN)/graph/Mexico/Mexico_graph.pdf $(GEN)/graph/Dallas/Dallas_graph.pdf $(GEN)/graph/Chicago/Chicago_graph.pdf: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv src/analysis/graph.R
		R --vanilla "" < "src/analysis/graph.R"
		
#create regression table 		
$(GEN)/analysis/output/regression_table.txt: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv src/analysis/analyze.R
		R --vanilla "" < "src/analysis/analyze.R"
