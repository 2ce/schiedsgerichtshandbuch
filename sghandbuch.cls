\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sghandbuch}[2015/04/19 SG Handbuch Klasse CC-BY-SA-NC Florian Zumkeller-Quast]

\RequirePackage{ifthen}
\newboolean{isDraft}
\setboolean{isDraft}{false}

\RequirePackage{kvoptions}
\RequirePackage{setspace}


\DeclareOption{draft}{%
    \setboolean{isDraft}{true}%
}%

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrbook}}

\DeclareStringOption[Schiedsgerichtshandbuch CC-BY-SA-NC Simon Gauseweg \& Florian Zumkeller-Quast]{doctitle}
\DeclareStringOption[Schiedsgerichtshandbuch CC-BY-SA-NC Simon Gauseweg \& Florian Zumkeller-Quast]{docauthor}


\ProcessKeyvalOptions*
\ProcessOptions\relax

\ifthenelse{\boolean{isDraft}}{%
    \ClassInfo{sghandbuch}{Creating Draft Build}%
    \LoadClass[%
        onecolumn,	%
        a4paper,		%
        11pt,			%
        oneside,		%
        DIV=calc,		% führt die Satzspiegelberechnung neu aus
        BCOR=8mm,		% Bindekorrektur, liegt je nach Druck zwischen 8-15mm
        index=totoc,		% Indizes in die TOC
    ]{scrbook}
}{%
    \ClassInfo{sghandbuch}{Creating Final Build}%
    \LoadClass[%
        twocolumn,	%
        a4paper,		%
        11pt,			%
        twoside,		%
        DIV=calc,		% führt die Satzspiegelberechnung neu aus
        BCOR=8mm,		% Bindekorrektur, liegt je nach Druck zwischen 8-15mm
        index=totoc,		% Indizes in die TOC
    ]{scrbook}
}%


\RequirePackage{sghandbuch}
\RequirePackage{geometry}

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


\renewcommand{\nomname}{Abkürzungsverzeichnis}

% Fix: Paragraphenindex / Fußnoten
\newcommand{\indexPar}[1]{\index[paridx]{#1}}
\newcommand{\indexRul}[1]{\index[ruling]{#1}}
\newcommand{\indexIdx}[1]{\index[idx]{#1}}

% \RequirePackage{helvet}
% \RequirePackage{sourcesanspro}
\RequirePackage{libertine}
% \renewcommand{\familydefault}{\sfdefault}

\ifthenelse{\boolean{isDraft}}{% Draft
    \geometry{left=2cm,right=7cm,top=2cm,bottom=2cm}%
    \newcommand{\togglecolumnmode}{\onecolumn}%
    \let\oldmainmatter\mainmatter
    \newcommand{\newmainmatter}{\oldmainmatter\onehalfspacing}
    \let\mainmatter\newmainmatter
}{%
    \geometry{inner=2cm,outer=2cm,top=2cm,bottom=2cm}%
    \newcommand{\togglecolumnmode}{%
        \if@twocolumn%
            \onecolumn%
        \else%
            \twocolumn%
        \fi%
    }%
}%
