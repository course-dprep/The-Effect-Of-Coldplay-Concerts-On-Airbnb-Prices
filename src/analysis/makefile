GEN = ../../gen
DATA = ../../data

#run analysis
$(GEN)/Chicago/Chicago_reg $(GEN)/Dallas/Dallas_reg $(GEN)/Mexico/Mexico_reg: $(DATA)/Chicago/Chicago_cleaned.csv $(Data)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv analyze.R
	R --vanilla --args "" < "analyze.R"	

#run graphs 
$(GEN)/Chicago/Chicago_graph $(GEN)/Dallas/Dallas_graph $(GEN)/Mexico/Mexico_graph: $(DATA)/Chicago/Chicago_cleaned.csv $(DATA)/Dallas/Dallas_cleaned.csv $(DATA)/Mexico/Mexico_cleaned.csv Graph.R
	R -- vanilla --args "" < "graph.R"
	
	


