#!/bin/bash

FILE="sghandbuch.template.tex";
PROJECTNAME=${FILE/%.template.tex/};
MODE="$1";
if [ "${MODE}" != "draft" ]; then
    MODE="final"
fi;

if [ ! -e "${FILE}" ]; then
    echo "Texfile ${FILE} missing!"
else
    TEXPATH="${FILE/%.template.tex/.tex}"
    echo "Building buildtemp file for ${MODE}: ${TEXPATH}";
    if [ "${MODE}" == "draft" ]; then
        echo "\\documentclass[${MODE}]{sghandbuch}" > "${TEXPATH}";
    else
        echo "\\documentclass{sghandbuch}" > "${TEXPATH}";
    fi;
    echo "\\input{\"${FILE}\"}" >> "${TEXPATH}"
    
    # Build clean auxilary files
    xelatex "${PROJECTNAME}" && \ 
    xelatex "${PROJECTNAME}" && \
    \
    # Build bib
    biber "${PROJECTNAME}" && \
    \
    # Build clean aux files
    xelatex "${PROJECTNAME}" &&  \
    xelatex "${PROJECTNAME}" && \
    \
    # Build index
    splitindex "${PROJECTNAME}" -- -s "${PROJECTNAME}".ist && \
    \
    # Build nomenclature / abbreviation index \
    makeindex "${PROJECTNAME}".nlo -s nomencl.ist -o "${PROJECTNAME}".nls && \
    \
    # Build clean pdf
    xelatex "${PROJECTNAME}" && \
    xelatex "${PROJECTNAME}" && \
    xelatex "${PROJECTNAME}" && \
    \
    rm "$TEXPATH"

fi;