#run analysis 
../../gen/Dallas_reg: ../../Dallas_cleaned analyze.R
	R --vanilla --ars "" < "analyze.R"

../../gen/Chicago: ../../Chicago_cleaned analyze.R
	R --vanilla --ars "" < "analyze.R"
	
../../gen/Mexico: ../../Mexico_cleaned analyze.R
	R --vanilla --ars "" < "analyze.R"

#write graphs 
../../gen/Mexico_graph: ../../data/Mexico/Mexico_cleaned_for_dist.csv graph.R
  R --vanilla --args "" < "graph.R"
  
../../gen/Dallas_graph: ../../data/Dallas/Dallas_cleaned_for_dist.csv graph.R
  R --vanilla --args "" < "graph.R"
  
../../gen/Chicago_graph: ../../data/Chicago/Chicago_cleaned_for_dist.csv graph.R
  R --vanilla --args "" < "graph.R"
  
#run regression 
../../gen/Chicago_regression: ../..data/Chicago/Chicago_cleaned_for_dist analyze.R
	R --vanilla --args "" < "analyze.R"
	
../../gen/Mexico_regression: ../..data/Mexico/Mexico_cleaned_for_dist analyze.R
	R --vanilla --args "" < "analyze.R"	
	
../../gen/Dallas_regression: ../..data/Dallas/Dallas_cleaned_for_dist analyze.R
	R --vanilla --args "" < "analyze.R"