# Build the write-up. Requires latexmk and a TeX distribution with acmart.

MAIN    := main
OUTDIR  := output
LATEXMK := latexmk -synctex=1 -pdf -outdir=$(OUTDIR)
PDF     := $(OUTDIR)/$(MAIN).pdf
SOURCES := $(wildcard *.tex) $(wildcard bibliography/*.bib)

.PHONY: all watch view clean distclean

all: $(PDF)

$(PDF): $(SOURCES)
	$(LATEXMK) $(MAIN).tex

# Rebuild on every save.
watch:
	$(LATEXMK) -pvc $(MAIN).tex

view: $(PDF)
	open $(PDF)

# Remove auxiliary files and keep the pdf.
clean:
	$(LATEXMK) -c $(MAIN).tex

# Remove auxiliary files and the pdf.
distclean:
	$(LATEXMK) -C $(MAIN).tex
