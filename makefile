all: data-preparation analysis

data-preparation:
	make src/data-preparation

analysis: data-preparation
	make src/analysis
		
