TEXC  = latex
PDFC  = pdflatex
BIBC  = biber
HTMLC = latex2html -info 0 -split 0 -no-navigation -html_version=4.1
VIEWC = dvips
P2PC  = ps2pdf -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode
PSNUP = psnup -4 -l -m5 -b5
FORCE = touch
VIEW  = evince
INDEX = makeindex

SUBDIRS = images

TEXD   = $(wildcard chapters/*.tex)
LATEXD = $(wildcard main.tex)
LATEXS = $(wildcard main.slide.tex)
PSS    = $(patsubst %.tex,%.ps,$(LATEXD))
DVIS   = $(patsubst %.tex,%.dvi,$(LATEXD))
PDFS   = $(patsubst %.tex,%.pdf,$(LATEXD))
HTMLS  = $(patsubst %.tex,%.html,$(LATEXD))
SLIDES = $(patsubst %.slide,%.slide.pdf,$(LATEXS))
SLIDEV = $(patsubst %.slide,%.view.pdf,$(LATEXS))
SLIDEP = $(patsubst %.slide,%.prn.pdf,$(LATEXS))

all: $(PDFS)
ps: $(PSS)
dvi: $(DVIS)
pdf: $(PDFS)
html: ${HTMLS}
slide: $(SLIDES)
slideview: $(SLIDEV)
slideprn: $(SLIDEP)

subdirs:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

bib: $(PDFS)
	@$(BIBC) `echo $< | sed 's/\.pdf//'`
	@rm $<
	@$(FORCE) $(LATEXD)

index: $(PDFS)
	@$(INDEX) main.nlo -s nomencl.ist -o main.nls

%.ps: %.tex
	@$(TEXC) $<
	@echo "Reparsing for TOC and AUX ..."
	@$(TEXC) $< >/dev/null 2>/dev/null
	@$(VIEWC) `echo $< | sed 's/\.latex/\.dvi/'`
	@rm -f *.log *.dvi *.out

%.prn.pdf: %.slide
	@$(TEXC) $<
	@echo "Reparsing for TOC and AUX ..."
	@$(TEXC) $< >/dev/null 2>/dev/null
	@$(VIEWC) `echo $< | sed 's/\.slide/\.dvi/'`
	@$(PSNUP) `echo $< | sed 's/\.slide/\.ps/'` > `echo $< | sed 's/\.slide/\.prn.ps/'`
	@$(P2PC) `echo $< | sed 's/\.slide/\.prn.ps/'` $@
	@rm -f *.log *.dvi *.out `echo $< | sed 's/\.slide/\.ps/'` `echo $< | sed 's/\.slide/\.prn.ps/'`

%.slide.pdf: %.slide
	@$(TEXC) $<
	@echo "Reparsing for TOC and AUX ..."
	@$(TEXC) $< >/dev/null 2>/dev/null
	@$(VIEWC) `echo $< | sed 's/\.slide/\.dvi/'`
	@$(P2PC) `echo $< | sed 's/\.slide/\.ps/'` $@
	@rm -f *.log *.dvi *.out `echo $< | sed 's/\.slide/\.ps/'`

%.view.pdf: %.slide
	@$(TEXC) $<
	@echo "Reparsing for TOC and AUX ..."
	@$(TEXC) $< >/dev/null 2>/dev/null
	@$(VIEWC) `echo $< | sed 's/\.slide/\.dvi/'`
	@$(P2PC) `echo $< | sed 's/\.slide/\.ps/'` $@
	@rm -f *.log *.dvi *.out `echo $< | sed 's/\.slide/\.ps/'`

%.pdf: %.tex ${TEXD}
	@$(PDFC) $<
	@echo "Reparsing for TOC and AUX ..."
	@$(PDFC) $< >/dev/null 2>/dev/null
	@rm -f *.log *.out
	@rm -f *.log *.out
	@$(VIEW) $@ 1>/dev/null 2>&1 &

%.html: %.latex
	@$(HTMLC) $<
	@cat `echo $< | sed 's/\.latex//'`/`echo $< | sed 's/\.latex//'`.html | sed 's/CELLPADDING=[^> ]*/CELLPADDING=0 CELLSPACING=0/' > `echo $< | sed 's/\.latex//'`/eTestXXXXX.html
	@mv `echo $< | sed 's/\.latex//'`/eTestXXXXX.html `echo $< | sed 's/\.latex//'`/`echo $< | sed 's/\.latex//'`.html
	@rm `echo $< | sed 's/\.latex//'`/index.html

forceit: $(LATEXD)
	@$(FORCE) $<
	@rm main.pdf

force: forceit all

view: $(PDFS)
	@$(VIEW) $< &

fedora-install:
	@sudo dnf install texlive-newtx texlive-textpos texlive-chngcntr texlive-tocloft texlive-floatrow texlive-biblatex-apa

zip: clean
	@zip -r is-bpm-thesis-latex *

clean:
	@rm -f *.ps *.dvi main.pdf *.bak *.log *.aux *.toc *.out *.bbl *.blg main.nls main.nlo main.lo* main.ilg main.ind main.bcf main.run.xml
	@echo
	@echo "   Cleaned Directory!"
	@echo
