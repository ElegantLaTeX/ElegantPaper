% Current Version: 0.05
% Author: Dongsheng Deng
% Homepage: https://ddswhu.me/
% Email: elegantlatex2e@gmail.com
% Lastest Version: https://github.com/ElegantLaTeX/ElegantPaper

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantpaper}[2019/02/01 v0.05 ElegantLaTeX Paper class]
  
\LoadClass[11pt]{article}

\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{ifxetex}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}

\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

\DeclareStringOption[en]{lang}
\DeclareVoidOption{cn}{\ekv{lang = cn}}
\DeclareVoidOption{en}{\ekv{lang = en}}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\ExecuteOptions{12pt}
\ProcessKeyvalOptions*\relax
\ProcessOptions*

% font setting for text and math

\RequirePackage{amsthm}
\RequirePackage{amsmath,amssymb}
%\RequirePackage{newtxtext}
%\RequirePackage{newtxmath}
%  
\RequirePackage{type1cm}
\RequirePackage{indentfirst}

% more pretty font
\linespread{1.3}



% indentation, table and figure package
\RequirePackage{indentfirst}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{type1cm}
\RequirePackage{abstract}

\graphicspath{{image/}{figure/}{fig/}{img/}}

% caption settings 
\RequirePackage[font=small,labelfont={bf}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% list/itemize/enumerate setting
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}

% define the hyperref color 
\RequirePackage{xcolor}
\definecolor{winered}{rgb}{0.5,0,0}

% bib-settings
\RequirePackage{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}

% settings for the geometry
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=true,
  linkcolor={winered},
  urlcolor={winered},
  filecolor={winered},
  citecolor={winered},
  linktoc=all,
}
\RequirePackage[left=1in, right=1in, top=1in, bottom=1in]{geometry}

% add the \email cmd 
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}


% fontsetting
\RequirePackage{ifxetex}
\ifxetex
	\RequirePackage{fontenc}
	\RequirePackage[no-math]{fontspec}
	\setmainfont{Times New Roman}[NFSSFamily=ntxtlf]
	\setsansfont{Arial}
	%\setmonofont[Scale=0.9]{Courier New}
	\RequirePackage{xeCJK}
	\RequirePackage{xunicode}
	\setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}
	\setCJKsansfont[BoldFont={SimHei},ItalicFont={KaiTi}]{KaiTi}
	\setCJKmonofont[BoldFont={SimHei},ItalicFont={KaiTi},Scale=0.9]{Microsoft YaHei}
	\XeTeXlinebreaklocale "zh"
	\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
	\RequirePackage{newtxmath}
	%\DeclareSymbolFont{operators}{OT1}{ntxtlf}{m}{n}
	%\SetSymbolFont{operators}{bold}{OT1}{ntxtlf}{b}{n}
	\setCJKfamilyfont{zhsong}{SimSun}
	\setCJKfamilyfont{zhhei}{SimHei}
	\setCJKfamilyfont{zhkai}{KaiTi}
	\setCJKfamilyfont{zhfs}{FangSong}
	\newcommand*{\songti}{\CJKfamily{zhsong}} 
	\newcommand*{\heiti}{\CJKfamily{zhhei}}   
	\newcommand*{\kaishu}{\CJKfamily{zhkai}} 
	\newcommand*{\fangsong}{\CJKfamily{zhfs}} 
\else
	\RequirePackage{fontenc}
	\RequirePackage{newtxtext}
	\RequirePackage{newtxmath}
	\RequirePackage[UTF8, scheme=plain]{ctex}
\fi
\RequirePackage[scale=0.8]{FiraMono}

\ifdefstring{\ELEGANT@lang}{cn}{
  	\theoremstyle{plain}% default
	\newtheorem{theorem}{定理}[section] %
	\newtheorem{lemma}[theorem]{引理} %
	\newtheorem{proposition}[theorem]{性质} %
	\newtheorem*{corollary}{推论} %
	\theoremstyle{definition} %
	\newtheorem{definition}{定义}[section] %
	\newtheorem{conjecture}{猜想}[section] %
	\newtheorem{example}{例}[section] %
	\theoremstyle{remark} %
	\newtheorem*{remark}{\normalfont\bfseries评论} %
	\newtheorem*{note}{\normalfont\bfseries注} %
	\newtheorem{case}{\normalfont\bfseries案例} %
	\renewcommand*{\proofname}{\normalfont\bfseries证明} %
	\renewcommand\contentsname{目录}
	\renewcommand\refname{参考文献} %
	\renewcommand\figurename{图} %
	\renewcommand\tablename{表}%
	\newcommand\versiontext{版本：}%
	\newcommand\updatetext{最后更新：}%
	\renewcommand\abstractname{摘\hspace{2em}要}
	\setlength{\parindent}{2em}
	\renewcommand{\abstracttextfont}{\kaishu\sffamily\small}
	\newcommand{\keywords}[1]{\vskip2ex\par\noindent\normalfont{\bfseries 关键词: } #1}
}{\relax}
\ifdefstring{\ELEGANT@lang}{en}{
  \theoremstyle{plain}% default
	\newtheorem{theorem}{Theorem}[section] %
	\newtheorem{lemma}[theorem]{Lemma} %
	\newtheorem{proposition}[theorem]{Proposition} %
	\newtheorem*{corollary}{Corollary} %
	\theoremstyle{definition} %
	\newtheorem{definition}{Definition}[section] %
	\newtheorem{conjecture}{Conjecture}[section] %
	\newtheorem{example}{Example}[section] %
	\theoremstyle{remark} %
	\newtheorem*{remark}{Remark} %
	\newtheorem*{note}{Note} %
	\newtheorem{case}{Case} %
	\renewcommand*{\proofname}{\normalfont\bfseries\color{ecolor}Proof}%
	\newcommand\versiontext{Version: }%
	\newcommand\updatetext{Last update: }%
	\renewcommand{\abstracttextfont}{\sffamily\small}
	\newcommand{\keywords}[1]{\vskip2ex\par\noindent\normalfont{\bfseries Keywords: } #1}
}{\relax}

\AtBeginEnvironment{verbatim}{\microtypesetup{activate=false}}

\newtoks\version
\newtoks\institute

\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\bfseries \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author\\
        \the\institute
      \end{tabular}\par}%
    \vskip 1.5em%
    {\small\itshape \versiontext \the\version}%
    \vskip .1em%
    {\small\itshape \updatetext \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
  


\DeclareSymbolFont{cmlargesymbols}{OMX}{cmex}{m}{n}
\DeclareMathSymbol{\intop}{\mathop}{cmlargesymbols}{"5A}
  \def\int{\intop\nolimits}
\DeclareMathSymbol{\ointop}{\mathop}{cmlargesymbols}{"49}
  \def\oint{\ointop\nolimits}
\DeclareMathSymbol{\sumop}{\mathop}{cmlargesymbols}{"58}
  \let\sum\sumop
\DeclareMathSymbol{\prodop}{\mathop}{cmlargesymbols}{"59}
  \let\prod\prodop



\newcommand\figref[1]{{\bfseries Figure~\ref{#1}}}
\newcommand\tabref[1]{{\bfseries Table~\ref{#1}}}


\RequirePackage{listings} 
\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
	texcsstyle=*\bf\color{winered}\ttfamily,
	basicstyle=\footnotesize\ttfamily,
	numbers=none,
	breaklines=true,
	keywordstyle=\bf\color{winered}\ttfamily,
	commentstyle=\color{gray},
	emph={elegantpaper,fontenc,fontspec,xeCJK,FiraMono,xunicode,newtxmath,figure,fig,image,img,table,itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX},
	emphstyle={\color{frenchplum}},
	morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords},
	frame=none,
	tabsize=2,
	backgroundcolor=\color{lightgrey}
}

\bibliographystyle{aer}


