# Makefile for generating pdfs from Latex
LATEXMK = latexmk
ECHO = echo
RM = rm
CD = cd
#RMFLAGS = -i
RMFLAGS = 

DIR_OUT = out
DIR_SRC = .
DIR_USE = $(DIR_SRC)/user_data
DIR_STATIC = $(DIR_SRC)/static

TARGET = thesis
MAIN = 00_main

.PHONY: clean
.DEFAULT: all


all: $(DIR_OUT)/$(TARGET).pdf

clean:
	$(RM) $(RMFLAGS) $(DIR_OUT)/*

$(DIR_OUT)/$(TARGET).pdf: $(DIR_SRC)/$(MAIN).tex $(DIR_USE)/*.tex
	$(ECHO) "Making $(basename $(@F))!"
	$(CD) $(<D) && $(LATEXMK) \
		-f \
		-interaction=nonstopmode \
		-lualatex \
		-pdflua \
		-shell-escape \
		-r "$(DIR_STATIC)/glossaries.latexmk" \
		-output-directory=$(DIR_OUT) \
		-aux-directory=$(DIR_OUT) \
		-jobname=$(basename $(@F)) \
		-time $(1) \
		$<
	$(ECHO) "Done with $(basename $(@F))!"
	# Cleanup the temporary files produced by latex
	#$(CD) $(<D) && latexmk -c -pdf -output-directory=$(DIR_OUT) -jobname=$(basename $(@F)) $<

