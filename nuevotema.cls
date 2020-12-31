%%%% Esta es la clase para los nuevos temas de oposición, que cuentan con:
%		* Hoja índice
%		* Idea clave
%		* Esquema largo
%		* Esquema corto
%       * Conceptos
%		* Gráficas
%		* Preguntas
%		* Notas
%       * Bibliografía

\ProvidesClass{nuevotema}[16/03/2017 Nuevos Temas oposicion con esquemas]
\LoadClass[a4page]{article}

\usepackage[T1]{fontenc} 
\usepackage[utf8]{inputenc}

\usepackage[table]{xcolor}
%\usepackage{pgf}
%\usepackage{pgfplots}
%\pgfplotsset{compat=newest}
%\usepackage{pgfplotstable}
\usepackage{pythontex}

\usepackage{pdfpages}
\begin{pythontexcustomcode}{py}
import sys
sys.path.append('/home/alibey/Src/econdata')
import bdsice 

db = bdsice.bdsiceDB()
\end{pythontexcustomcode}

\newcommand{\bdsice}[1]{
\begin{minipage}{\textwidth}
	%\includepdf[scale=0.85,pages=1]{testpdf}
	\pyc{s=db.plotter(#1,save=True,outputformat="pdf")} 
	\pyc{print('\\scalebox{0.9}{\\includepdf[scale=0.85,pages=1]'+'{' + str(s) + '}}')}
	%\pyc{print('\\includepdf[pages=1,pagecommand=\\seccion{' + #1 + '}]'+'{' + str(s) + '}')}
\end{minipage}

Figura
}

\usepackage{oposicion}
\usepackage{changepage}

% FIRASANS
%\usepackage{FiraSans}

%\usepackage{plex-serif}

% FOURIER
\usepackage{fourier}

% Trajan
\usepackage{trajan}

% plex IBM
\usepackage[t]{plex-sans}

% TIMES NEW ROMAN
%\savesymbol{iint}
%\savesymbol{openbox}
%\usepackage{txfonts}
%\usepackage[T1]{fontenc}
%\restoresymbol{TXF}{iint}
%\restoresymbol{TXF}{openbox}

% TABLA DE CONTENIDOS
\usepackage{tocloft}
\setlength{\cftbeforepartskip}{1ex}
\setlength{\cftbeforesecskip}{.8ex}
\setlength{\cftbeforesubsecskip}{.4ex}
\setlength{\cftsecindent}{1cm}
\setlength{\cftsubsecindent}{2cm}
\setlength{\cftpartnumwidth}{5em}
\renewcommand{\cftpartfont}{\plexsans}
\newcommand{\cftchapfont}{\plexsans}
\renewcommand{\cftsecfont}{\plexsans}
\renewcommand{\cfttoctitlefont}{\Large \plexsans}
\renewcommand{\cftaftertoctitle}{\plexsans \hfill Página}
\renewcommand{\cfttoctitlefont}{\plexsans \Large \bfseries \MakeUppercase}
\renewcommand{\cftsubsecdotsep}{\cftnodots}

% OTROS PAQUETES
\usepackage[margin=.9in,a4paper]{geometry}
\usepackage{graphicx}
\usepackage{url}
\urlstyle{same}
%\usepackage{lmodern}
\usepackage{enumitem, color, amssymb}

\usepackage{amsthm}
\usepackage[fit]{truncate}

\usetikzlibrary{decorations.pathreplacing,angles,quotes}



\author{\plexsans Miguel Fabián Salazar}

% PARTES TEMAS
\def\gnewcommand{\g@star@or@long\new@command}
\def\grenewcommand{\g@star@or@long\renew@command}
\def\g@star@or@long#1{% 
    \@ifstar{\let\l@ngrel@x\global#1}{\def\l@ngrel@x{\long\global}#1}}

\titleclass{\part}{top}
\titleformat{\part}{\grenewcommand{\sectiontitle}{} \LARGE \plexsans \bfseries}{\thepart}{12pt}{\uppercase{#1} \grenewcommand{\parttitle}{#1}}

\titleformat{\section}{\Large \plexsans}{}{12pt}{\scshape#1}


\newcommand{\parte}[1]{
{\newpage \thispagestyle{plain} \noindent \LARGE \plexsans \bfseries \uppercase{#1} \bigskip}
\grenewcommand{\parttitle}{#1}
\phantomsection
\addcontentsline{toc}{part}{#1}
\grenewcommand{\sectiontitle}{}
}

\newcommand{\ideaclave}{\parte{Idea clave}}
\newcommand{\indices}{\parte{Hoja índice}}
\newcommand{\esquemacorto}{\parte{Esquema corto}}
%\newcommand{\parte}[1]{\part*{#1} \addcontentsline{toc}{part}{#1}}
\newcommand{\esquemalargo}{\parte{Esquema largo}}
\newcommand{\notas}{\parte{Notas}}
\newcommand{\preguntas}{\parte{Preguntas}}
\newcommand{\bibliografia}{\parte{Bibliografía}}
\newcommand{\conceptos}{\parte{Conceptos}}
\newcommand{\graficas}{\parte{Gráficas} \setcounter{rgcounter}{1}}


\newcommand{\seccion}[1] {
%    \titleformat{\section}
    {\bigskip 
    	
	 \noindent \Large \plexsans \scshape#1 
	 
	 \medskip }
    \phantomsection
    \addcontentsline{toc}{section}{#1} 
    %\section*{#1}
    \grenewcommand{\sectiontitle}{:\; #1}
}

\newcommand{\subseccion}[1] {\addcontentsline{toc}{subsection}{#1} \subsection*{#1}}

% FORMATO DEL CABECERO DE LAS PAGINAS
\usepackage{titleps}
\newpagestyle{main}{
    \setheadrule{.4pt}% Header rule
    \sethead{\small \textotema}% left
    {}%                                 center
    {\parttitle \sectiontitle}%       right
    \setfoot{}{\thepage}{}
}
\pagestyle{main}


% TÍTULO
%\newcommand{\titulo}[1]{\gnewcommand{\textotitulo}{#1}}
\newcommand{\tema}[1]{\gnewcommand{\textotema}{#1}}
\newcommand{\fijartitulo}{\title{\plexsans \fbox{Tema \textotema :}\; \textsc{ \textotitulo}}}
%\newcommand{\fijartitulo}{\title{\fbox{\trjnfamily Tema \textotema :}\; \textsc{\textotitulo}}}

\newcommand{\titulo}[1]{
%	\pdfcatalog{%
%		/PageLabels << /Nums [ 0 << /P (Cover) >>% 
%		1 << /S /D >>%   
%		]
%		>>
%	}
    \gnewcommand{\textotitulo}{#1} 
    % \title{\firamedium \fbox{Tema \textotema :}\; \textsc{\textotitulo} \\  %\large{\adforn{21}\quad\adforn{11}\quad\adforn{49}}
    %\title{{\trjnfamily OPOSICION \\ TECNICO COMERCIAL Y ECONOMISTA DEL ESTADO} \\ \bigskip \firamedium \fbox{Tema \textotema :}\; \textsc{\textotitulo} \\  %\large{\adforn{21}\quad\adforn{11}\quad\adforn{49}}
    \title{{\trjnfamily OPOSICION \\ TECNICO COMERCIAL Y ECONOMISTA DEL ESTADO} \\ \bigskip \bigskip \bigskip \bigskip \plexsans \fbox{Tema \textotema :}\; \textsc{\textotitulo} \\  %\large{\adforn{21}\quad\adforn{11}\quad\adforn{49}}
 % \title{\firamedium \fbox{{\trjnfamily TEMA} \textotema :}\; \textsc{\textotitulo} \\  %\large{\adforn{21}\quad\adforn{11}\quad\adforn{49}}
    	}

	\date{{\tiny \plexsans \today}}

% pdf metadata

\hypersetup{
	pdfauthor={Miguel Fabián Salazar},
	pdftitle={\textotema  --  \textotitulo},
	pdfsubject={\textotitulo},
	pdfkeywords={\textotitulo},
	pdfproducer={Vim 8 + TeXLive \@ Debian Buster},
	pdfcreator={pdflatex},
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=blue
}




\AtBeginDocument{
    \begin{titlingpage}
        \setlength{\droptitle}{30pt} % lower the title
        \maketitle
	\thispagestyle{empty}
	\newpage
        \tableofcontents
    \end{titlingpage}
}
}

\usepackage{setspace}
\usepackage{multicol}

\newcommand{\ItemSpacing}{2pt}%
\newcommand{\ParSpacing}{0pt}%

\usepackage{enumitem}
\setlist[enumerate]{font=\color{black}, after={\color{black}}}
\setenumerate[1]{itemsep={\ItemSpacing},parsep={\ParSpacing},label=\Roman*.}
\setenumerate[2]{itemsep={\ItemSpacing},parsep={\ParSpacing},label=\arabic*. }
\setenumerate[3]{itemsep={\ItemSpacing},parsep={\ParSpacing},label=\roman*.}
\setenumerate[4]{itemsep={\ItemSpacing},parsep={\ParSpacing},label=\alph*.}


\makeatletter
\newenvironment{hojaindice}[1][]{%
    \ifthenelse{\equal{#1}{}}{}{\renewcommand{\ol@type}{#1}}%
    \ol@z%
    \newcommand{\0}{\ol@toz\ol@z}%
    \newcommand{\1}{\ol@toi\scshape\color{red}\bfseries\Large\ol@i\item}%
    \newcommand{\2}{\ol@toii\normalfont\normalsize\bfseries\ol@ii\item}%
    \newcommand{\3}{\ol@toiii\normalfont\normalsize\ol@iii\item}%
    \newcommand{\4}{\ol@toiiii\normalfont\smallsize\ol@iiii\item}%
}{%
    \ol@toz\ol@exit%
}

\newcommand{\highlightlevelone}{    }


\newenvironment{esquema}[1][]{%
    \ifthenelse{\equal{#1}{}}{}{\renewcommand{\ol@type}{#1}}%
    \ol@z%
    \newcommand{\0}{\ol@toz\ol@z}%
    \newcommand{\1}{\ol@toi\scshape\bfseries\ol@i\item}%
    \newcommand{\2}{\ol@toii\normalfont\bfseries\ol@ii\item}%
    \newcommand{\3}{\ol@toiii\normalfont\normalsize\itshape\ol@iii\item}%
    \newcommand{\4}{\ol@toiiii\normalfont\normalsize\ol@iiii\item}%
}{%
    \ol@toz\ol@exit%
}

\NewDocumentEnvironment{esquemal}{}
{
	\begin{adjustwidth}{-1.5cm}{-2cm}
		\begin{multicols}{2}
			\begin{esquema}[enumerate]
}
{
\end{esquema}
		\end{multicols}
	\end{adjustwidth}
}

\makeatother

\setlength{\columnseprule}{1pt}
\def\columnseprulecolor{\color{gray}}

\pagenumbering{arabic}

% HIPERVÍNCULOS

%\usepackage[numbered]{bookmark}

%\usepackage{hyperref}
%% colorlinks, citecolor=black, filecolor=black, 
%% linkcolor=black, urlcolor=blue
%
%%\usepackage{bookmark}
%\hypersetup{
%%	pdftex,
%%	pdfpagelabels=true,
%	colorlinks,
%	citecolor=black,
%	filecolor=black,
%	linkcolor=black,
%	urlcolor=blue
%} 


% HIPERVÍNCULOS
\usepackage[bookmarks=true
pdfpagelabels=false,
hyperindex=false,
colorlinks,
]{hyperref}


%\makeatletter
%\let\Hy@linktoc\Hy@linktoc@none
%\makeatother

%\hypersetup{
%	pdfpagelabels=false,
%	pdfpagelabels=false,
%	hyperindex=false,
%	colorlinks,
%	citecolor=black,
%	filecolor=black,
%	linkcolor=black,
%	urlcolor=black
%}

