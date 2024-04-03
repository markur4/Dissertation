%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INFORMATION (DO NOT CHANGE!)
%
% Doctoral Thesis (Chapter Based) University of Würzburg
% LaTeX Class
% Version 1.0 (03.2024)
%
% Author of Latex Template: 
% Martin Kuric 
% 
% Cover page is based on a template by the University of Würzburg
%
% This template is licensed under the GNU Public License v3.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ======================================================================
% == Latex Environment
% ======================================================================

% == Class definition ==================================================
% LaTeX2e is the major Latex version, is Latex3 released?
\NeedsTeXFormat{LaTeX2e}

% Make this class usable in main document \documentclass[options]{style}
\ProvidesClass{doctoral_thesis_uniwue}

% Pass through any options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}

% Process given options
\ProcessOptions\relax

% Load the base class
\LoadClass{extarticle}

% == Universal Packages ================================================
\usepackage{float} % needed for e.g. forced precise image positioning

% > adjust float spacing
\setlength{\textfloatsep}{5pt plus 1.0pt minus 2.0pt}



% ======================================================================
% == Document Layout
% ======================================================================


% == Layout ============================================================
\usepackage{geometry} % > Set the general layout of the document
\geometry{
    left = 2cm,
    right = 2cm,
    top = 2cm,
    bottom = 2cm,
    bindingoffset = 5mm}
\usepackage{changepage} % > Allows for layout changes in single pages

% > For empty pages
\newcommand{\blankpage}{
    \clearpage
    \thispagestyle{empty}
    \hfill
    \clearpage
}

% == Fonts =============================================================
\usepackage{fontspec} % > for custom fonts
\setmonofont{inconsolata} % > Overrides monospaced font

% > Use Fontsizes by extarticle
% > \small \Small \footnotesize \scriptsize \tiny 
% > \normalsize \large \Large \LARGE \huge \Huge


% == Vertical Spacing ==================================================
% ## Set line spacing to 1.5
\usepackage{setspace}
\onehalfspacing

% ## Set paragraph spacing
\setlength{\parskip}{6pt}

% ## Define variables to be reused for vertical spacing
\newlength{\vdouble}
\setlength{\vdouble}{1.4cm}
\newlength{\vfull}
\setlength{\vfull}{.7cm}
\newlength{\vhalf}
\setlength{\vhalf}{.35cm}


% == Horizontal Spacing ===============================================
\usepackage{tabto} % > For Tabbing
\TabPositions{0.49in,0.98in,1.47in,1.96in,2.45in,2.94in,3.43in,3.92in,4.41in,4.9in,5.39in,5.88in,}

% ## Define marings
\newlength{\leftm}
\setlength{\leftm}{1.5cm}
\newlength{\rightm}
\setlength{\rightm}{1.5cm}

% == Sections ==========================================================
% ## Define functions to create unnumbered sections
\newcommand{\unnsection}[1]{ % > Unnumbered section
    \section*{#1}
    \addcontentsline{toc}{section}{#1}
    \mbox{} % > Add empty line to avoid warnings
    \markboth{#1}{} % > Mark section manually for headers
}
\newcommand{\unnsubsection}[1]{ % > Unnumbered subsection
    \subsection*{#1}
    \addcontentsline{toc}{subsection}{#1}
    \mbox{} % > Add empty line to avoid warnings
    % \markboth{#1}{} % > Mark subsection manually for headers
}


% == Header and Footer =================================================
\usepackage{fancyhdr}

% > Define a new page style
\fancypagestyle{headersfooters}{
    \fancyhf{} % > Clear all headers and footers
    \fancyhead[C]{\nouppercase{\leftmark}} % > Centered header
    \fancyfoot[C]{\thepage} % > Centered footer with page number
    \renewcommand{\headrulewidth}{0.2pt} % > Adjust header line width
    \renewcommand{\footrulewidth}{0.2pt} % > Add line above footer
}
\pagestyle{headersfooters} % > Set the new page style as default
\setlength{\headheight}{15pt} % > Adjust headheight to avoid warnings




% ======================================================================
% == Text Objects 
% ======================================================================

\usepackage[normalem]{ulem} % > For underlining with dots for handwriting


% == Hyperlinks ========================================================
\usepackage[hidelinks]{hyperref} % > For clickable links, [remove boxes]
\hypersetup{
    colorlinks=false,
    linkcolor=black,
    % filecolor=magenta,      
    citecolor=black,
    urlcolor=blue,
    % pdftitle={Overleaf Example},
    % pdfpagemode=FullScreen,
}


% == Code Syntax Highlighting ==========================================
\usepackage{listings} % > For code listings
\usepackage{xcolor}  % Required for \definecolor

% ## Define the colors
\definecolor{keywordcolor}{RGB}{0,128,0}  % > Green
\definecolor{commentcolor}{RGB}{64,128,128}  % > Green
\definecolor{stringcolor}{RGB}{186,34,32}  % > Red
\definecolor{variablecolor}{RGB}{33,33,33}  % > Black
\definecolor{operatorcolor}{RGB}{170,35,255}  % > light Purple
\definecolor{typecolor}{RGB}{0,85,170}  % > Blue
\definecolor{darkpurple}{RGB}{119, 0, 134}  % > dark purple
\definecolor{deepblue}{rgb}{0,0,0.5}
\definecolor{deepred}{rgb}{0.6,0,0}



% ## Define the default style
\lstdefinestyle{defaultstyle}{
    float=h, % > Prevent page breaks & Place at exactly this position
    frame=single, % > add a frame
    xleftmargin=\leftm,
    xrightmargin=\rightm,
    basewidth=0.5em, % > Reduce the width of each characters
    belowskip=0pt, % > Remove space after listing
    % abovecaptionskip=-3pt, % > Remove space before caption
    numbers=left,  % > Show line numbers
    numbersep=5pt,  % > Move line numbers slightly to the right
    basicstyle=\linespread{1}\color{variablecolor}\ttfamily\small,  % > Variables are black
    showstringspaces=false,  % > Don't highlight spaces within strings
    keywordstyle=\color{keywordcolor}\bfseries,  % > Keywords are green
    commentstyle=\color{commentcolor},  % > Comments are green
    stringstyle=\color{stringcolor},  % > Strings are red
    classoffset=0,  % > Restoring normal class
}

% ## Define the Python style
\lstdefinestyle{pythonstyle}{
    style=defaultstyle,  % > Use the default style
    language=Python,  % > Set the language to Python
    morekeywords={assert},  % > Add Python-specific keywords
    classoffset=1,  % > Starting new class of keywords
    keywordstyle=\color{typecolor},  % > Type built-in functions are blue
    classoffset=2,  % > Starting new class of keywords
    keywords={True, False, None},  % > Add Python-specific keywords
    keywordstyle=\color{keywordcolor},  % > Keywords are green
    classoffset=3,
    keywords={self},  % > Self
    keywordstyle=\color{darkpurple},  % > Keywords are green
    classoffset=4,
    keywords={__init__},  % > function names
    keywordstyle=\color{darkpurple},  % > Emphasized text is deep red
    classoffset=0,  % > Restoring normal class
}




% == Units & Numbers ===================================================
%\usepackage[version=3]{mhchem} % > Package for chemical equation typesetting
%\usepackage{amsmath} % > normal font for math environment
\usepackage{siunitx} % > Provides the \SI{}{} and \si{} command 
\sisetup{range-phrase=--} % > for concentration ranges
\sisetup{range-units=single} % > remove unit after range start
\DeclareSIUnit{\molar}{M} % > Declare  unit molar
\DeclareSIUnit{\bp}{bp} % > Declare unit base pairs
\DeclareSIUnit{\nt}{nt} % > Declare unit nucleotides
\DeclareSIUnit{\X}{X} % > Declare X for concentrations




% ======================================================================
% == External Objects (Images, Tables, etc.)
% ======================================================================


% == Images & Tables ===================================================
\usepackage{graphicx} % > For the inclusion of images
\usepackage{longtable} % > For proper tables
\usepackage{multirow} % > For rows conatining two lines

% ## Define a command to include an image
\newcommand{\includeimage}[4]{
    \begin{figure}[ht]
    \centering
    \includegraphics[width=#2\textwidth]{#1}
    \caption{#3}
    \label{#4}
    \end{figure}
}


% == Captions ==========================================================
% ## Import captions and define sans-serif font
\usepackage[
    font={sf, footnotesize},
    singlelinecheck=false,
    margin=\leftm]
{caption}
% \usepackage[font={sf, footnotesize}]{caption}

\DeclareCaptionFont{oneandhalfspacing}{\setstretch{1}}

% > Make all caption labels bold
\DeclareCaptionLabelFormat{listing}{\textbf{Listing #2}}
\DeclareCaptionLabelFormat{figure}{\textbf{Figure #2}}
\DeclareCaptionLabelFormat{table}{\textbf{Table #2}}

% > Set the caption format for each type of object
\captionsetup[lstlisting]{labelformat=listing,
    font={sf, footnotesize, oneandhalfspacing}}
\captionsetup[figure]{labelformat=figure,
    font={sf, footnotesize, oneandhalfspacing}, belowskip=\vhalf}
\captionsetup[table]{labelformat=table,
    font={sf, footnotesize, oneandhalfspacing}}



% == Citations =========================================================
\usepackage{apacite}
\bibliographystyle{apacite}

\let\fullcite\cite % > Rename \cite to \fullcite
% \let\cite\shortcite % > Rename \shortcite to \cite

\usepackage{natbib} % > For citations without parentheses 
\let\cite\citep % > Rename \citep to \cite
% \citeauthor*{jon90} --> Jones, Baker, and Williams
% \citet*{jon90} --> Jones, Baker, and Williams (1990)
% \citep*{jon90} --> (Jones, Baker, and Williams, 1990)
% \citealt{jon90} --> Jones, Baker, and Williams, 1990

% ## Define the bibliography style
\let\oldthebibliography=\thebibliography
\renewcommand{\thebibliography}[1]{
    \oldthebibliography{#1}
    \setlength{\itemsep}{0pt}
    \footnotesize
}

% == PDF Files =========================================================
\usepackage{pdfpages} % > For including PDF files

% ## Define actions to be executed onto each page during the \includepdf command
% > Define a new counter to keep track of the current page number of the included PDF
\newcounter{includepdfpage}
\newcommand{\eachpage}[1]{
    \thispagestyle{headersfooters} % > Set page style
    \ifnum\value{includepdfpage}=1 % > If first page
        \addcontentsline{toc}{subsection}{#1} % > Add to TOC
    \fi
    \stepcounter{includepdfpage} % > Increment the includepdfpage counter
}

% ## Define a new command to include a PDF and add a table of contents entry for it
% > First argument is the name of the toc section
% > Second argument is the name of the file
% > Scale of each pdf page is set to 0.98 by default
\newcommand{\addpdf}[3][.98]{
    \setcounter{includepdfpage}{1} % > Reset the includepdfpage counter to 1
    \phantomsection % > Prevents sections occupying the same page
    \includepdf[
        pages=-, % > Include all pages of the PDF
        scale=#1,  % > Scale the PDF to 98% of the text width
        pagecommand={\eachpage{#2}}, % > Execute command for each page
    ]{#3}
}

% !! Doesn't work, because it enumerates subsections in TOC
% \newcommand{\addpdf}[3][.98]{
%     \includepdf[
%         pages=-,
%         scale=#1,
%         % pagecommand={\pdfpagestyle},
%         pagecommand={
%                 \thispagestyle{headersfooters}\subsection*{#2}\addcontentsline{toc}{subsection}{#2}
%             },
%         % addtotoc={
%         %         1, % > Page number relative to the first page of the pdf
%         %         subsection, % > Level for TOC entry
%         %         2, % > Depth of the section (1 for section, 2 for subsection, etc.)
%         %         #2, % > Label for the section
%         %         % sec:#2 % > Label for the section
%         % }
%     ]{#3}
% }






%% OLD STUFF ==========================================================

% % \documentclass[12pt]{article}
% \usepackage{amsmath}
% \usepackage{latexsym}
% \usepackage{amsfonts}
% \usepackage[normalem]{ulem}
% \usepackage{array}
% \usepackage{amssymb}
% \usepackage{graphicx}
% % \usepackage[backend=biber,
% % style=numeric,
% % sorting=none,
% % isbn=false,
% % doi=false,
% % url=false,
% % ]{biblatex}\addbibresource{bibliography.bib}

% \usepackage{subfig}
% \usepackage{wrapfig}
% \usepackage{wasysym}
% \usepackage{enumitem}
% \usepackage{adjustbox}
% \usepackage{ragged2e}
% \usepackage[svgnames,table]{xcolor}
% \usepackage{tikz}
% \usepackage{longtable}
% \usepackage{changepage}
% \usepackage{setspace}
% \usepackage{hhline}
% \usepackage{multicol}
% \usepackage{tabto}
% \usepackage{float}
% \usepackage{multirow}
% \usepackage{makecell}
% \usepackage{fancyhdr}
% \usepackage[toc,page]{appendix}
% \usepackage[hidelinks]{hyperref}
% \usetikzlibrary{shapes.symbols,shapes.geometric,shadows,arrows.meta}
% \tikzset{>={Latex[width=1.5mm,length=2mm]}}
% \usepackage{flowchart}
% \usepackage[utf8]{inputenc}
% \usepackage[T1]{fontenc}
% \TabPositions{0.49in,0.98in,1.47in,1.96in,2.45in,2.94in,3.43in,3.92in,4.41in,4.9in,5.39in,5.88in,}

% \urlstyle{same}

% % == Page layout ======================================================
% \usepackage[
% 	paperheight=11.69in,
% 	paperwidth=8.27in,
% 	left=0.98in,
% 	right=0.98in,
% 	top=0.98in,
% 	bottom=0.79in,
% 	headheight=1in]{geometry}



% % 


%  %%%%%%%%%%%%  Set Depths for Nested Lists created by \begin{enumerate}  %%%%%%%%%%%%%%


% \setlistdepth{9}
% \renewlist{enumerate}{enumerate}{9}
% 		\setlist[enumerate,1]{label=\arabic*)}
% 		\setlist[enumerate,2]{label=\alph*)}
% 		\setlist[enumerate,3]{label=(\roman*)}
% 		\setlist[enumerate,4]{label=(\arabic*)}
% 		\setlist[enumerate,5]{label=(\Alph*)}
% 		\setlist[enumerate,6]{label=(\Roman*)}
% 		\setlist[enumerate,7]{label=\arabic*}
% 		\setlist[enumerate,8]{label=\alph*}
% 		\setlist[enumerate,9]{label=\roman*}

% \renewlist{itemize}{itemize}{9}
% 		\setlist[itemize]{label=$\cdot$}
% 		\setlist[itemize,1]{label=\textbullet}
% 		\setlist[itemize,2]{label=$\circ$}
% 		\setlist[itemize,3]{label=$\ast$}
% 		\setlist[itemize,4]{label=$\dagger$}
% 		\setlist[itemize,5]{label=$\triangleright$}
% 		\setlist[itemize,6]{label=$\bigstar$}
% 		\setlist[itemize,7]{label=$\blacklozenge$}
% 		\setlist[itemize,8]{label=$\prime$}

% \setlength{\topsep}{0pt}\setlength{\parindent}{0pt}
% \renewcommand{\arraystretch}{1.3}




