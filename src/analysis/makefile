DATA = ../../data
GEN = ../../gen

all: $(GEN)/analysis/output/regression_table.tx $(GEN)/graph/Chicago/Chicago_plots.pdf $(GEN)/graph/Dallas/Dallas_plots.pdf $(GEN)/graph/Mexico/Mexico_plots.pdf

#run calculation for distance
$(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv Distance.R
		R --vanilla < "Distance.R"

#run analysis
$(GEN)/analysis/output/regression_table.tx: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv analyze.R
		R --vanilla < "analyze.R"	

#run graphs 
$(GEN)/graph/Chicago/Chicago_plots.pdf $(GEN)/graph/Dallas/Dallas_plots.pdf $(GEN)/graph/Mexico/Mexico_plots.pdf: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv Graph.R
		R --vanilla < "graph.R"
	



	


