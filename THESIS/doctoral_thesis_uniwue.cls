%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% > !! TEMPLATE INFORMATION
% > !! DO NOT CHANGE !!
% > 
% > Doctoral Thesis University of Würzburg
% > LaTeX Class
% > Version 1.0 (05.2024)
% > 
% > 
% > AUTHOR: 
% > Martin Kuric (github: markur4)
% > 
% > 
% > LICENSE: 
% > GNU Public License v3.0
% > Do what you want with this template, but
% > please keep the author's name and the license. 
% > And don't blame the author
% > 
% > 
% > REFERENCES:
% > Cover page is based on a template by the University of Würzburg
% > 
% > 
% > INFO:
% > Used for Chapter based thesis, but works with manuscript as well
% > 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% ======================================================================
% ======================================================================
% ======================================================================
% == LATEX ENVIRONMENT 


% == Latex Version =====================================================
% ## LaTeX2e is the major Latex version, is Latex3 released?
\NeedsTeXFormat{LaTeX2e}


% == Base Class ========================================================
% ## Pass through any options to the base class
% ' e.g. \documentclass[options]{class}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax % > Process options, but stop looking for more

% ## Base Class
\LoadClass{extarticle}

% ## Make the class "doctoral_thesis_uniwue" usable in main document 
% ' e.g. \documentclass[options]{doctoral_thesis_uniwue}
\ProvidesClass{doctoral_thesis_uniwue}





% ======================================================================
% ======================================================================
% ======================================================================
% == IMPORTS 

% == General Packages 
\usepackage{xparse} % > For advanced command definitions
\usepackage{xstring} % > For string processing e.g. \IfStrEq
\usepackage{xspace} % > For adding spaces after commands
\usepackage{etoolbox} % > List processing

% == Document Layout 
\usepackage{geometry} % > Set the general layout of the document
\usepackage{changepage} % > Allows for layout changes in single pages

% == Fonts 
\usepackage{fontspec} % > For custom fonts
\usepackage{xcolor} % > Required for \definecolor
% \usepackage{microtype} % > For better font rendering, like narrow characters

% == Vertical/Horizontal Spacing 
\usepackage{float} % > For e.g. forced precise image positioning
\usepackage{setspace} % > For line spacing
\usepackage{tabto} % > For Tabbing
\usepackage{needspace} % > For keeping text together on the same page

% ## adjust float spacing
\setlength{\textfloatsep}{5pt plus 1.0pt minus 2.0pt}

% ## Define lengths for margins
\newlength{\leftm}
\setlength{\leftm}{2cm} % > Inner Margin 
\newlength{\rightm}
\setlength{\rightm}{3cm} % > Outer Margin (near the gutter)

% \setlength{\oddsidemargin}{3in} 

% ## Set the general layout of the document
\geometry{
    % left = \leftm, % > For one-sided layout
    % right = \rightm, % > For one-sided layout
    inner = \leftm, % > For two-sided layout
    outer= \rightm, % > For two-sided layout
    top = 2cm,
    bottom = 2cm,
    bindingoffset = 5mm}


% == Sections ==========================================================
\usepackage{tocloft} % > For customizing the table of contents
\usepackage{titlesec} % > For customizing sections
\usepackage{abstract} % > For customizing abstracts
\usepackage{appendix} % > For appendices


% == Page Head and Foot 
\usepackage{fancyhdr} % > For customizing headers and footers
\usepackage{endnotes} % > For summarizing footnotes on a page

% == Abbreviations 
\usepackage[
    printonlyused,
    withpage % > Print the page number where the abbreviation was used
    % footnote, % > First abbreviations as footnotes
    % smaller,
    % nohyperlinks,
    % nolist, % > Don't list the abbreviations
]{acronym}



% == Items
\usepackage{enumitem}
\setlist[itemize]{noitemsep, topsep=0pt, parsep=2pt, partopsep=0pt}
\setlist[enumerate]{noitemsep, topsep=0pt, parsep=2pt, partopsep=0pt}


% == Special Formats: Math, Units, Dates, etc. ================================
\usepackage{amsmath}  % > Enhances math handling in LaTeX
\usepackage{siunitx} % > For units
% \usepackage{mhchem} % > For chemical equations
\usepackage[normalem]{ulem} % > For underlining with dots for handwriting
\usepackage[hidelinks]{hyperref} % > For clickable links, [remove boxes]
\usepackage[
    style=ddmmyyyy,
    datesep={.}
]{datetime2} % > Confifure date formats


% == Captions 
\usepackage[ % ## Customize captions
    font={sf, footnotesize},
    singlelinecheck=false,
    margin=0.5\leftm
]{caption}
\usepackage{chngcntr} % > For continuous numbering of figures and tables

% == Images, Listings, Tables ==========================================
\usepackage{graphicx} % > For the inclusion of images
% \usepackage{wrapfig} % > For wrapping text around images
\usepackage{listings} % > For code listings
\usepackage{longtable} % > For proper tables
\usepackage{hhline} % > For better lines in tables
\usepackage{multirow} % > For rows conatining two lines

%== Footnotes
\usepackage{perpage} % > For resetting counters per page

% == Citations 
\usepackage{apacite} % > For citations
\usepackage{natbib} % > For citations without parentheses

% == PDF Files 
\usepackage{pdfpages} % > For including PDF files




% ======================================================================
% ======================================================================
% ======================================================================
% == COMMANDS



% ======================================================================
% == Document Layout
% ======================================================================

% == Layout ============================================================

% ## For empty pages
\newcommand{\blankpage}{
    % \clearpage
    \newpage
    \thispagestyle{empty}
    \hfill
    \clearpage
}

% ## Function that inserts blank pages until the next even page
% ## similar to \cleardoublepage, which inserts blank pages until next odd page
\newcommand{\cleardoublepageleft}{%
    \newpage
    \ifodd\value{page}
        \blankpage
    \fi
}


% == Fonts =============================================================
\setmonofont{inconsolata} % > Overrides monospaced font

% ## Use Fontsizes by extarticle
% > \small \Small \footnotesize \scriptsize \tiny 
% > \normalsize \large \Large \LARGE \huge \Huge

% ## Colors of fonts
\definecolor{darkgray}{gray}{0.3}
\let\oldtexttt\texttt
\renewcommand{\texttt}[1]{{\color{darkgray}\oldtexttt{#1}}}




% == Vertical Spacing ==================================================
% ## Set line spacing to 1.5
\onehalfspacing

% ## Set paragraph spacing
\setlength{\parskip}{6pt}
% \setlength{\parindent}{0pt} % > No indentation for paragraphs

% ## Define variables to be reused for vertical spacing
\newlength{\vfull}
\setlength{\vfull}{.7cm}
\newlength{\vdouble}
\setlength{\vdouble}{2\vfull}
\newlength{\vthreequarter}
\setlength{\vthreequarter}{.75\vfull}
\newlength{\vhalf}
\setlength{\vhalf}{.5\vfull}
\newlength{\vthird}
\setlength{\vthird}{.33\vfull}
\newlength{\vquarter}
\setlength{\vquarter}{.25\vfull}


% == Horizontal Spacing ================================================
\TabPositions{0.49in,0.98in,1.47in,1.96in,2.45in,2.94in,3.43in,3.92in,4.41in,4.9in,5.39in,5.88in,}





% ======================================================================
% == Section Formatting
% ======================================================================


% == Page Head and Foot =================================================

% ## Default Page Style
\fancypagestyle{headersfooters}{
    \fancyhf{} % > Clear all headers and footers
    % \fancyhead[C]{\nouppercase{\leftmark}\nouppercase{\rightmark}} % > Centered header
    \fancyhead[C]{\nouppercase{\leftmark}} % > Centered header
    \fancyfoot[C]{\thepage} % > Centered footer with page number
    \renewcommand{\headrulewidth}{0.3pt} % > Adjust header line width
    \renewcommand{\footrulewidth}{0.3pt} % > Add line above footer
}
% ## Set the pagestyle
\pagestyle{headersfooters} % > Set the new page style as default
\setlength{\headheight}{15pt} % > Adjust headheight to avoid warnings


% ## Pagestyle for Appendix
\fancypagestyle{appendix}{
    % > Reuse the default page style
    % > Add APPENDIX to the header
    % \fancyhead[C]{APPENDIX \nouppercase{\leftmark}} 
    % \fancyhead[C]{APPENDIX \nouppercase{\leftmark} \nouppercase{\rightmark}} 
    \fancyhead[L]{APPENDIX \nouppercase{\leftmark}} % Left-aligned
    \fancyhead[R]{\nouppercase{\rightmark}} % Right-aligned
    \fancyhead[C]{} % Clear center header
}

% ## Keeping track of the current pagestyle for multipage pdf imports
\newcommand{\currentpagestyle}{plain} % > Initialize with the default page style
% > Redefine \pagestyle to also update \currentpagestyle
\let\oldpagestyle\pagestyle
\renewcommand{\pagestyle}[1]{\oldpagestyle{#1}\renewcommand{\currentpagestyle}{#1}}


% == Main Sections =====================================================
% > Unnumbered

% ## Main Sections 
\newcommand{\unnsection}[1]{%
    \phantomsection% > Hyperref needs this
    \section*{#1}% > make an unnumbered and unlisted section
    \addcontentsline{toc}{section}{#1}%
    \mbox{}% > Add empty line to avoid warnings
    \markboth{#1}{}% > Mark section manually for headers
}


% == Sub Sections ======================================================
\newcommand{\unnsubsection}[1]{%
    \phantomsection% > Hyperref needs this
    \subsection*{#1}% > Create a new unnumbered subsection with the same name #1
    \addcontentsline{toc}{subsection}{\ignorespaces#1}% > Add the subsection to the table of contents
    \mbox{}% > Add an empty line to avoid warnings
}


% == Abstracts =========================================================
\newcommand{\customabstract}[3]{
    % > #1 argument is the label
    % > #2 argument is the header name
    % > #3 argument is the abstract text
    \phantomsection % > Create a new, invisible section
    \label{#1} % > Create a unique identifier for the abstract
    % \addcontentsline{toc}{subsection}{#2} % > Add the header name to the table of contents
    \renewcommand{\abstractname}{#2} % > Rename the abstract
    \begin{abstract}%
        #3 % > Insert the abstract text
    \end{abstract}
}



% == Table of Contents (TOC) ===========================================
\renewcommand{\cftbeforesecskip}{0.5ex} % > Linespacing before sections
\renewcommand{\cftbeforesubsecskip}{-0.2ex} % > Linespacing before subsections
\renewcommand{\cftbeforesubsubsecskip}{0.0ex} % >


% == Acknowledgements ==================================================
\newcommand{\acknowledge}[2]{%
    % > #1 is the name of the person
    % > #2 is the text of the acknowledgement
    \noindent \textbf{#1}, #2%
    \vspace{\vthird}%
}


% == Referencing Sections ==============================================

% > #1 is the label of the page
\newcommand{\mypageref}[1]{%
    p.\,\pageref{#1}%
}


% ======================================================================
% == Raw Text
% ======================================================================


% == Hyphenation =======================================================

% ## Tell Latex to never break these words at the end of a line
\hyphenation{hMSC hMSCs MM}
% > Commands for words containing hyphens to not be broken
\newcommand{\INA}{\mbox{INA-6}\xspace}
\newcommand{\nMAina}{\mbox{nMA-INA6}\xspace}
\newcommand{\MAina}{\mbox{MA-INA6}\xspace}
\newcommand{\CMina}{\mbox{CM-INA6}\xspace}


% == White Space =======================================================
\xspaceremoveexception{,}
\xspaceaddexceptions{\, ] )} % > Don't add a space after \, command

% ## Command to replace all spaces with shortspaces
\newcommand{\shortspaces}[1]{%
    \StrSubstitute{#1}{ }{\,}[\temp]%
    \temp%
}


% ======================================================================
% == Special Formats: Math, Units, etc.
% ======================================================================

% == Special Combinations ==============================================
\newcommand{\MAandCM}{\mbox{(MA\,\&\,CM)}\xspace}
\newcommand{\nMAandCM}{\mbox{(nMA\,\&\,CM)}\xspace}
\newcommand{\versus}[2]{#1\,\textit{vs.}\,#2}

\newcommand{\facetparams}{\texttt{x},\,\texttt{hue},\,%
    \texttt{col},\,\texttt{row}\xspace}


% == Sentence ==========================================================
% ## Command to nest a sentence with dashes, e.g. for appositives
% > This is a longer dash: \textemdash
% > This is a shorter dash: --
\newcommand{\dashed}[1]{%
    \unskip % > Removes the last space before the command, if it exists.
    \,\textemdash#1\textemdash\,%
    \ignorespaces % > Ignores the spaces following the command.
}
\newcommand{\dashleft}[1]{%
    \unskip % > Removes the last space before the command, if it exists.
    \,\textemdash#1\xspace%
}


% == Math ==============================================================
% ## Sans-serif font for math environment
% \sansmath  % !! Can only be called in the document, not in the preamble



% == Units =============================================================
\sisetup{
    detect-all, % > Apply the font settings to the text font
    range-phrase=--, % > Remove unit after range start
    range-units=single, % > For concentration ranges
}
% ## Declare units
% > \SI{10}{\molar} --> 10 M
% > \SIrange{10}{20}{\molar} --> 10--20 M
% > \SIlist{10;20;30}{\molar} --> 10, 20, 30 M
\DeclareSIUnit{\um}{\micro\meter} % >  Micrometer µm
\DeclareSIUnit{\normcounts}{normalized counts} % > normalized counts
\DeclareSIUnit{\cellspercm}{cells/cm\textsuperscript{2}} % > cells/cm^2

% ## Define commands combining numbers and units
\newcommand{\scinot}[2]{#1×10^{#2}}
\newcommand{\xprod}[2]{$\num{#1}$\,$\times$\,$\num{#2}$}
% > \SIprod{130}{100}{mm} --> 130x100 mm
\newcommand{\SIprod}[3]{\xprod{#1}{#2}\,\si{#3}}
% > \SIdiv{130}{100}{mm} --> 130/100 mm
\newcommand{\SIslash}[3]{$\num{#1}$\,/\,$\num{#2}$\,\si{#3}}
\newcommand{\SIplusminus}[3]{$\num{#1}$\,$\pm$\,$\num{#2}$\,\si{#3}}




% == Lists =============================================================
% ## Commands to process multiple arguments
\newcounter{@itemcount}
\newcounter{@listlen}
\newcommand{\@countlistitems}[1]{%
    \stepcounter{@listlen}%
}
\newcommand{\@processitem}[1]{%
    \stepcounter{@itemcount}%
    \textit{#1}%
    \ifnum\value{@itemcount}<\value{@listlen}%
        ,\,\allowbreak%
    \fi
}

% ## Command to format make italicised list
\newcommand{\listit}[1]{%
    \setcounter{@itemcount}{0}%
    \setcounter{@listlen}{0}%
    \forcsvlist{\listgadd\mylist}{#1}%
    \forlistloop{\@countlistitems}{\mylist}%
    \forlistloop{\@processitem}{\mylist}%
}



% == Statistics =============================================================
% ## Command to report an omnibus test
% > #1 is the name of the test statistic, e.g. "F" or "\rho"
% > #2 is the degree of freedoms, e.g. "1, 2"
% > #3 is the value of the omnibus statistic
% > #4 (optional) is the kind of p-value, e.g. "p-unc", it defaults to empty
% > #5 is the p-value
\newcommand{\omnibus}[5]{[$#1(#2)$\,$=$\,$#3$, $p$#4\,$=$\,$#5$]}



% == Chemical Equations ================================================
% > Insert commands for reactions here




% == Hyperlinks ========================================================
\hypersetup{
    colorlinks=false,
    linkcolor=black,
    % filecolor=magenta,      
    citecolor=black,
    urlcolor=blue,
    % pdftitle={Overleaf Example},
    % pdfpagemode=FullScreen,
}


% ======================================================================
% == Caption Styles
% ======================================================================
% ## Set linespacing for captions
\DeclareCaptionFont{oneandhalfspacing}{\setstretch{1}}

% ## Caption styles
\DeclareCaptionLabelFormat{listing}{\textbf{Listing\,#2}}
\DeclareCaptionLabelFormat{figure}{\textbf{Figure\,#2}}
\DeclareCaptionLabelFormat{appendixfigure}{\textbf{Appendix \thesubsection~Figure\,#2}}
% \DeclareCaptionLabelFormat{appendixfigurecontinued}{Appendix \thesection~Figure #2}
\DeclareCaptionLabelFormat{table}{\textbf{Table\,#2}}
\DeclareCaptionLabelFormat{appendixtable}{\textbf{Appendix \thesubsection~Table\,#2}}


% ## Set Default Caption formats
\captionsetup[lstlisting]{labelformat=listing,
    font={sf, footnotesize, oneandhalfspacing, sansmath}}
\captionsetup[figure]{labelformat=figure,
    font={sf, footnotesize, oneandhalfspacing, sansmath}}
% > Command for resetting defaults
\newcommand{\setdefaulttablecaption}{
    \captionsetup[table]{labelformat=table,
        font={sf, footnotesize, oneandhalfspacing, sansmath}}
}
\setdefaulttablecaption % > Set the default table caption format


% ## Command for resetting counters for figures and tables to 0
\newcommand{\resetcounters}{
    \setcounter{figure}{0}
    \setcounter{table}{0}
}


% == Referencing Captions ==============================================

% ## Redefine format of \autoref
\renewcommand{\figureautorefname}{Fig.}
\renewcommand{\tableautorefname}{Tab.}
% \renewcommand{\listingautorefname}{Lst.}
% \let\oldautoref\autoref
% \renewcommand{\autoref}[1]{\oldautoref{#1}\,}

% ## Shorten referencing to Figures in Appendix
% > \apdxref{appendixlabel}{figlabel}
% > Examples:
% ' \apdxref{apdx:supplemental} --> Appendix A
% ' \apdxref{subapdx:fig}{fig:S1} --> Appendix A.1: Figure 1
% ' \apdxref{subapdx:fig}{fig:S1}, \ref{fig:S2} --> Appendix A: Figure 1, 2
\NewDocumentCommand{\apdxref}{m g}{%
    Appendix\,\ref{#1}\IfValueT{#2}{:\,\autoref{#2}}%
}




% ======================================================================
% == Code Listings
% ======================================================================

% ## Define the colors for Syntax Highlighting
\definecolor{keywordcolor}{RGB}{0,128,0}  % > Green
\definecolor{commentcolor}{RGB}{64,128,128}  % > Green
\definecolor{stringcolor}{RGB}{186,34,32}  % > Red
% \definecolor{variablecolor}{RGB}{33,33,33}  % > Black

\definecolor{operatorcolor}{RGB}{170,35,255}  % > light Purple
\definecolor{typecolor}{RGB}{0,85,170}  % > Blue
\definecolor{darkpurple}{RGB}{119, 0, 134}  % > dark purple

% \definecolor{parentheses}{rgb}{.7,.1,0}
\definecolor{parentheses}{RGB}{250,200,50}

\definecolor{deepblue}{rgb}{0,0,0.7}
\definecolor{darkyellow}{RGB}{200,150,0}
\definecolor{deeporange}{rgb}{0.6,0.3,0}
\definecolor{orange}{rgb}{1,0.5,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}
\definecolor{deepred}{rgb}{0.6,0,0}



% ## Define the default listing style
\lstdefinestyle{defaultstyle}{
frame=single, % > add a frame
xleftmargin=1cm,
xrightmargin=1cm,
basewidth=0.5em, % > Reduce the width of each characters
belowskip=3pt, % > Space after listing
abovecaptionskip=0pt, % > Remove space before caption
numbers=left,  % > Show line numbers
numbersep=5pt,  % > Move line numbers slightly to the right
basicstyle=\linespread{1}\color{darkgray}\ttfamily\footnotesize,  % > Variables are black
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

% ## Define the Python listing style
\lstdefinestyle{pythonstyle}{
    style=defaultstyle,  % > Use the default style
    language=Python,  % > Set the language to Python
    morekeywords={assert, as},  % > Add Python-specific keywords
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


% ## Define listing styles that prevents page breaks
\lstdefinestyle{defaultstyleNonbreaking}{
    float=h, % > Prevent page breaks & Place at exactly this position
    style=defaultstyle,  % > Use the default style
}
\lstdefinestyle{pythonstyleNonbreaking}{
    float=h, % > Prevent page breaks & Place at exactly this position
    style=pythonstyle,  % > Use the Python style
}





% ======================================================================
% == Images
% ======================================================================

% ## Define a command to include an image
% > #1 is the width of the image in % (optional, default is 0.99)
% > #2 is the crop option (optional, default is no cropping)
% > #3 is the path to the image
% ## Example:
% > \includeimage[scale][left bottom right top]{
% >     pathtopicture
% > }
\NewDocumentCommand{\includeimage}{O{0.99} O{} m}{%
    % \vspace{\vfull}
    {%
            % \vspace*{-1cm} % > Remove space before image if latex needs it
            \noindent%
            \begin{minipage}{\textwidth}%
                \centering%
                \IfStrEq{#2}{}
                {\includegraphics[width=#1\textwidth]{#3}}
                {\includegraphics[width=#1\textwidth, trim=#2, clip]{#3}}
            \end{minipage} %
        }%
}


% ## Define default messages for objects continueing across page-breaks
\newcommand{\continuestartmsg}{%
    \textit{continued\,on\,next\,page}
}
\newcommand{\continueendmsg}{%
    \textit{continued\,from\,previous\,page}
}


% ## Define a command to include an image that continues on the next page
\NewDocumentCommand{\includeimagecontinued}{O{0.99} O{} O{} m}{
    {
            \addtocounter{figure}{-1} % > Decrease the figure counter by 1
            % > Include the image overriding the caption
            \includeimage[#1][#2]{#4}
            \captionof{figure}{\continueendmsg #3}
        }
}


% ## Save margins that I used for making my images to be cropped away when included
\newlength{\fmtop}
\setlength{\fmtop}{0.9in}
\newlength{\fmright}
\setlength{\fmright}{0.78in}
\newlength{\fmbottom}
\setlength{\fmbottom}{0.98in}
\newlength{\fmleft}
\setlength{\fmleft}{0.78in}



% == Figure Captions ====================================================

% ## > Define space between figure and caption
\newlength{\vfigcaption}
\setlength{\vfigcaption}{-.2cm}

% ## Redefine \caption to be used outside a figure environment
% > #1 is the label
% > #2 is the caption
% > Example:
% > \figcaption[label]{caption}
\NewDocumentCommand{\figcaption}{O{} m}{%
    \nopagebreak
    \begin{figure}[H]
        % \vspace{\vfigcaption}
        \caption{#2}
        \label{#1}
    \end{figure}
}

% ## A command to split a caption into two parts
% > #1 is the label
% > #2 is the first part of the caption
% > #3 is the second part of the caption
% > Example:
% > \splitcaption[label]{caption1}{caption2}
\NewDocumentCommand{\splitcaption}{O{} m m}{%
    \nopagebreak%
    \figcaption[#1]{#2 -- \continuestartmsg}%
    \pagebreak%
    \begin{figure}[!htb]%
        \ContinuedFloat%
        \phantomsection%
        \caption*{\textbf{Figure \thefigure}: \continueendmsg -- #3}%
    \end{figure}%
}





% ======================================================================
% == Tables 
% ======================================================================

% ## For cells spanning multiple rows
% > \multirowcell{number of rows}{width}{content}
\newcommand{\multirowcell}[3]{
    \multirow{#1}{*}[-0.5ex]{
        \parbox{#2}{\noindent #3}
    }
}




% == Table Captions ====================================================

% ## Define how tables captions look like around longtable pagebreaks
% > #1 is the number of columns
% > #2 is the text added before "Continued from previous page"
\newcommand{\longtablecaptions}[2]{

    % > Define secondary header row(s) for every time the page breaks
    \multicolumn{#1}{l}
    {\footnotesize \sffamily \textbf{#2~\tablename~\thetable~}-- \continueendmsg} \\
    \hline
    \endhead

    % > The footer row for middle pages after page break
    \hline
    \multicolumn{#1}{l}
    {\footnotesize \sffamily \continuestartmsg}                                    \\
    \endfoot

    % > The footer row for the last page
    \hline \hline
    \endlastfoot
}

% ## Format Tile Refernces (Fig 2 A, B, C) within captions
% > e.g. \subfig{A} --> A: in bold
\newcommand{\tile}[1]{%
    % > Makes bold, unbreakable space after, strip whitespaces
    \ignorespaces\,\textbf{#1:~}\ignorespaces
}



% ======================================================================
% == Citations
% ======================================================================

\bibliographystyle{apacite}

% ## Make \cite look like (Kuric et. al. 2024)
\let\fullcite\cite % > Rename \cite to \fullcite to keep the original
\let\cite\citep % > Rename \citep to \cite
% > Examples:
% ' \citeauthor*{jon90} --> Jones, Baker, and Williams
% ' \citet{jon90} --> Jones, Baker, and Williams (1990)
% ' \citep{jon90} --> (Jones, Baker, and Williams, 1990)
% ' \citealt{jon90} --> Jones, Baker, and Williams, 1990

\let\oldcite\cite % > Rename \cite to \oldcite to keep the original
\renewcommand{\cite}[1]{{\small\oldcite{#1}}}


% ## Define the bibliography style
\let\oldthebibliography=\thebibliography
\renewcommand{\thebibliography}[1]{%
    \oldthebibliography{#1}%
    \setlength{\itemsep}{0pt}%
    \footnotesize%
}

% == Anti self-Plagiarism Spell ========================================
% ## Pre-define sentences to include in figure captions to avoid self-plagiarism

\newcommand{\selfplagiarismone}{
    This content has been taken as is from
    \citet{kuricModelingMyelomaDissemination2024}, published in \textit{Cancer
        Research Communications} under the \texttt{CC BY 4.0} license.
}

\newcommand{\selfplagiarismtwo}{
    This content has been taken as is from
    \citet{kuricPlotasticBridgingPlotting2024}, published in \textit{Journal of
        Open Source Software} under the \texttt{CC BY 4.0} license.
}

% ======================================================================
% == Footnotes
% ======================================================================

% ## Define the size of the endnotes section (Glossary)
\def\enotesize{\small}


%  ## Change name of the endnotes section
\newcommand{\notessectionname}{Glossary}
\renewcommand{\notesname}{\notessectionname}

% \let\footnote=\endnote % > Rename \endnote to \endnote

% == Footnotes with term specifications (numbered)
% ## Footnotes for explanations or specifications
% > #1 is the text of the footnote
% > #2 is the label of the footnote
\newcommand{\footterm}[2]{%
    % \footnote{#1}% !!  Breaks Latex!!!
    % \addtocounter{footnote}{1}% > Increment the footnote counter
    % \refstepcounter{footnote}% > Increment the footnote counter
    \footnotemark% > Add the mark into the text, and increment counter
    % \footnotemark[\thefootnote]% > Add the mark into the text, and increment counter
    \endnotetext[\thefootnote]{#1}% > Collect the footnote for "Notes" section
    % \endnote[\thefootnote]{#1}% > Collect the footnote for "Notes" section
    % \endnote{#1}% > Collect the footnote for "Notes" section
    \footnotetext[\thefootnote]{#1#2}% > Add the footnote to the page footer and label
    % \footnotetext{#1#2}% > Add the footnote to the page footer
    \xspace% > Add a space after the footnote
}



% == Footnotes with literature (daggered)
\newcounter{daggercounter} % > Initialize the counter
\MakePerPage{daggercounter} % > Make the counter reset on each new page

% ## Make Marker that changes depending on counter
\newcommand{\markerdaggeralph}{%
    {\small% > Set the font size to small, which makes it bigger
            \ifnum\value{daggercounter}=1 % > First footnote
                \dag% > Dagger
            \fi
            \ifnum\value{daggercounter}=2 % > Second footnote
                \ddag% > Double dagger
            \fi
            \ifnum\value{daggercounter}=3 % > Third footnote
                {\footnotesize\dag\dag}%
                % \alph{daggercounter}% > Add the custom mark and counter into the text
            \fi
        }%
    \xspace% > Add a space after the footnote
}%

% ## Command for footnotes with dagger markers
\newcommand{\footdagger}[1]{%
    {% ## Restrict changes to \thefootnote locally
            % \footnotesize%
            \renewcommand{\thefootnote}{% > Update marker to dagger
                \markerdaggeralph%
            }%
            \stepcounter{daggercounter}% > Increment the dagger footnote counter
            \textsuperscript{\markerdaggeralph}% > Add the custom mark and counter into the text
            \footnotetext{~#1}% > Add text
        }%
    \xspace% > Add a space after the footnote, but not before comma
}

% ## Footnote Quotes
% ## Define Command for footnotes containing quotes
% > #1 is the citation
% > #2 is the text of the footnote
\newcommand{\footquote}[2]{%
    \footdagger{%
        \citet{#2}:\\
        \strut\hfill% > Align the text to the right
        \begin{minipage}{.95\linewidth}%
            \textit{``\,#1\nolinebreak\,''}% > Add the footnote text with the custom counter
        \end{minipage}%
    }%
}

% ======================================================================
% == Importing PDF Files
% ======================================================================

% ## Define actions to be executed onto each page during the \includepdf command
% > Define a new counter to keep track of the current page number of the included PDF
\newcounter{includepdfpage}
\newcommand{\eachpage}[1]{
    \thispagestyle{\currentpagestyle} % > Set page style
    \stepcounter{includepdfpage} % > Increment the includepdfpage counter
}


% ## Command that makes a subsection from a PDF
% > #1 is a boolean argument, if starred, no entry in TOC is made
% > #2 is the scale of each pdf page, defaults to 98% (.98)
% > #3 {} argument is the name of the toc section
% > #4 {} argument is the name of the file
\NewDocumentCommand{\addpdf}{sO{.98}mm}{
    \setcounter{includepdfpage}{1} % > Reset the includepdfpage counter to 1
    \IfBooleanTF{#1}{}{
        \phantomsection
        \addcontentsline{toc}{subsection}{#1} % > Add to TOC
    } % > Prevents sections occupying the same page only if not starred
    \includepdf[
        pages=-, % > Include all pages of the PDF
        scale=#2,  % > Scale the PDF to e.g. 98% of the text width
        pagecommand={\eachpage{#3}}, % > Execute command for each page
    ]{#4}
}



