\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sghandbuch}[2015/04/19 SG Handbuch Klasse CC-BY-SA-NC Florian Zumkeller-Quast]

\RequirePackage{kvoptions}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrbook}}

\DeclareStringOption[Schiedsgerichtshandbuch CC-BY-SA-NC Simon Gauseweg \& Florian Zumkeller-Quast]{doctitle}
\DeclareStringOption[Schiedsgerichtshandbuch CC-BY-SA-NC Simon Gauseweg \& Florian Zumkeller-Quast]{docauthor}

\ProcessOptions\relax

\LoadClass[twocolumn,	%
  a4paper,		%
  11pt,			%
  twoside,		%
  DIV=calc,		% führt die Satzspiegelberechnung neu aus
  BCOR=8mm,		% Bindekorrektur, liegt je nach Druck zwischen 8-15mm
]{scrbook}

\RequirePackage{sghandbuch}
\RequirePackage{geometry}

% \newenvironment{onecolumn}{\onecolumn}{\twocolumn}

%
% Links
%
\hypersetup{
    linktocpage=true,
    linktoc=all,
    naturalnames=true,
    hypertexnames=false,
    breaklinks=true,
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black,
    pdfinfo={  
      Title={\sghandbuch@doctitle},
      Subject={\sghandbuch@doctitle},
      Keywords={\sghandbuch@doctitle},
      pdfdisplaydoctitle={\sghandbuch@doctitle},
      Author={\sghandbuch@docauthor},
      Producer={\sghandbuch@docauthor},
      Creator={\sghandbuch@docauthor}
    },
    pdfcreator={\sghandbuch@docauthor},
    pdflang={de}
}

% \RequirePackage{helvet}
\RequirePackage{sourcesanspro}
\renewcommand{\familydefault}{\sfdefault}
\geometry{inner=2cm,outer=2cm,top=2cm,bottom=2cm}
