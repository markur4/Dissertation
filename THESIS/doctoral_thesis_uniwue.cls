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
\usepackage{float} % > For e.g. forced precise image positioning
% \usepackage{etoolbox} % > List processing

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
\usepackage{fontspec} % > For custom fonts
\usepackage{xcolor} % > Required for \definecolor

\setmonofont{inconsolata} % > Overrides monospaced font

% > Use Fontsizes by extarticle
% > \small \Small \footnotesize \scriptsize \tiny 
% > \normalsize \large \Large \LARGE \huge \Huge

% ## Colors of fonts
\definecolor{darkgray}{gray}{0.3}
\let\oldtexttt\texttt
\renewcommand{\texttt}[1]{{\color{darkgray}\oldtexttt{#1}}}


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


% == Horizontal Spacing ================================================
\usepackage{tabto} % > For Tabbing
\TabPositions{0.49in,0.98in,1.47in,1.96in,2.45in,2.94in,3.43in,3.92in,4.41in,4.9in,5.39in,5.88in,}

% ## Define marings
\newlength{\leftm}
\setlength{\leftm}{1.5cm}
\newlength{\rightm}
\setlength{\rightm}{1.5cm}


% == Table of Contents =================================================
\usepackage{tocloft} % > For customizing the table of contents

\renewcommand{\cftbeforesecskip}{0.9ex} % Adjust this value as needed
\renewcommand{\cftbeforesubsecskip}{0.0ex} % Adjust this value as needed
\renewcommand{\cftbeforesubsubsecskip}{0.0ex} % Adjust this value as needed



% == Sections ==========================================================
% > Unnumbered

% ## Main Sections =================================================
\newcommand{\unnsection}[1]{ % > Unnumbered section
    \section*{#1}
    \addcontentsline{toc}{section}{#1}
    \mbox{} % > Add empty line to avoid warnings
    \markboth{#1}{} % > Mark section manually for headers
}

% ## Sub Sections =================================================

% \newcommand{\unnsubsection}[1]{ % > Unnumbered subsection
%     \subsection*{#1}
%     \addcontentsline{toc}{subsection}{#1}
%     \mbox{} % > Add empty line to avoid warnings
%     % \markboth{#1}{} % > Mark subsection manually for headers
% }

\makeatletter % > Make @ a valid character for use in command names
% > Define a new command \unnsubsection
\newcommand{\unnsubsection}{
\@ifnextchar[ % > Check if the next character is [
\unnsubsection@withopt % > If the next character is [, call the \unnsubsection@withopt command
\unnsubsection@withoutopt % > If the next character is not [, call the \unnsubsection@withoutopt command
}
% > Define a new command \unnsubsection@withopt that takes two arguments
\def\unnsubsection@withopt[#1]#2{
    \subsection*{#2} % > Create a new unnumbered subsection with a name #2
    \addcontentsline{toc}{subsection}{#2}% > Add the subsection to the table of contents
    \label{#1} % > Create a unique identifier for the subsection
    \mbox{} % > Add an empty line to avoid warnings
}
% > Define a new command \unnsubsection@withoutopt that takes one argument
\newcommand{\unnsubsection@withoutopt}[1]{
    \subsection*{#1} % > Create a new unnumbered subsection with the same name #1
    \addcontentsline{toc}{subsection}{#1}% > Add the subsection to the table of contents
    \mbox{} % > Add an empty line to avoid warnings
}
\makeatother % > Change the category code of @ back to its original value

% == Abstracts =========================================================

\newcommand{\customabstract}[3]{
    % > #1 argument is the label
    % > #2 argument is the header name
    % > #3 argument is the abstract text
    \phantomsection % > Create a new, invisible section
    \label{#1} % > Create a unique identifier for the abstract
    \addcontentsline{toc}{subsection}{#2} % > Add the header name to the table of contents
    \renewcommand{\abstractname}{#2} % > Rename the abstract
    \begin{abstract}
        #3 % > Insert the abstract text
    \end{abstract}
}


% == Header and Footer =================================================
\usepackage{fancyhdr}

% > Define a new page style
\fancypagestyle{headersfooters}{
    \fancyhf{} % > Clear all headers and footers
    \fancyhead[C]{\nouppercase{\leftmark}\nouppercase{\rightmark}} % > Centered header
    \fancyfoot[C]{\thepage} % > Centered footer with page number
    \renewcommand{\headrulewidth}{0.3pt} % > Adjust header line width
    \renewcommand{\footrulewidth}{0.3pt} % > Add line above footer
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

% ## Define the colors
\definecolor{keywordcolor}{RGB}{0,128,0}  % > Green
\definecolor{commentcolor}{RGB}{64,128,128}  % > Green
\definecolor{stringcolor}{RGB}{186,34,32}  % > Red
% \definecolor{variablecolor}{RGB}{33,33,33}  % > Black

\definecolor{operatorcolor}{RGB}{170,35,255}  % > light Purple
\definecolor{typecolor}{RGB}{0,85,170}  % > Blue
\definecolor{darkpurple}{RGB}{119, 0, 134}  % > dark purple

\definecolor{parentheses}{rgb}{1,0.5,0}

\definecolor{deepblue}{rgb}{0,0,0.7}
\definecolor{darkyellow}{RGB}{200,150,0}
\definecolor{deeporange}{rgb}{0.6,0.3,0}
\definecolor{orange}{rgb}{1,0.5,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}
\definecolor{deepred}{rgb}{0.6,0,0}



% ## Define the default style
\lstdefinestyle{defaultstyle}{
frame=single, % > add a frame
xleftmargin=\leftm,
xrightmargin=\rightm,
basewidth=0.5em, % > Reduce the width of each characters
belowskip=3pt, % > Space after listing
abovecaptionskip=0pt, % > Remove space before caption
numbers=left,  % > Show line numbers
numbersep=5pt,  % > Move line numbers slightly to the right
basicstyle=\linespread{1}\color{darkgray}\ttfamily\small,  % > Variables are black
showstringspaces=false,  % > Don't highlight spaces within strings
keywordstyle=\color{keywordcolor}\bfseries,  % > Keywords are green
commentstyle=\color{commentcolor},  % > Comments are green
stringstyle=\color{stringcolor},  % > Strings are red
classoffset=0,  % > Restoring normal class
literate={ ( }{{{\color{parentheses}(}}}1
        { ) }{{{\color{parentheses})}}}1
{ ] }{{{\color{parentheses}]}}}1
{ [ }{{{\color{parentheses}[}}}1
{ \{ }{{{\color{parentheses}\{}}}1  % Color opening curly braces in dark yellow
{ \} }{{{\color{parentheses}\}}}}1
{ = }{{{\color{operatorcolor}=}}}1,
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
    % keywords={__init__},  % > function names
    % keywordstyle=\color{darkpurple},  % > Emphasized text is deep red
    classoffset=0,  % > Restoring normal class
}


% ## Define styles that prevents page breaks
\lstdefinestyle{defaultstyleNonbreaking}{
    float=h, % > Prevent page breaks & Place at exactly this position
    style=defaultstyle,  % > Use the default style
}
\lstdefinestyle{pythonstyleNonbreaking}{
    float=h, % > Prevent page breaks & Place at exactly this position
    style=pythonstyle,  % > Use the Python style
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
    margin=0.5\leftm]
{caption}
\usepackage{chngcntr} % > For 

\DeclareCaptionFont{oneandhalfspacing}{\setstretch{1}}

% ## Caption styles
% > Listings
\DeclareCaptionLabelFormat{listing}{\textbf{Listing #2}}
% > Figures
\DeclareCaptionLabelFormat{figure}{\textbf{Figure #2}}
\DeclareCaptionLabelFormat{appendixfigure}{\textbf{Appendix Figure #2}}
\newcommand{\refappendixfig}[1]{Appendix A Figure~\ref{#1}}
% > Tables
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
% % > Same as above, but for main sections
% \newcommand{\eachpagesection}[1]{
%     \thispagestyle{headersfooters} % > Set page style
%     \ifnum\value{includepdfpage}=1 % > If first page
%         \addcontentsline{toc}{section}{#1} % > Add to TOC
%     \fi
%     \stepcounter{includepdfpage} % > Increment the includepdfpage counter
% }

% ## Command that makes a subsection from a PDF
% > #1 is the scale of each pdf page, defaults to 98% (.98)
% > #2 {} argument is the name of the toc section
% > #3 {} argument is the name of the file
\newcommand{\addpdf}[3][.98]{
    \setcounter{includepdfpage}{1} % > Reset the includepdfpage counter to 1
    \phantomsection % > Prevents sections occupying the same page
    \includepdf[
        pages=-, % > Include all pages of the PDF
        scale=#1,  % > Scale the PDF to e.g. 98% of the text width
        pagecommand={\eachpage{#2}}, % > Execute command for each page
    ]{#3}
}



% % ## Command that makes a main section from a PDF
% \newcommand{\addpdfsection}[3][.98]{
%     \setcounter{includepdfpage}{1} % > Reset the includepdfpage counter to 1
%     % \phantomsection % > Prevents sections occupying the same page
%     % \addcontentsline{toc}{section}{#2} % > Add a line to TOC
%     % \unnsection{#2}
%     \markboth{#2}{}
%     \includepdf[
%         pages=-, % > Include all pages of the PDF
%         scale=#1,  % > Scale the PDF to 98% of the text width
%         pagecommand={\eachpagesection{#2}}, % > Execute command for each page
%     ]{#3}
% }

