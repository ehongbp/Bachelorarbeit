%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dokumentenklasse für Transferleistungen
% erstellt am 5.01.2021
% Version: v2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{common/nak}[2020/06/29 v1, by Joshua Moeckelmann]

\newif\iflnienglish\lnienglishfalse
\DeclareOption{english}{\lnienglishtrue}

\ProcessOptions

\LoadClass[a4paper,oneside,12pt, enabledeprecatedfontcommands, bibliography=totocnumbered]{scrartcl}
%times in 12 pt
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%Zeilenabstrand 1.25
\RequirePackage{setspace}
\setstretch{1.25}
%Seitenabstand
\RequirePackage[margin=2cm, includefoot, heightrounded]{geometry}
\RequirePackage{microtype}
\RequirePackage[backend=biber, bibstyle=ieee, citestyle=numeric-comp]{biblatex}
\RequirePackage[table]{xcolor}

\RequirePackage[english,ngerman,german]{babel}
\iflnienglish\selectlanguage{english}\def\bbl@main@language{english}\fi
\usepackage[utf8]{inputenc} 			
\usepackage[T1]{fontenc}



\usepackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}

%Url-Config
\PassOptionsToPackage{hyphens}{url}
\RequirePackage[hyperfootnotes=false]{hyperref}

%Tikz-Import
\RequirePackage{tikz}
\usetikzlibrary{fadings}

%Math
\RequirePackage{mathptmx}

%Graphicx
\RequirePackage{graphicx}

%Bild unterschriften
\RequirePackage{caption}
\RequirePackage{subcaption}

%Listen
\RequirePackage{listings}

%Bunter Code (z.B.)
\RequirePackage{color}

%Mehrfach Footnote
\RequirePackage[multiple]{footmisc}

%Tabellen
\RequirePackage{tabularx}
\RequirePackage{ltablex}
\RequirePackage{longtable}
%\RequirePackage{adjustbox}
\RequirePackage{rotating}
\RequirePackage{pdflscape}
\RequirePackage{afterpage}
\RequirePackage{tabu}

%Figuren im Text
\RequirePackage{wrapfig}

%pdf im text
\RequirePackage{pdfpages}
\RequirePackage[export]{adjustbox}
%test in math mode 
\RequirePackage{amstext}

%Nordakademie Head

\RequirePackage{fancyhdr}
\addtolength{\headheight}{0.9cm}
\pagestyle{fancyplain}
\fancyhead[R]{\includegraphics[height=1.3cm]{images/nak_logo2.png}}
\fancyhead[L]{NORDAKADEMIE Hochschule der Wirtschaft}
\iffalse
% Use scrlayer-scrpage for page layout customization
\RequirePackage[headsepline]{scrlayer-scrpage}

% Set up page style using scrlayer-scrpage commands
% Set up page style using scrlayer-scrpage commands
\clearpairofpagestyles % Clear header and footer
\addtokomafont{pageheadfoot}{\normalfont} % Adjust font for header and footer
\addtolength{\headheight}{0.9cm} % Adjust head height
\ohead{\includegraphics[height=1.3cm]{images/nak_logo2.png}} % Outer header (right side)
\ihead{NORDAKADEMIE Hochschule der Wirtschaft} % Inner header (left side)
\cfoot{\pagemark} % Center footer with page number

% Apply the page style
\pagestyle{scrheadings}
\fi
%Pagestyles
\RequirePackage{floatpag}

\newcommand{\needCite}[1][]{
    \@latex@warning{Still require cite: #1! Needs to be done}
    \colorbox{yellow}{\textcolor{red}{Cite Notwendig #1}}%
}



\newcommand{\anf}[1]{\glqq #1\grqq{}}
\newcommand{\anfo}[1]{\glqq #1\grqq}

\newcommand{\fullref}[1]{\ref{#1} \anf{\nameref{#1}}}

\RequirePackage{minted}
%Zitate
\RequirePackage{csquotes}

\RequirePackage{float}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Konfiguration der Codestyles%
%   kann erweitert werden    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setminted[js]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\setminted[abap]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\setminted[xml]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\setminted[json]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\setminted[java]{ %
    linenos=true,             % Line numbers
    autogobble=true,          % Automatically remove common white space
    frame=lines,
    framesep=2mm,
    fontsize=\footnotesize
}

\makeatletter
\newenvironment{codeBlock}[3]
 {\RecustomVerbatimEnvironment{Verbatim}{BVerbatim}{}%
  \def\FV@BProcessLine##1{%
    \hbox{%
      \hbox to\z@{\hss\theFancyVerbLine\kern\FV@NumberSep}%
      \FancyVerbFormatLine{##1}%
    }%
  }%
  \VerbatimEnvironment
  \begin{listing}[H]%
  \centering%
  \caption{#2}%
  \label{#3}%
  \setbox\z@=\hbox\bgroup
  \begin{minted}[samepage]{#1}}
 {\end{minted}\egroup
  \leavevmode\vbox{\hrule\kern2mm\box\z@\kern2mm\hrule}
  \end{listing}\noindent
 }
\makeatother

\usemintedstyle{lovelace}
\usemintedstyle[abap]{abap}

\renewcommand\listingscaption{Codebeispiel}
\newcommand*{\listingautorefname}{\listingscaption}

\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}p{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}p{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}p{#1}}


\newcommand{\kommentar}[1]{}