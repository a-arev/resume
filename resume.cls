

\ProvidesClass{resume}

\LoadClass[12pt,letterpaper]{article} % Font size and paper type
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{CormorantGaramond} % Garamond font
\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{bbding}
\pagestyle{empty} % Remove page numbers

%-------------------------------------------------------
%	HEADINGS COMMANDS: Printing name and contact info
%-------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command
\def \@name {} % Sets \@name to empty by default

\def \addressSep {\scriptsize\OrnamentDiamondSolid} % Set address separator to four diamonds

% Up to three address lines can be defined 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can 3 addresses (the last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress gives styling to adress line input
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    {#1}
  \hrule % Horizontal line
  \endgroup
  \par
\vspace{0.5em}
}

% \printname prints name header
\def \printname {
  \begingroup
    {\namesize\bf \@name}\hfil 
    \nameskip\break
  \endgroup
\vspace{-1.9em}
  
}

%------------------------------
%	PRINT THE HEADING LINES
%------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begins document
  \printname % Print name header defined by \name
  \@ifundefined{@addressone}{}{ % Print first address if defined
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print second address if defined
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print third address if defined
    \printaddress{\@addressthree}}
}

%-------------------------
%   SECTIONS FORMATTING
%-------------------------

% Environment for main sections
\newenvironment{Section}[1]{ % 1 input argument - section name

  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  }{
}

%--------------------------------
%   WORK EXPERIENCE FORMATTING
%--------------------------------

\newenvironment{workSection}[5]{ % 4 input arguments - company name, start date, end date, job title, and location

 {\bf #1} \hfill {\bf #2 - #3} % Bold company name and start/end date on rightside
 \ifthenelse{\equal{#4}{}}{}{ % If fourth argument is not defined, don't show job title and location line
  \\
  {\em #4} \hfill {\em #5} % Italicize job title and location
  }\smallskip
  \begin{list}{\fontsize{0.4 em}$\blacksquare$}{\leftmargin=1 em} % squares used for bullets
   \itemsep -0.5em \vspace{-0.9em} % Adjust spacing for items in list
  }{
  \end{list}
  \vspace{0.5em} % Spacing after list
}

%------------------------
% EDUCATION FORMATTING
%------------------------

\newenvironment{eduSection}[4]{ % 4 input arguments - School name, grad date, degree, and location

 {\bf #1} \hfill {\bf #2} % Bold school name and grad date on rightside
 \ifthenelse{\equal{#3}{}}{}{ % If third argument is not defined, don't show degree name and location line
  \\
  {\em #3} \hfill {\em #4} % Italicize degree name and location
  }\smallskip
  \begin{list}{\fontsize{0.4 em}$\blacksquare$}{\leftmargin=1 em} % squares used for bullets
   \itemsep -0.5 em \vspace{-0.9em} % Adjust spacing for items in list
  }{
  \end{list}
  \vspace{0.5em} % Spacing after list of bullet points
}

%------------------------------------------
%   CERTS, SKILLS & INTERESTS FORMATTING
%------------------------------------------

\newenvironment{csiSection}[3]{ % 2 input arguments - List of certifications and list of skills

  \begin{list}{\fontsize{0.4 em}$\blacksquare$}{\leftmargin=1 em} % squares used for bullets
   \itemsep -0.5em \vspace{-0.0em} % Adjust spacing for items in list 
  \item {\textbf{Certifications:} #1} 
  \item {\textbf{Skills:} #2} 
  \item {\textbf{Interests:} #3} 
  \smallskip
  }{
  \end{list}
  \vspace{0.5em} % No space after list of bullet points
}


%---------------------------------------------------------------------------------
%   Whitespaces
%---------------------------------------------------------------------------------

% Adjust whitespaces after certain parts in document. Possible values are \smallskip, \medskip or \bigskip

\def\namesize{\fontsize{28}{12}\selectfont} % Font size of name header
\def\nameskip{\medskip} % Space after name header at top
\def\addressskip{\medskip} % Space between two address/email/phone lines
\def\sectionlineskip{\smallskip} % Space above horizontal section line  
\def\sectionskip{\smallskip} % Space after section header 
