% lifeclever.cls
%   Do not allow other document classes to use the commands provided
%
%   Guided by the points described by lifeclever's "Give Your Resume a Face Lift" article
%       1. Better typeface
%       2. Remove extra indentation
%       3. Easily skimmable
%       4. Basic typography
%
%    source: http://lifeclever.com/give-your-resume-a-face-lift

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resumetemplate}[2009/01/01 A LaTeX Resume Class]

\LoadClass[letterpaper,10pt]{article}

\setlength{\hoffset}{-0.25in}
\setlength{\oddsidemargin}{0in}
\setlength{\topmargin}{-0.25in}
\setlength{\marginparwidth}{0in}
\setlength{\marginparpush}{0in}
\setlength{\headheight}{0in}
\setlength{\marginparsep}{0in}
\setlength{\footskip}{0in}
\setlength{\voffset}{-0.25in}
\setlength{\parindent}{0pt}
\setlength{\headsep}{0pt}
\setlength{\parskip}{1ex}
% No headers or footers
\pagestyle{empty}
% Only one space after the end of a sentence
\frenchspacing
% Do not align the right side of text
%\raggedright
% Required
\setlength{\textheight}{10in}
\setlength{\textwidth}{7in}
\pagenumbering{arabic}

% enumitem will be used to produce hanging punctuations
\RequirePackage{ifthen}
\RequirePackage{url}
% Set font to KPFont (supports bold small caps) --- next 3 lines
%   - Text figures
%   - Serifs
%   - Stroke variation
%   - Similar width
%   - Medium height:width
%   - Medium height
%   - No mirrors
%   - Medium counters
\RequirePackage[T1]{fontenc}
\RequirePackage[fulloldstylenums]{kpfonts}
\linespread{0.9}
% Setting up colors
\RequirePackage{color}
\definecolor{unfocus}{gray}{0.10}
% For hanging bullets
\RequirePackage{enumitem}
\RequirePackage{multicol}
% Adjust tracking/kerning
\RequirePackage{microtype}

% Take care of invalid options
%\DeclareOption*{\PackageWarning{facelift}}{Unknown option `\CurrentOption'}
%\ProcessOptions\relax

\renewcommand{\@author}{}
\newcommand{\@addressnext}{}
\newcommand{\@address}{}
\newcommand{\@citystatezip}{}
\newcommand{\@webpage}{}
\newcommand{\@email}{}
\newcommand{\@telephone}{}

\newboolean{@compact}
\setboolean{@compact}{false}

\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}
\newcommand{\addressnext}[1]{\renewcommand{\@addressnext}{#1}}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
\newcommand{\citystatezip}[1]{\renewcommand{\@citystatezip}{#1}}
\newcommand{\webpage}[1]{\urldef{\@webpage}{\url}{#1}}
\newcommand{\email}[1]{\urldef{\@email}{\url}{#1}}
\newcommand{\telephone}[1]{\renewcommand{\@telephone}{#1}}
\newcommand{\compact}{\setboolean{@compact}{true}}

\renewcommand{\maketitle}{%
    \ifthenelse{\boolean{@compact}}{%
        {\centering\textls[200]{\LARGE\textbf{\scshape{\@author}}} \\\vspace{2em}}%
        \begin{minipage}[t]{0.5\linewidth}
            \ifthenelse{\equal{\@address}{}}{}{\@address \\}
            \ifthenelse{\equal{\@addressnext}{}}{}{\@addressnext \\}
            \ifthenelse{\equal{\@citystatezip}{}}{}{\@citystatezip \\}
        \end{minipage}%
        \begin{minipage}[t]{0.5\linewidth}
            \begin{flushright}
                \ifthenelse{\equal{\@webpage}{}}{}{\@webpage \\}
                \ifthenelse{\equal{\@email}{}}{}{\@email \\}
                \ifthenelse{\equal{\@telephone}{}}{}{\@telephone \\}
            \end{flushright}
        \end{minipage}\\%
    }{%
        \begin{center}
            \textls[200]{\large\textbf{\scshape{\@author}}} \\
            \ifthenelse{\equal{\@address}{}}{}{\@address \\}
            \ifthenelse{\equal{\@addressnext}{}}{}{\@addressnext \\}
            \ifthenelse{\equal{\@citystatezip}{}}{}{\@citystatezip \\}
            \ifthenelse{\equal{\@webpage}{}}{}{\@webpage \\}
            \ifthenelse{\equal{\@email}{}}{}{\@email \\}
            \ifthenelse{\equal{\@telephone}{}}{}{\@telephone \\}
        \end{center}%
    }%
    \vspace*{1ex}
}

\newlength{\@affiliationright}
\setlength{\@affiliationright}{2in}
\newlength{\@affiliationleft}

\newenvironment{field}[1]{%
% \affiliation{title}{institute}{location}{duration}
    \newboolean{@firstsubsection}%
    \setboolean{@firstsubsection}{true}%
    \newcommand{\affiliation}[4]{%
        \setlength{\@affiliationleft}{\textwidth}%
        \addtolength{\@affiliationleft}{-\@affiliationright}%
        \begin{minipage}[t]{\@affiliationleft}
            \textbf{##2}\\\textit{##1}
        \end{minipage}%
        \begin{minipage}[t]{\@affiliationright}
            \textcolor{unfocus}{##3}\\\textcolor{unfocus}{##4}
        \end{minipage}%
        \vspace{1ex}%
    }%
    \renewcommand{\subsection}[1]{%
        \ifthenelse{\boolean{@firstsubsection}}{\vspace{-1ex}}{\vspace{2ex}}%
        \setboolean{@firstsubsection}{false}%
        \emph{##1}%
    }%
    \rule{\textwidth}{1pt}
    \textls[200]{\large\textbf{\scshape{#1}}} \\
    \rule[3pt]{\textwidth}{0.25pt}
}{%
}

\setlist{noitemsep,nolistsep}
\setitemize{leftmargin=\parindent}
