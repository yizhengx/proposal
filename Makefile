.PHONY : FORCE_MAKE all clean
VARS := TEXINPUTS="sty:" BSTINPUTS="sty:"

all : causal.pdf

view: causal.tex
	$(VARS) latexmk -pdf -pvc $< -interaction=nonstopmode

%.pdf : %.tex FORCE_MAKE
	$(VARS) latexmk -pdf -M -MP -MF -dvi- -ps- $<

clean:
	latexmk -C
	rm -f *.deps
	-rm -fv *~ *.aux mpc.pdf *.bbl *.blg *.log

