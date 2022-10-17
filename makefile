all: paper analysis data-preparation

data-preparation:
	 make -C src/data-preparation

analysis: data-preparation
		make -C src/analysis

paper: data-preparation analysis
		Rscript -e "rmarkdown::render('gen/paper/RMarkdown.Rmd')"
