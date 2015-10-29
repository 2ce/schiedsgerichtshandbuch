#!/bin/bash

# Build clean auxilary files
xelatex sghandbuch && \ 
xelatex sghandbuch && \
\
# Build bib
biber sghandbuch && \
\
# Build clean aux files
xelatex sghandbuch &&  \
xelatex sghandbuch && \
\
# Build index
splitindex sghandbuch -- -s sghandbuch.ist && \
\
# Build nomenclature / abbreviation index \
makeindex sghandbuch.nlo -s nomencl.ist -o sghandbuch.nls && \
\
# Build clean pdf
xelatex sghandbuch && \
xelatex sghandbuch && \
xelatex sghandbuch 
