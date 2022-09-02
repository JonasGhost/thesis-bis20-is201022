#!/bin/bash

latexmk \
    -f \
    -interaction=nonstopmode \
    -lualatex \
    -pdflua \
    -shell-escape \
    -r static/glossaries.latexmk \
    -output-directory=out \
    -aux-directory=out \
    -jobname=thesis \
    -time \
    00_main.tex

