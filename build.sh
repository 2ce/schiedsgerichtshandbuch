#!/bin/bash

# Build clean auxilary files
xelatex sghandbuch
xelatex sghandbuch

# Build bib
biber sghandbuch

# Build clean aux files
xelatex sghandbuch
xelatex sghandbuch

# Build index
splitindex sghandbuch

# Build clean pdf
xelatex sghandbuch
xelatex sghandbuch
xelatex sghandbuch
