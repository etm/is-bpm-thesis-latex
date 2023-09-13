%%
% TUM Corporate Design Book
% Michael Riesch (michael.riesch@tum.de) adapted by Lukas Heidegger (lukas.heidegger@tum.de)
% Made easy to use by Juergen Mangler (juergen.mangler@tum.de)
% Based on the templates from https://www.tum.de/cd
%
% Template for scientific theses, lecture notes, ...
%
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tum-book}[2018/10/08 TUM Corporate Design Book v0.3]

% process options
\DeclareOption{a4paper}{%
  \PassOptionsToPackage{a4paper}{tum-base-text}
  \PassOptionsToClass{a4paper}{book}
}
\DeclareOption{a5paper}{%
  \PassOptionsToPackage{a5paper}{tum-base-text}
  \PassOptionsToClass{a5paper,fontsize=12pt}{book}
}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{book}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}}
\DeclareOption{times}{\PassOptionsToPackage{times}{tum-base}}
\DeclareOption{german}{%
  \PassOptionsToPackage{german}{tum-base}
  \PassOptionsToPackage{german}{nomencl}
}
\DeclareOption{english}{%
  \PassOptionsToPackage{english}{tum-base}
  \PassOptionsToPackage{english}{nomencl}
}
\ExecuteOptions{twoside,a4paper}
\ProcessOptions\relax

% load base class
\LoadClass[]{book}

\newcommand{\thepublisher}{~}
\newcommand{\publisher}[1]{\renewcommand{\thepublisher}{#1}}
\newcommand{\thetitledescription}{~}
\newcommand{\titledescription}[1]{\renewcommand{\thetitledescription}{#1}}
\newcommand{\thefineprint}{~}
\newcommand{\fineprint}[1]{\renewcommand{\thefineprint}{#1}}
\newcommand{\thesubtitle}{~}
\newcommand{\subtitle}[1]{\renewcommand{\thesubtitle}{#1}}
\newcommand{\germantitle}[1]{\renewcommand{\thesubtitle}{#1}}
\newcommand{\thechair}{~}
\newcommand{\chair}[1]{\renewcommand{\thechair}{#1}}
\newcommand{\theschool}{~}
\newcommand{\school}[1]{\renewcommand{\theschool}{#1}}
\newcommand{\thedepartment}{~}
\newcommand{\department}[1]{\renewcommand{\thedepartment}{#1}}
\newcommand{\thedegree}{~}
\newcommand{\degree}[1]{\renewcommand{\thedegree}{#1}}
\newcommand{\thethesistype}{~}
\newcommand{\thesistype}[1]{\renewcommand{\thethesistype}{#1}}

\newcommand{\thesupervisor}{~}
\newcommand{\supervisor}[1]{\renewcommand{\thesupervisor}{#1}}
\newcommand{\theexaminer}{~}
\newcommand{\examiner}[1]{\renewcommand{\theexaminer}{#1}}
%\newcommand{\thematnr}{~}
%\newcommand{\matnr}[1]{\renewcommand{\thematnr}{#1}}
\newcommand{\thesubmissiondate}{~}
\newcommand{\submissiondate}[1]{\renewcommand{\thesubmissiondate}{#1}}
\newcommand{\thehood}{~}
\newcommand{\hood}[1]{\renewcommand{\thehood}{#1}}

% load TUM base packages
\RequirePackage{tum-base}
\RequirePackage{tum-base-text}

% custom titlepage
\AtBeginDocument{
  \begin{titlepage}
    \thispagestyle{titlepage}
    \ifavier
    % title page a4
    \begin{singlespace}
    \vbox{}

    \fontfamily{phv}\selectfont
    {~\\}


    { \flushleft\large\textbf{\thethesistype}\par }
    \vspace{0.3cm}
    { \flushleft\large\textcolor{TUMBlau}{\textbf{\@author}}\par }
    \vspace{0.3cm}
    { \flushleft\LARGE\bfseries\@title\par }
    \vspace{1cm}

    \begin{textblock*}{13cm}[1,1](\paperwidth-2\tumlogoheight,
      \paperheight-1\tumlogoheight)
      \raggedleft
      \includegraphics[width=11cm]{tum-resources/images/TUM_Uhrenturm.png}\par
    \end{textblock*}
    \end{singlespace}

    \else
    % title page a5
    \fontfamily{phv}\selectfont
    \vspace{12pt}
    { \flushleft\huge\bfseries\@title\par }
    { \flushleft\Large\@subtitle\par }
    \vspace{12pt}
    { \flushleft\Large\textcolor{TUMBlau}{\textbf{\@author}}\par
      \thepublisher\par }
    { \flushleft\large\thetitledescription\par }
    { \flushleft\normalsize\thefineprint\par }

    \begin{textblock*}{8cm}[1,1](\paperwidth-2\tumlogoheight, \paperheight)
      \raggedleft
      \includegraphics[width=8cm]{tum-resources/images/TUM_Uhrenturm.png}\par
    \end{textblock*}
    \fi

    \vfill
  \end{titlepage}

  \begin{titlepage}
    \thispagestyle{titlepage}
    \ifavier
    % title page a4
    \begin{singlespace}
    \vbox{}

    \fontfamily{phv}\selectfont
    {~\\}

    { \flushleft\large\textbf{\thethesistype}\par }
    \vspace{0.3cm}
    { \flushleft\large\textcolor{TUMBlau}{\textbf{\@author}}\par }
    \vspace{0.3cm}
    { \flushleft\LARGE\bfseries\@title\par }
    { \flushleft\Large\thesubtitle\par }
    \vspace{1cm}

    { \flushleft\large\thetitledescription\par}
    \vspace{1cm}
    { \flushleft\normalsize\thefineprint\par }

    \begin{textblock*}{13cm}[1,1](\paperwidth-2\tumlogoheight,
      \paperheight-1\tumlogoheight)
      \raggedleft
      \includegraphics[width=11cm]{tum-resources/images/TUM_Uhrenturm.png}\par
    \end{textblock*}
    \end{singlespace}

    \else
    % title page a5
    \fontfamily{phv}\selectfont
    \vspace{12pt}
    { \flushleft\huge\bfseries\@title\par }
    { \flushleft\Large\@subtitle\par }
    \vspace{12pt}
    { \flushleft\Large\textcolor{TUMBlau}{\textbf{\@author}}\par
      \thepublisher\par }
    { \flushleft\large\thetitledescription\par }
    { \flushleft\normalsize\thefineprint\par }

    \begin{textblock*}{8cm}[1,1](\paperwidth-2\tumlogoheight, \paperheight)
      \raggedleft
      \includegraphics[width=8cm]{tum-resources/images/TUM_Uhrenturm.png}\par
    \end{textblock*}


    \fi

    \vfill
  \end{titlepage}
}

% custom header/footer
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
  % clear everything
  \fancyhead{}
  \fancyfoot{}

  % page numbers
  \fancyhead[R]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{titlepage}{%
  % clear everything
  \fancyhead{}
  \fancyfoot{}

  % threeliner
  \fancyhead[L]{%
    \vbox to \tumlogoheight{%
    \vspace{1cm}
      \fontfamily{phv}\fontsize{9}{11}\selectfont\textcolor{TUMBlau}{%
        \thechair\\
        \thedepartment\\
        \theschool\\
        \theuniversity
      }
    }
  }

  % logo
  \fancyhead[R]{%
    \vbox to \tumlogoheight{%
    \vspace{1cm}
      \includegraphics[height=\tumlogoheight]%
                      {tum-resources/images/Universitaet_Logo_RGB.pdf}\ \ \
    }
  }
}

\pagestyle{plain}
\RequirePackage{atveryend}
\AtBeginDocument{
  \newpage
  \pagestyle{empty}
  {
    \fontfamily{times}\selectfont
    \noindent
    { \flushleft\huge\bfseries\center Declaration of Academic Integrity \par}
    \vspace{10mm}
    \noindent
    I confirm that this bachelor's thesis is my own work and I have documented all sources and material used.
    \par\noindent
    I am aware that the thesis in digital form can be examined for the use of unauthorized aid and in order to determine whether the thesis as a whole or parts incorporated in it may be deemed as plagiarism. For the comparison of my work with existing sources I agree that it shall be entered in a database where it shall also remain after examination, to enable comparison with future theses submitted. Further rights of reproduction and usage, however, are not granted here.
    \par\noindent
    This thesis was not previously presented to another examination board and has not been published. \par
    \begin{center}
      \vspace{30mm}\noindent
      \thehood, \thesubmissiondate \hspace{5cm} \@author\par
    \end{center}
  }
  \newpage
  \pagestyle{plain}
}

\newcommand{\printdedication}[1]{%
  \thispagestyle{empty}
  \phantom{u}
  \phantom{1}\vspace{6cm}
  \begin{center}
    \fontfamily{times}\selectfont
    #1
  \end{center}
  \newpage
  \pagestyle{plain}
}

\newcommand{\printphdthesistitle}[5]{%
  \pagestyle{empty}
  \cleardoublepage
  \pagestyle{titlepage}
  \begin{otherlanguage}{ngerman}
    { \flushleft\fontfamily{times}\selectfont\large\thedepartment\par
      \thegroup\par
    }
    \vspace{12pt}
    { \flushleft\fontfamily{times}\selectfont\huge\bfseries\@title\par }
    { \flushleft\flushleft\fontfamily{times}\Large
      \textcolor{TUMBlau}{\textbf{\@author}}\par}
    { \flushleft\fontfamily{times}\selectfont\normalsize
      Vollständiger Abdruck der von der \thedepartment{} der
      \theuniversity{} zur Erlangung des akademischen Grades eines\\
      \textbf{Doktor-Ingenieurs (Dr.-Ing.)}\\
      genehmigten Dissertation.\par
    }
    { \flushleft\fontfamily{times}\selectfont\normalsize
      Vorsitzende(r): #3\par
      Prüfer der Dissertation:
      \begin{enumerate}[nolistsep]
      \item #4
      \item #5
      \end{enumerate}
    }
    \vspace{12pt}
    { \flushleft\fontfamily{times}\selectfont\normalsize
      Die Dissertation wurde am #1 bei der \theuniversity{} eingereicht und
      durch die \thedepartment{} am #2 angenommen.\par}
  \end{otherlanguage}
  \newpage
  \pagestyle{plain}
}

%quotation
\def\signed #1{{\leavevmode\unskip\nobreak\hfil\penalty50\hskip2em
  \hbox{}\nobreak\hfil(#1)%
  \parfillskip=0pt \finalhyphendemerits=0 \endgraf}}

\newsavebox\mybox
\newenvironment{aquote}[1]
  {\savebox\mybox{#1}\begin{quote}}
  {\signed{\usebox\mybox}\end{quote}}


\usepackage{chngcntr}
\counterwithout{footnote}{chapter}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\usepackage[doublespacing]{setspace}
\makeatletter
\makeatother
\usepackage{enumitem}
\setlist{nosep}
\newcommand*{\chapterheadstartvskip}{\vspace*{0cm}}
\newcommand*{\chapterheadendvskip}{\vspace{0cm}}
\usepackage{titlesec}
\titlespacing{\section}{0pt}{*2}{*1}
\titlespacing{\subsection}{0pt}{*2}{*1}
\titleformat*{\section}{\LARGE}
\titleformat*{\subsection}{\Large}
\titleformat*{\subsubsection}{\large}

%Distance between paragraphs
\setlength{\parskip}{15pt}

\usepackage{url}
\usepackage{hyperref}
\usepackage{csquotes}

\setcounter{secnumdepth}{1}



\SetBlockThreshold{0}

\parindent=0cm
\newcommand{\periodafter}[1]{#1.~~}
\usepackage{titlesec}
\titleclass{\chapter}{straight}
\titleformat{\chapter}{\normalfont\LARGE\bfseries}{}{0em}{}
\titlespacing{\chapter}{0pt}{12pt plus 0pt minus 12pt}{0pt}
\titleformat{\section}{\normalfont\normalsize\bfseries}{}{0em}{}
\titlespacing{\section}{0pt}{12pt plus 0pt minus 12pt}{-12pt}
\titleformat{\subsection}{\normalfont\normalsize\bfseries\itshape}{}{1em}{}
\titlespacing{\subsection}{0pt}{12pt plus 0pt minus 12pt}{-12pt}
\titleformat{\subsubsection}[runin]{\normalfont\normalsize\bfseries}{}{1em}{\periodafter}
\titlespacing{\subsubsection}{1.27cm}{0pt}{0pt}

%% Control the fonts and formatting used in the table of contents.

\usepackage[titles]{tocloft}

%% Aesthetic spacing redefines that look nicer to me than the defaults.

\setlength{\cftbeforechapskip}{2ex}
\setlength{\cftbeforesecskip}{0.5ex}

\renewcommand{\cftchapfont}{\bfseries}

\usepackage[labelfont=bf,textfont=it,singlelinecheck=off,justification=raggedright]{caption}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\setlength{\abovecaptionskip}{15pt plus 3pt minus 2pt}
\setlength{\belowcaptionskip}{15pt plus 3pt minus 2pt}
\captionsetup[figure]{labelsep=newline}
\captionsetup[table]{labelsep=newline}

\usepackage[capposition=top]{floatrow}

\usepackage{graphicx}
\usepackage{verbatim}
\graphicspath{{img/}}
\usepackage{wrapfig}
\usepackage[backend=biber,style=ieee, pagetracker=true]{biblatex}
\addbibresource{literature.bib}
\DeclareLanguageMapping{english}{english-apa}
\pdfimageresolution 300

\newcommand{\paragraphWithHeading}[1]{\paragraph{#1}\mbox{}\newline}
\pgfplotsset{compat=1.15}
