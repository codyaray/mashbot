
all: produce

uml:
	make -C uml/ all

all: uml design.pdf

pdf: produce
	evince design.pdf

produce : design.pdf

design.pdf: design.tex uml 
	pdflatex design

.PHONY: uml all
