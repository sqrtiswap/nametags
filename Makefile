LATEXCOMPILER = pdflatex
FILE = nametags

CHECK_ZATHURA := $(shell command -v zathura > /dev/null)
CHECK_SKIM := $(shell brew list skim > /dev/null)
ifdef CHECK_ZATHURA
	VIEWER = ZATHURA
else CHECK_SKIM
	VIEWER = open -a Skim.app
else
	VIEWER = open
endif

.DEFAULT_GOAL := all

all: pdf clean

clean:
	@rm -f *.dvi *.out *.aux *.log *.toc *.bbl *.blg *.ps

cleanall: clean
	@rm -f *.pdf

pdf:
	$(LATEXCOMPILER) ${FILE}.tex

show: all
	$(VIEWER) ${FILE}.pdf

.PHONY: all clean cleanall pdf show
