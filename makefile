final_paper.rmd: gen/Mexico_graph gen/Dallas_graph gen/Chicago_graph ... 
  R --vanilla --args "" < "..."



../../gen/Mexico_graph: ../../data/Mexico/Mexico_cleaned_for_dist.csv graph.R
  R --vanilla --args "" < "graph.R"