# Makefile for generating pdfs from Latex
CC = gcc
LATEX = pdflatex
BIBER = biber
MKGLOSS = makeglossaries
CFLAGS = -Wall
LDFLAGS = -lgcrypt
RM = rm
CD = cd
#RMFLAGS = -i
RMFLAGS = 

DIR_OUT = out
DIR_USE = user_data
DIR_SRC = .

TARGET = thesis
MAIN = 00_main
BIB = 0_X_literature.bib

.PHONY: clean


all: $(DIR_OUT)/$(TARGET).pdf

clean:
	$(RM) $(RMFLAGS) $(DIR_OUT)/*

$(DIR_OUT)/$(TARGET).pdf: $(DIR_SRC)/$(MAIN).tex $(DIR_OUT)/$(TARGET).bbl
	$(CD) $(DIR_SRC) && $(LATEX) -output-directory=$(DIR_OUT) -jobname=$(TARGET) $^
	$(CD) $(DIR_OUT) && $(MKGLOSS) $(TARGET)
	$(CD) $(DIR_SRC) && $(LATEX) -output-directory=$(DIR_OUT) -jobname=$(TARGET) $^
	$(CD) $(DIR_SRC) && $(LATEX) -output-directory=$(DIR_OUT) -jobname=$(TARGET) $^

$(DIR_OUT)/$(TARGET).bbl: $(DIR_OUT)/$(TARGET).aux
	$(BIBER) --output-directory $(DIR_OUT) --input-directory $(DIR_OUT) $(TARGET)


$(DIR_OUT)/$(TARGET).aux: $(DIR_SRC)/$(MAIN).tex $(DIR_USE)/$(BIB)
	$(CD) $(DIR_SRC) && $(LATEX) -output-directory=$(DIR_OUT) -jobname=$(TARGET) $^

