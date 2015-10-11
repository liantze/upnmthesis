\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{upnmthesis}[2015/10/20 LaTeX2e class for Universiti Pertahanan Nasional Malaysia (UPNM) v1.0.  Copyright (c) 2015 Lim Lian Tze (liantze@gmail.com)]

\LoadClass[12pt,a4paper,oneside]{memoir}
\RequirePackage{etoolbox}


%%%%%%%%%%
% Defaults: UTF-8 input encoding; T1 font encoding
%%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{helvet}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{amsmath,amssymb,amsfonts,bm}
\renewcommand\ttdefault{lmvtt}

%%%%%%%%%%
% Load Bahasa and English
%%%%%%%%%%
\RequirePackage[bahasam,main=english]{babel}

\addto\captionsenglish{%
  \renewcommand*\abstractname{\texorpdfstring{ABSTRACT}{Abstract}}
  \renewcommand*\contentsname{\texorpdfstring{TABLE OF CONTENTS}{Table of Contents}}
  \renewcommand*\listtablename{\texorpdfstring{LIST OF TABLES}{List of Tables}}
  \renewcommand*\listfigurename{\texorpdfstring{LIST OF FIGURES}{List of Figures}}
  \renewcommand*\acronymname{\texorpdfstring{LIST OF ABBREVIATIONS}{List of Abbreviations}}
  \renewcommand*\refname{\texorpdfstring{REFERENCES}{References}}
  \renewcommand*\appendixtocname{\texorpdfstring{APPENDICES}{Appendices}}
}

%%%%%%%%%
% Load hyperref
%%%%%%%%%
\AtBeginDocument{\usepackage{hyperref}}

%%%%%%%%%%%%
% Page layout
%
% Margins: T - 25mm; B - 25mm; L - 40mm; R - 25mm
% No running headers.
% Page number at centre bottom of page
%%%%%%%%%%%%
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{40mm}{25mm}{*}
\setulmarginsandblock{25mm}{25mm}{*}
\setheadfoot{\baselineskip}{10mm}
\addtolength\footskip{-6pt}
\makeoddfoot{plain}{}{\footnotesize\thepage}{}
\makeevenfoot{plain}{}{\footnotesize\thepage}{}
\pagestyle{plain}
\checkandfixthelayout

%%%%%%%%%%%%
% Line and paragraph spacing
% - double spacing for normal text
% - 4-space between paragraphs
% - no paragraph indent
%%%%%%%%%%%%
\DisemulatePackage{setspace}
\RequirePackage{setspace}
\setstretch{2.0}
\abnormalparskip{2\onelineskip}
\setlength{\parindent}{0em}

%%%%%%%%%%%%
% Footnotes
% - Font size = 8pt = \tiny for 12pt body font in memoir
% - Double spacing between footnotes
%%%%%%%%%%%%
\renewcommand{\foottextfont}{\tiny}
\setlength\footnotesep{\onelineskip}


%%%%%%%%%%
% Load the glossaries package
%%%%%%%%%%
\RequirePackage[toc,nonumberlist,shortcuts,translate=false,style=long,acronym]{glossaries}
\makeglossaries

%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
\renewcommand\chapterheadstart{\normalsize\vspace*{\beforechapskip}}
\setlength\beforechapskip{2\onelineskip}
\setlength\midchapskip{2\onelineskip}
%\setlength\afterchapskip{0.5\onelineskip}
%\setlength\beforechapskip{3em}
%\setlength\midchapskip{3em}
\setlength\afterchapskip{1em}
\renewcommand*\chapnamefont{\normalsize\bfseries}
\renewcommand*\chapnumfont{\normalsize\bfseries\centering}
\renewcommand*\chaptitlefont{\SingleSpacing\normalsize\bfseries\centering}
\renewcommand{\printchaptername}{{\chapnamefont\MakeUppercase{\chaptername}}}
\renewcommand*{\afterchapternum}{\vskip\midchapskip}
\renewcommand*{\printchaptertitle}[1]{{\chaptitlefont\MakeUppercase{#1}\par}}

%%%%%%%%%%%%
% Sectional headings
%%%%%%%%%%%%
\setsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesecskip{2\onelineskip}
\setaftersecskip{0.1pt}
%\setsubsecindent{2.5em}
\setsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesubsecskip{\onelineskip}
\setaftersubsecskip{0.1pt}
\setsubsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesubsubsecskip{\onelineskip}
\setaftersubsubsecskip{0.1pt}

\newenvironment{subsecs}{\begin{adjustwidth}{2.5em}{0em}}{\end{adjustwidth}}


%%%%%%%%%%
% Abstracts
%%%%%%%%%%
\abstractintoc
\setlength\abstitleskip{0pt}
\renewcommand\abstractnamefont{\normalsize\bfseries}
\renewcommand\abstracttextfont{\normalsize}
\setlength\absleftindent{0pt}
\setlength\absrightindent{0pt}
\newcommand{\abstractfromfile}[1]{
  \renewcommand*\abstractname{\texorpdfstring{ABSTRACT}{Abstract}}
  \clearpage\mbox{}\begin{abstract}\input{#1}\end{abstract}
}
\newcommand{\msabstractfromfile}[1]{%
  \renewcommand*\abstractname{\texorpdfstring{ABSTRAK}{Abstrak}}
  \clearpage\mbox{}\begin{abstract}\otherlanguage{bahasam}\input{#1}\end{abstract}
}
\renewcommand\abstractnamefont{\normalsize\bfseries}

%%%%%%%%%%
% Bibliography
%%%%%%%%%%
\RequirePackage[natbibapa]{apacite}
\bibliographystyle{apacite}
\patchcommand{\bibitem}{\SingleSpacing}{}
\AtBeginDocument{
  \renewcommand*\refname{\texorpdfstring{REFERENCES}{References}}
  \renewcommand*\bibname{\texorpdfstring{BIBLIOGRAPHY}{Bibliography}}
}
%%%%%%%%%%
% List of Publications
%%%%%%%%%%
\RequirePackage[resetlabels]{multibib}
\newcites{own}{LIST OF PUBLICATIONS}
\bibliographystyleown{apacite}

%%%%%%%%%%
% Appendices
%%%%%%%%%%
\renewcommand*\appendixname{Appendix}
\newlistof{listofappendices}{apx}{\texorpdfstring{LIST OF APPENDICES}{List of Appendices}}
\addtodef\appendix{}{\renewcommand\chaptername{\appendixname}}
\def\app@chapter[#1]#2{%
  \m@mpn@new@chaptrue%
  \m@mpn@new@schapfalse%
  \def\f@rbdy{#2}%
  \ifx\ch@pt@c\@empty % no optional args
    \def\f@rtoc{#2}%
    \def\f@rhdr{#2}%
  \else                  % at least one opt arg
    \let\f@rtoc\ch@pt@c
    \ifx\@empty#1\@empty
      \let\f@rhdr\ch@pt@c
    \else
      \def\f@rhdr{#1}%
    \fi
  \fi
  \m@m@Andfalse
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
      \m@m@Andtrue
    \fi
  \fi
  \ifm@m@And
    \refstepcounter{chapter}%
  \fi
  \ifartopt
    \@makechapterhead{#2}%
    \@afterheading
    \chaptermark{\f@rhdr}%
  \else
    \chaptermark{\f@rhdr}
    \insertchapterspace
    \if@twocolumn
      \@topnewpage[\@makechapterhead{#2}]%
    \else
      \@makechapterhead{#2}%
    \fi
    \@afterheading
  \fi
  \ifm@m@And
    \ifanappendix
      \addcontentsline{apx}{appendix}{%
        \protect\chapternumberline{\thechapter}\f@rtoc}%
      \memappchapinfo{\thechapter}{\f@rtoc}{\f@rhdr}{#2}%
    \else
      \addcontentsline{apx}{chapter}{%
        \protect\chapternumberline{\thechapter}\f@rtoc}%
      \memchapinfo{\thechapter}{\f@rtoc}{\f@rhdr}{#2}%
    \fi
  \else
    \addcontentsline{apx}{chapter}{\f@rtoc}%
    \ifanappendix
      \memappchapinfo{}{\f@rtoc}{\f@rhdr}{#2}%
    \else
      \memchapinfo{}{\f@rtoc}{\f@rhdr}{#2}%
    \fi
  \fi
  \ifheadnameref\M@gettitle{\f@rhdr}\else\M@gettitle{\f@rtoc}\fi%
}

\newtoggle{appheadintoc}
\toggletrue{appheadintoc}
\apptocmd{\listofappendices}{\global\togglefalse{appheadintoc}}{}{}
\AtBeginEnvironment{appendices}{%
  \SingleSpacing%
  \abnormalparskip{\onelineskip}%
  \renewcommand{\chaptername}{Appendix}
  \iftoggle{appheadintoc}{%
    \phantomsection\addappheadtotoc%
    \settocdepth{part}%
  }{%
    \let\@chapter\app@chapter
    \settocdepth{chapter}%
  }%
  \cftinserthook{apx}{AppendixToCLines}
  \renewcommand\mychap[1]{\orichapter{#1}}
}
\AfterEndEnvironment{appendices}{\settocdepth{chapter}}
%%%%%%%%%%
% Tighter lists
%%%%%%%%%%
\firmlist

%%%%%%%%%%
% Quotations
%%%%%%%%%%
\AtBeginEnvironment{quotation}{\vspace*{-0.5\onelineskip}\SingleSpacing}
\AtEndEnvironment{quotation}{\vspace*{-\onelineskip}}
\AtBeginEnvironment{quote}{\vspace*{-0.5\onelineskip}\SingleSpacing}

\maxsecnumdepth{subsection}


%%%%%%%%%%
% Float captions
%%%%%%%%%%
\captionnamefont{\bfseries}
\captiondelim{\hspace{0.5em}}
\newsubfloat{figure}
\newsubfloat{table}

%%%%%%%%%%
% Content lists
%%%%%%%%%%
\let\orichapter\chapter
\newcommand\mychap[2][]{\orichapter%
[\ifstrempty{#1}{\texorpdfstring{\MakeUppercase{#2}}{#2}}%
{\texorpdfstring{\MakeUppercase{#1}}{#1}}]%
{#2}}
\newcommand\mystarchap[1]{\orichapter*{#1}}
\renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}}

\newlength\tmplength
\settowidth{\tmplength}{\bfseries CHAPTER}

\settocdepth{subsection}
\renewcommand*\cftdotsep{\cftnodots}
\renewcommand*\cftchapterpagefont{\normalfont\mdseries\upshape}
\setpnumwidth{2em}
\setrmarg{4em}
\setlength{\cftchapternumwidth}{\tmplength}
\renewcommand*{\cftchapterpresnum}{\hfil}
\renewcommand*{\cftchapteraftersnumb}{\hspace{1em}}
\renewcommand*{\cftchapterformatpnum}[1]{%
   \cftchapterformatpnumhook{#1}%
   \hbox to \@pnumwidth{\hfil{\cftchapterpagefont #1}\hfil}}
\cftsetindents{section}{\dimexpr\tmplength+1em}{2.25em}
\renewcommand*{\cftsectionformatpnum}[1]{%
   \cftsectionformatpnumhook{#1}%
   \hbox to \@pnumwidth{\hfil{\cftsectionpagefont #1}\hfil}}
\cftsetindents{subsection}{\dimexpr\tmplength+1em+2.5em}{3.0em}
\renewcommand*{\cftsubsectionformatpnum}[1]{%
   \cftsubsectionformatpnumhook{#1}%
   \hbox to \@pnumwidth{\hfil{\cftsubsectionpagefont #1}\hfil}}
\renewcommand*{\cftfigureformatpnum}[1]{%
   \cftfigureformatpnumhook{#1}%
   \hbox to \@pnumwidth{\hfil{\cftfigurepagefont #1}\hfil}}
\renewcommand*{\cfttableformatpnum}[1]{%
   \cfttableformatpnumhook{#1}%
   \hbox to \@pnumwidth{\hfil{\cfttablepagefont #1}\hfil}}

  \setlength{\cftbeforechapterskip}{0pt}

\renewcommand{\aftertoctitle}{%
              \par\nobreak\vspace*{\afterchapskip}\mbox{}\hfill{\bfseries Page}\par\nobreak}
\renewcommand{\afterloftitle}{%
              \par\nobreak\vspace*{\afterchapskip}\mbox{}\hfill{\bfseries Page}\par\nobreak}
\renewcommand{\afterlottitle}{%
              \par\nobreak\vspace*{\afterchapskip}\mbox{}\hfill{\bfseries Page}\par\nobreak}
\renewcommand{\afterapxtitle}{%
              \par\nobreak\vspace*{\afterchapskip}\mbox{}\hfill{\bfseries Page}\par\nobreak}

\cftinsertcode{MinimalChapterToCLines}{%
  \setlength{\cftbeforechapterskip}{0pt}
}

\cftinsertcode{MainChapterToCLines}{%
  \setlength{\cftbeforechapterskip}{\onelineskip}
}

\cftinsertcode{AppendixToCLines}{%
  \settowidth{\tmplength}{\appendixname\space}
  \renewcommand*{\cftchapterpresnum}{\appendixname\space}
  \renewcommand*\cftchapteraftersnum{:\space}%
  \renewcommand*\cftchapteraftersnumb{}%
  \setlength\cftchapternumwidth{\dimexpr\tmplength+1.5em}%
  \renewcommand*\cftchapterfont{\normalfont\mdseries\upshape}%
  \renewcommand*\cftchapterpagefont{\normalfont\mdseries\upshape}%
}

\apptocmd{\mainmatter}{%
  \addtocontents{toc}{\protect\vspace*{\onelineskip}}%
  \addtocontents{toc}{\protect\textbf{CHAPTER}\par\nobreak}
  \cftinserthook{toc}{MainChapterToCLines}
  \addtocontents{toc}{\protect\vspace*{-\onelineskip}}%
}{}{}

\pretocmd{\bibliography}{%
  \addtocontents{toc}{\protect\vspace*{\onelineskip}}%
  \cftinserthook{toc}{MinimalChapterToCLines}%
}{}{}

\pretocmd{\bibliographyown}{%
  \addtocontents{toc}{\protect\vspace*{-\onelineskip}}%
}{}{}