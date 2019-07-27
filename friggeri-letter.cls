\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{friggeri-letter}[2015/10/31 Cover letter for friggeri resume]


\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{letter}%
}
\ProcessOptions\relax

\LoadClass{letter}

\newcommand*{\header}[3]{
  \def\firstname{#1}
  \def\lastname{#2}
  \def\subtitle{#3}
}

\newcommand*{\content}[2]{
  \def\contentto{#1}
  \def\contentbody{#2}
}

\newcommand*{\closingFrom}[1]{
  \def\clFrom{#1}
}

\newcommand*{\yourInfo}[5]{
	\def\homeaddr{#1}
	\def\homephone{#2}
	\def\youremail{#3}
	\def\yourlinkedIn{#4}
	\def\yourwebsite{#5}
}

\newcommand*{\officeaddress}[1]{
	\def\officeaddr{#1}
}

\newcommand*{\postscript}[1]{
	\def\ps{#1}
}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{363d47}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{lightgray}{HTML}{f4f4f4}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{fromcolor}{blue}
  \colorlet{header}{gray}
  \colorlet{contact}{lightgray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{fromcolor}{red}
  \colorlet{header}{white}
  \colorlet{contact}{lightgray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}


%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
% https://tex.stackexchange.com/questions/353136/compilation-error-option-unknown-unicode-math
%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math} % https://tex.stackexchange.com/questions/353136/compilation-error-option-unknown-unicode-math
\RequirePackage[]{unicode-math}


\newfontfamily\bodyfont[]{Roboto-Regular}
\newfontfamily\thinfont[]{Roboto-Thin}
\newfontfamily\headingfont[]{Roboto-Medium}
\newfontfamily\positionfont[]{Roboto-LightItalic}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Roboto-Light}

%\setmathfont{XITS Math}



%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \positionfont%
  \color{white}%
}

%The letter template changes where current page.north is
%let's reset it
\setlength\headheight{0\p@}



\renewcommand*{\opening}[1]{
\begin{tikzpicture}[remember picture,overlay]

  
  \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2.8cm] (box) at (current page.north){};
  
  \node [below right=8pt] (name) at (box.north west) {%
    \fontsize{40pt}{72pt}\color{header}%
    {\bodyfont \firstname}{\bodyfont \lastname}
  };
  \node [below right] at (name.south west) {%
    \fontsize{18pt}{24pt}\color{header}%
    \bodyfont \subtitle%
  };
  
  \node [rectangle, fill=contact, anchor=north east, minimum width=6cm, minimum height=\paperheight] (box_addr) at (box.south east){};
    \node [below right, text width=6cm] (box_addr_name) at (box_addr.north west) {%
    \thispagestyle{empty}%
    {\begin{tabular}{p{\textwidth}}\ignorespaces
	\vspace{3\parskip}%
	\textbf {\large Personal Info} %
	\par\noindent\rule{5.4cm \color{fromcolor}}{0.38pt} %
	\\ \vspace{3\parskip} %
	\textbf{Address} \\ %
	\homeaddr \\ \vspace{3\parskip}%
	\textbf{Phone} \\ %
	\homephone \\ \vspace{3\parskip}%
	\textbf{Email} \\ %
	\youremail \\ \vspace{3\parskip}%
	\textbf{LinkedId} \\ %
	\yourlinkedIn \\ \vspace{3\parskip}%
	\textbf{Portfolio} \\ %
	\yourwebsite \\ %
	\end{tabular}}\\ %
  };
  
    \node [rectangle, fill=white, anchor=north east, minimum width=\paperwidth-6cm, minimum height=\paperheight, text width=\paperwidth-7cm] (box_content) at (box_addr.north west){};
    
	\node (box_content_data) [below right=8pt, text width=\paperwidth-7cm]  at (box_content.north west) {%
    \thispagestyle{empty}%
    {\begin{tabular}{p{\textwidth}}\ignorespaces
    \officeaddr \\*[2\parskip]%
    \@date \\ \vspace{3\parskip}%
	\contentto \\ \vspace{3\parskip}%
	\contentbody \\ \vspace{3\parskip}%
	\clFrom \\ \vspace{3\parskip}%
	\ps %
	\end{tabular}}%
  };
  
\end{tikzpicture}

#1\nobreak}
