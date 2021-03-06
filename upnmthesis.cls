%%%%%%%%%%%%
%% This is upnmthesis.cls, created by Lian Tze LIM (liantze@gmail.com)
%% for the Centre of Graduate Studies, Universiti Pertahanan Nasional
%% Malaysia.
%% http://liantze.penguinattack.org/latextypesetting.html#upnmthesis
%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{upnmthesis}[2016/04/20 LaTeX2e class for Universiti Pertahanan Nasional Malaysia (UPNM) v1.0.2.  Copyright (c) 2015--2016 Lian Tze LIM (liantze@gmail.com)]

\LoadClass[12pt,a4paper,oneside]{memoir}
\RequirePackage{etoolbox}

%%%%%%%%%%
% Class option whether this is an undergrad thesis.
% Default is none (i.e. postgrad thesis).
%%%%%%%%%%
\newif\if@undergrad
\newif\if@microtype
\newif\if@newtx
\DeclareOption{undergrad}{\@undergradtrue}
\DeclareOption{microtype}{\@microtypetrue}
\DeclareOption{newtx}{\@newtxtrue}
\ProcessOptions

%%%%%%%%%%
% Filter some annoying warning messages
%%%%%%%%%%
\RequirePackage{silence}
\WarningFilter{babel}{No hyphenation patterns were preloaded}
\WarningFilter{inputenc}{inputenc package ignored with utf8 based engines}
\WarningFilter{tex}{destination with the same identifier}

%%%%%%%%%%
% Defaults: UTF-8 input encoding; T1 font encoding
%%%%%%%%%%
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\if@newtx%
  \IfFileExists{newtxmath.sty}{\RequirePackage{newtxtext,newtxmath}}{\RequirePackage{mathptmx}}
\else%
  \RequirePackage{mathptmx}
\fi
\RequirePackage{amsmath,amssymb,amsfonts,bm}
\renewcommand\ttdefault{lmvtt}
\if@microtype\RequirePackage{microtype}\fi
\RequirePackage{ragged2e}

%%%%%%%%%%%
% Information about the thesis
%%%%%%%%%%%
\def\theauthor{\textbf{!INSERT AUTHOR!}}
\def\thetitle{\textbf{!INSERT TITLE!}}
\def\@mtsubmissionyear{\textbf{!INSERT YEAR!}}
\def\@mtsubmissionmonth{\textbf{!INSERT MONTH!}}
\def\@mtdegree{\textbf{!INSERT DEGREE!}}
\def\@mtstudyfield{\textbf{!INSERT studyfield!}}
\def\@mtfaculty{\textbf{!INSERT FACULTY!}}
\def\@mtvivadate{\textbf{!INSERT VIVA DATE!}}

\newcommand{\submissionyear}[1]{\def\@mtsubmissionyear{#1}}
\newcommand{\submissionmonth}[1]{\def\@mtsubmissionmonth{#1}}
\newcommand{\degree}[1]{\def\@mtdegree{#1}}
\newcommand{\studyfield}[1]{\def\@mtstudyfield{#1}}
\newcommand{\faculty}[1]{\def\@mtfaculty{#1}}
\newcommand{\vivadate}[1]{\def\@mtvivadate{#1}}


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
% Load hyperref and glossaries -- glossaries has to be loaded after
% hyperref to make the hyperlinks work properly.
%%%%%%%%%
\AtEndPreamble{%
  \usepackage[breaklinks,pdfborder={0 0 0},pdfpagelabels,plainpages=false]{hyperref}%
  \usepackage[noredefwarn,toc,nonumberlist,shortcuts,translate=false,style=long,acronym]{glossaries}
  \renewcommand{\glossarypreamble}{\vspace*{3\onelineskip}}
  \makeglossaries
}

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
\abnormalparskip{6\onelineskip}
\setlength{\parindent}{0em}

%%%%%%%%%%%%
% Footnotes
% - Font size = 8pt = \tiny for 12pt body font in memoir
% - Double spacing between footnotes
%%%%%%%%%%%%
\renewcommand{\foottextfont}{\tiny}
\setlength\footnotesep{\onelineskip}


%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
\renewcommand\chapterheadstart{\normalsize\vspace*{\beforechapskip}}
\setlength\beforechapskip{3\onelineskip}
\setlength\midchapskip{3\onelineskip}
%\setlength\afterchapskip{0.5\onelineskip}
%\setlength\beforechapskip{3em}
%\setlength\midchapskip{3em}
%\setlength\afterchapskip{1em}
\setlength\afterchapskip{0pt}
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
\setbeforesecskip{3\onelineskip}
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
  \clearpage\mbox{}\begin{abstract}\vspace*{-\baselineskip}\input{#1}\end{abstract}
}
\newcommand{\msabstractfromfile}[1]{%
  \renewcommand*\abstractname{\texorpdfstring{ABSTRAK}{Abstrak}}
  \clearpage\mbox{}\begin{abstract}\otherlanguage{bahasam}\vspace*{-\baselineskip}\input{#1}\end{abstract}
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
  \setlength\afterchapskip{3\onelineskip}%
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
% Quotations and equatons
%%%%%%%%%%
%\AtBeginEnvironment{quotation}{\vspace*{-0.5\onelineskip}\SingleSpacing}
%\AtEndEnvironment{quotation}{\vspace*{-\onelineskip}}
%\AtBeginEnvironment{quote}{\vspace*{-0.5\onelineskip}\SingleSpacing}
%\AtBeginEnvironment{equation}{\vspace*{-\onelineskip}}
%\AtBeginEnvironment{equation*}{\vspace*{-\onelineskip}}
\AtBeginEnvironment{quotation}{\vspace*{-.5\parskip}\SingleSpacing}
\AtEndEnvironment{quotation}{\vspace*{-.5\parskip}}
\AtBeginEnvironment{quote}{\vspace*{-.5\parskip}\SingleSpacing}
\AtEndEnvironment{quote}{\vspace*{-.5\parskip}}
\AtBeginEnvironment{equation}{\vspace*{-\parskip}}
\AtBeginEnvironment{equation*}{\vspace*{-\parskip}}

\maxsecnumdepth{subsection}
\setcounter{lofdepth}{2}
\setcounter{lotdepth}{2}


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
\renewcommand*{\cftsubfigureformatpnum}[1]{%
   \cftfigureformatpnumhook{#1}%
   \hbox to \@pnumwidth{\hfil{\cftfigurepagefont #1}\hfil}}
\setlength{\cftsubfigurenumwidth}{2em}
\renewcommand*{\cfttableformatpnum}[1]{%
   \cfttableformatpnumhook{#1}%
   \hbox to \@pnumwidth{\hfil{\cfttablepagefont #1}\hfil}}
\renewcommand*{\cftsubtableformatpnum}[1]{%
   \cfttableformatpnumhook{#1}%
   \hbox to \@pnumwidth{\hfil{\cfttablepagefont #1}\hfil}}
\setlength{\cftsubtablenumwidth}{2em}

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
  \nobibintoc%
  \addtocontents{toc}{\protect\vspace*{-\onelineskip}}%
  \renewcommand{\prebibhook}{%
    \phantomsection%
    \addcontentsline{toc}{chapter}{\texorpdfstring{LIST OF PUBLICATIONS}{List of Publications}}%
  }
}{}{}

%%%%%%%%%%%%%%%%%%%%%%%
% Cover and title pages
%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makecoverandtitlepage}{%
  \renewcommand{\thepage}{C\arabic{page}}%
  \makecoverpage%
  \mbox{}\thispagestyle{empty}\clearpage% % leave a blank page
  \renewcommand{\thepage}{\arabic{page}}%
  \pagenumbering{roman}%
  \maketitlepage%
}

\newcommand{\makecoverpage}{
  \begingroup%
  \changepage{-70mm}{15mm}{}{-15mm}{-15mm}{35mm}{}{}{}%
  \begin{titlingpage*}%
  \SingleSpacing
  \thispagestyle{empty}%
  \fontsize{18pt}{20pt}\bfseries\selectfont\centering%
  \MakeUppercase{\thetitle}\par%
  \vfill%
  \MakeUppercase{\theauthor}\par%
  \vfill%
  \MakeUppercase{\@mtdegree}\par%\vspace{3\onelineskip}%
  UNIVERSITI PERTAHANAN NASIONAL MALAYSIA
  \par\vspace{3\onelineskip}%
  \@mtsubmissionyear\par%
  \end{titlingpage*}%
  \endgroup%
}

\newcommand{\maketitlepage}{%
  \begin{titlingpage*}%
  \centering\SingleSpacing%
  \textbf{\MakeUppercase{\thetitle}}\par%
  \vfill%
  \textbf{\MakeUppercase{\theauthor}}\par%
  \vfill%
  {\justifying\noindent Thesis submitted to \if@undergrad\else the Centre for Graduate Studies,\space\fi Universiti Pertahanan Nasional Malaysia, in fulfilment of the requirements for the Degree of \@mtdegree\space(\@mtstudyfield)\par}
  %\vfill
  \@mtsubmissionmonth\space\@mtsubmissionyear\par%
  \end{titlingpage*}%
}

%%%%%%%%%%%%%%%%%%
% Needs a blank page at the end
%%%%%%%%%%%%%%%%%%
\AtEndDocument{\clearpage\mbox{}\thispagestyle{empty}\clearpage}

%%%%%%%%%%%%%%%%%%
% Dedication
%%%%%%%%%%%%%%%%%%
\newcommand{\dedication}[1]{\newpage\mbox{}\thispagestyle{empty}%
\begin{vplace}[.25]\itshape\centering#1\end{vplace}%
\clearpage}

%%%%%%%%%%%%%%%%%%%%%%
% Acknowledgements
%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{acknowledgements}{\chapter{Acknowledgements}}{}

%%%%%%%%%%%%%%%%%%%%%%
% Approval Forms
%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{pgfkeys}
\RequirePackage{tabularx}

\newtoggle{approvaladded}
\togglefalse{approvaladded}

\newenvironment{committee}{
  \pgfkeys{%
    /member/.is family, /member,
    % Here are the options that a user can pass
    default/.style = {
      title = {},
      institute = {Universiti Pertahanan Nasional Malaysia}, 
      department = {},
      role = {Member}
    },
    title/.estore in = \membertitle,
    department/.estore in = \memberdepartment,
    institute/.estore in = \memberinstitute,
    role/.estore in = \memberrole
  }%
  \newcommand\member[2][]{%
    \pgfkeys{/member, default, ##1}%
    \mbox{}\newline
    \textbf{##2} \newline
    \ifdefempty{\membertitle}{}{\membertitle \newline}
    \ifdefempty{\memberdepartment}{}{\memberdepartment \newline}
    \memberinstitute \newline
    (\memberrole) \newline
    \mbox{}
    & \\\hline%
  }%
  \tabularx{\textwidth}{| >{\raggedright\arraybackslash}X | >{\centering\arraybackslash}p{4cm} |}
  \hline
  & \emph{Signature}\\[-\onelineskip]
}{
  \endtabularx
}

\RequirePackage{comment}
\if@undergrad
  \excludecomment{examcommapproval}%
\else
  \newenvironment{examcommapproval}{%
    \clearpage%
    \abnormalparskip{\onelineskip}%
    \nottoggle{approvaladded}{
      \phantomsection%
      \addcontentsline{toc}{chapter}{\texorpdfstring{APPROVAL}{Approval}}%
      \global\toggletrue{approvaladded}%
    }{}%
    \SingleSpacing%
    I certify that an Examination Committee has met on \textbf{\@mtvivadate} to conduct the final examination of \textbf{\theauthor} on his (or her) degree thesis entitled \textbf{`\thetitle'}. The committee recommends that the student be awarded the \@mtdegree\space(\@mtstudyfield).\par
    Members of the Examination Committee were as follows.\par
    \committee
  }{
    \endcommittee
    \clearpage
  }
\fi

\newenvironment{supervisoryapproval}{%
  \clearpage%
  \abnormalparskip{\onelineskip}%
  \nottoggle{approvaladded}{
    \phantomsection%
    \addcontentsline{toc}{chapter}{\texorpdfstring{APPROVAL}{Approval}}%
    \global\toggletrue{approvaladded}%
  }{}%
  \SingleSpacing%
  \if@undergrad%
    This thesis was submitted to the \@mtfaculty, Universiti Pertahanan Nasional Malaysia and has been accepted as partial fulfillment of the requirement for the Bachelor's degree in \textbf{\@mtstudyfield}. %
  \else%
    This thesis was submitted to the Senate of Universiti Pertahanan Nasional Malaysia and has been accepted as fulfillment of the requirement for the degree of \textbf{\@mtdegree\space(\@mtstudyfield)}. %
  \fi
  The members of the Supervisory Committee were as follows.\par
  \committee
}{
  \endcommittee
  \clearpage
}

%%%%%%%%%%%%%%%%%%%
% Declaration form.
\newcommand{\declarationpage}{{%
  \clearpage%
  \phantomsection%
  \addcontentsline{toc}{chapter}{\texorpdfstring{DECLARATION}{Declaration}}%
  \SingleSpacing\abnormalparskip{\onelineskip}%\enlargethispage{\baselineskip}%
  { \centering%
    \rule{\textwidth}{1.5pt}\par
    \textbf{UNIVERSITI PERTAHANAN NASIONAL MALAYSIA}\par
    DECLARATION OF THESIS\par
  }

  { \setlength\extrarowheight{\onelineskip}%
    \begin{tabularx}{0.95\textwidth}{@{}l @{\hspace{1em}:\hspace{1em}} >{\hrulefill}X}
    Author's full name &\\
    Date of birth &\\
    Title &\\
    Academic Session &\\
    \end{tabularx}
  }

  I declare that this thesis is classified as:\\
  { \setlength\extrarowheight{\onelineskip}%
    \begin{tabularx}{\textwidth}{@{\Large$\square$ } >{\bfseries}l @{\hspace{1.5em}} >{\raggedright\arraybackslash}X @{}}
    CONFIDENTIAL & (Contains confidential information under the Official Secret Act 1972)*\\
    RESTRICTED & (Contains restricted information as specified by the organisation where research was done)*\\
    OPEN ACCESS & I agree that my thesis to be published as online open access (full text)
    \end{tabularx}%
  }

  I acknowledge that Universiti Pertahanan Nasional Malaysia reserves the right as follows.

  \vspace*{-\onelineskip}
  \begin{enumerate}
  \tightlist
  \item The thesis is the property of Universiti Pertahanan Nasional Malaysia.
  \item The library of Universiti Pertahanan Nasional Malaysia has the right to make copies for the purpose of research only.
  \item The library has the right to make copies of the thesis for academic exchanges.
  \end{enumerate}

  \begin{tabularx}{\textwidth}{@{}>{\centering\arraybackslash}X @{\hspace{.25\textwidth}} >{\centering\arraybackslash}X}
  \\
  \hrulefill \newline Signature &
  \hrulefill \newline Signature of Main Supervisor\\[1cm]
  \hrulefill \newline IC/Passport No. &
  \hrulefill \newline Name of Main Supervisor\\[\onelineskip]
  Date: \hrulefill & Date: \hrulefill
  \end{tabularx}

  \hangfrom{Note: *\hspace{1em}}{If the thesis is CONFIDENTIAL OR RESTRICTED, please attach the letter from the organisation stating the period and reasons for confidentiallity and restriction.}\par\vspace*{-\baselineskip}
  \rule{\textwidth}{1.5pt}%
}}

%%%%%%%%%%%
% Biodata of Student
%%%%%%%%%%%
\newenvironment{biodata}{%
  \chapter*{Biodata of Student}
  \addcontentsline{toc}{chapter}{\texorpdfstring{BIODATA OF STUDENT}{Biodata of Student}}
}{}

\endinput