
uml:
	make -C uml

all: uml design.pdf

produce : design.pdf

design.pdf: design.tex uml/* 
	pdflatex design

.PHONY: uml all