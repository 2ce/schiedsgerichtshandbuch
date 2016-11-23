# Patches
Dieser Ordner enthält Patches für Probleme, die während der Erarbeitung des Handbuchs aufgetreten sind.
Ob sie erforderlich sind, richtet sich nach den Gegebenheiten des Systems, auf dem das Handbuch gerendert werden soll.

## biblatex-juradiss
Danke an Florian für die Hilfe bei diesem Patch.

### Dateien
+ biblatex-juradiss/biblatex-juradiss.bbx
+ biblatex-juradiss/biblatex-juradiss.cbx

### Fehlerbeschreibung
Version 3.3 von **biblatex** hat das Kommando `\DeclareNameFormat` grundlegend verändert.
Da **biblatex-juradiss** aller Wahrscheinlichkeit nach verwaist ist, wird der entsprechende Patch hier mitgeliefert.

### Anwendung
Die Dateien in eines der von LaTeX auszulesenden Verzeichnise kopieren, bspw. `~/texmf/tex/latex/biblatex/`.
Dabei sollte sichergestellt sein, dass die Dateien eine bestehende Version von **biblatex-juradiss** entweder ersetzen, oder mit höherer Priorität eingelesen werden.
