% Use the `standard` option to get 4x3 aspect ratio.
% Use the `noul` option if there is a conflict with the `\ul` command.
% Set theme with 'yellow', 'orange', 'red', 'blue', 'purple', or 'green'.
\documentclass{antbrief}

\pretitle{Version 2.5}
\title{Center for Discovery of Aquatic Life on Mars}
\subtitle{2021 Hitch Hiker's Guide to Space Travel}
\author{Dr. John Smith \\ Dr. Joe Shmoe}
% \copyrighted{2022}{John Smith}
% \contact{}
% \extralogo{}

% Distribution and Control
% \distributionA
% \cui{
%     Controlled By: AETC \\
%     Controlled By: AFIT/ENG \\
%     CUI Category(ies): PRVCY \\
%     Distribution: \DistB{CATEGORY}{DATE}{OFFICE} \\
%     POC: John Smith, 555-123-4567}
% \classified{
%     Classified By: \\
%     Derived From: \\
%     Declassify On: }
% \banner{cui}

\begin{document}
\maketitle

\chapter{Introduction}

\section{Single Column}

Write your presentation like a normal \LaTeX\ file with a \verb|\maketitle|
command and \verb|\chapter| and \verb|\section| headings. The \verb|\maketitle|
contents are defined by the following macros:
\begin{center}
    \begin{tabular}{l@{\qquad}l@{\qquad}l}
        \verb|\pretitle| &
        \verb|\title| &
        \verb|\subtitle| \\
        \verb|\author| &
        \verb|\extralogo|
    \end{tabular}
\end{center}
The \verb|\extralogo| command specifies an extra logo below the AFIT crest. The
\verb|\chapter| heading creates a slide with just the chapter name. The
\verb|\section| heading sets the title of a new slide. However, if no text
follows the section, no slide will be created. Text which does not fit on one
slide will flow onto the next slide automatically. To get 4-by-3 aspect ratio
slides, specify \verb|standard| as an option to the document class.

\section{Double Column}\twocolumn\raggedright

Use the \verb|\twocolumn| and \verb|\onecolumn| commands right after the section
heading to control the number of columns. Text will flow from the left column to
the right.
\begin{itemize}
    \item Point one
    \item Point two
    \item Point three
    \item Point four
    \item Point five
    \item Point six
    \item Point seven
    \item Point eight
    \item Point nine
    \item Point ten
    \item Point eleven
    \item Point twelve
\end{itemize}
You can use \verb|\pagebreak| to force text onto the next column.

\section{Table of Stuff}

You can create any variety of subdivisions on your slide by using the
\verb|tabular| environment.
\begin{center}
\begin{tabular}{C{0.25\textwidth}cC{0.25\textwidth}cC{0.25\textwidth}}
    \cellcolor{dark}\textcolor{white}{Primary} &&
    \cellcolor{dark}\textcolor{white}{Secondary} &&
    \cellcolor{dark}\textcolor{white}{Tertiary} \\
    First && Second && Third \\
    One && Two && Three \\[1em]
    \cellcolor{dark}\textcolor{white}{Alpha} &&
    \cellcolor{dark}\textcolor{white}{Beta} &&
    \cellcolor{dark}\textcolor{white}{Gamma} \\
    Green && Blue && Red \\
    Cyan && Yellow && Magenta
\end{tabular}
\end{center}
The \verb|\cellcolor| command sets the background color of a table cell.

\section{Quad Charts}

\quadchart{% Top-left content
    \textbf{Itemized Lists}\scriptsize\vspace{0.5cm}

    \begin{itemize}
        \item Budget: \$1,000,000
        \item Spent to Date: \$725,000
        \item Remaining: \$275,000
        \item Burn Rate: \$150,000/mo.
        \item Projection: On track
    \end{itemize}
}{% Top-right content
    \textbf{Graphs}\tiny\vspace{1ex}

    \begin{center}
    \begin{tikzpicture}[scale=0.4]
        \path (-4,0) -- (5,0);
        \foreach \p/\C [count=\n] in {50/lime, 43/azure, 36/orange,
                29/purple, 17/red} {
            \pgfmathsetmacro{\ang}{3.6*\p}
            \pgfmathsetmacro{\rad}{1.0*\n}
            \draw[\C, line width=5pt] (\rad,0) arc (0:\ang:\rad)
                node[anchor={\ang-90}, inner sep=0pt]{\p\%};
        }
    \end{tikzpicture}
    \end{center}
}{% Bottom-left content
    \textbf{Tables}\tiny\vspace{1em}

    \begin{center}
    \renewcommand{\arraystretch}{1.3}
    \begin{tabular}{@{}lrrr@{}}
        \hline
        \textbf{Category} & \textbf{Budget} &
            \textbf{Spent} & \textbf{Remaining} \\
        \hline
        Salaries          & \$500,000       & \$325,000      & \$175,000 \\
        Equipment         & \$200,000       & \$180,000      & \$20,000  \\
        Travel            & \$50,000        & \$30,000       & \$20,000  \\
        Marketing         & \$150,000       & \$125,000      & \$25,000  \\
        Miscellaneous     & \$100,000       & \$65,000       & \$35,000  \\
        \hline
        \textbf{Total}    & \textbf{\$1,000,000} &
            \textbf{\$725,000} & \textbf{\$275,000} \\
        \hline
    \end{tabular}
    \end{center}
}{% Bottom-right content
    \textbf{Text}\tiny

    \begin{verse}
        'Twas brillig, and the slithy toves\\
        Did gyre and gimble in the wabe;\\
        All mimsy were the borogoves,\\
        And the mome raths outgrabe.

        ``Beware the Jabberwock, my son!\\
        The jaws that bite, the claws that catch!\\
        Beware the Jubjub bird, and shun\\
        The frumious Bandersnatch!''
    \end{verse}
}

\section{Centering}

\begin{Center}
    \Large Use the \texttt{Center} environment \\
    to center horizontally \emph{and} vertically.
\end{Center}

\chapter{Explicit Code}

\section{Python}\onecolumn

Use the \verb|python| environment for Python code.
\begin{python}
def write_list(fid, x, level):
    ind = '  '*level
    xs = '0' if abs(x[0]) < 1e-3 else "%.3f"
`\HL`    txt = '\n%svalues=\"%s' % (ind, xs)
    for n in range(1, len(x)):
        xs = '0' if abs(x[n]) < 1e-3 else "%.3f"
        if len(txt) + 3 + len(xs) >= 80:
            fid.write(txt + ';\n')
            txt = ind + '  ' + xs
        else:
            txt += '; ' + xs
    fid.write(txt + '\"')
\end{python}

\section{MATLAB}

Use the \verb|matlab| environment for MATLAB code.
\begin{matlab}
function savepdf(name, width, height)
    % name is the file name including ".pdf".
    % Both width and height are in (cm).
    set(gcf, 'units', 'centimeters', ...
        'position', [0, 0, width, height])
    set(gca, 'FontSize', 9);
    set(gca, 'FontName', 'Times New Roman');
    exportgraphics(gcf, name, ...
        'ContentType', 'vector');
end
\end{matlab}

\section{R Language}

Use the \verb|rlang| environment for R code.
\begin{rlang}
factorial <- function(n) {
    if (n == 0 || n == 1) {
        return(1)
    } else {
        return(n * factorial(n - 1))
    }
}
\end{rlang}

\section{Pseudocode}

Use the \verb|pseudocode| environment for non-language-specific code.
\begin{pseudocode}
function add_arrays($a$, $b$, $N$)
    $c \gets zeros(N)$
    for $n$ in $0:N-1$
        if $a_n$ and $b_n$ are real
            $c_n = a_n + b_n$
        end if
    end for
    return $c$
end function
\end{pseudocode}

\chapter{Control and Classification}

\section{Controlled Unclassified Information}

Unless your presentation is being distributed, no markings need to be applied.
If it is approved for public release without restriction, you can mark it as
Distribution A with the \verb|\distributionA| command.

If it is approved with a different distribution statement (B through F), specify
the banner (markings in the header and footer) with \verb|\banner{cui}| and fill
in the details with the \verb|\cui| command:
\begin{verbatim}
  \cui{Controlled By: AETC \\
      Controlled By: AFIT/ENG \\
      CUI Category(ies): PRVCY \\
      Distribution: \DistB{CATEGORY}{DATE}{OFFICE} \\
      POC: John Smith, 555-123-4567}
\end{verbatim}

\section{Classified Information}

For classified information, use the \verb|\banner| command and the
classification (e.g., \verb|\banner{secret}|) and the \verb|\classified|
command:
\begin{verbatim}
  \classified{
      Classified By: \\
      Derived From: \\
      Declassify On: }
\end{verbatim}

\section{Color Themes}

Although specific colors are not officially dictated, it is common to use
certain colors for certain degrees of information control. A color theme can be
set for the presentation by entering the color as a parameter to the class:
\verb|\documentclass[purple]{antbrief}|. The commonly used colors are
\begin{center}
    \begin{tabular}{l|lc@{\qquad}l|l}
        Top Secret//SCI & yellow
        && Confidential & blue \\
        Top Secret & orange
        && CUI & purple \\
        Secret & red
        && Uncontrolled & green
    \end{tabular}
\end{center}
Note that ``CUI'' means ``Controlled Unclassified Information.''

% You can create blank pages for placing full-page graphics or text with the
% `\blankpage` command.
\blankpage
% You can place images and text at arbitrary locations with the `\pos` command.
\pos{0pt}{0pt}{\tikz{
    \newcounter{density}\setcounter{density}{10}
    \def\mainColor{light}
    \path[coordinate] (0,0) coordinate(A)
        ++(\paperwidth,0) coordinate(B)
        ++(0,-\paperheight) coordinate(C)
        ++(-\paperwidth,0) coordinate(D);
    \fill[\mainColor!\thedensity]
        (A) -- (B) -- (C) -- (D) -- cycle;
    \foreach \x in {1,...,18}{%
        \pgfmathsetcounter{density}{\thedensity+5}
        \setcounter{density}{\thedensity}
        \path[coordinate] coordinate(X) at (A){};
        \path[coordinate] (A)
            -- (B) coordinate[pos=0.15](A)
            -- (C) coordinate[pos=0.15](B)
            -- (D) coordinate[pos=0.15](C)
            -- (X) coordinate[pos=0.15](D);
        \draw[\mainColor!80!black, fill=\mainColor!\thedensity]
            (A) -- (B) -- (C) -- (D) -- cycle;
    }
}}
\pos[6cm]{0.125\textwidth}{2cm}{
    \raggedright\large Blank pages with the ``\texttt{\textbackslash
    blankpage}'' command.
}
\pos[6cm]{0.6\textwidth}{6cm}{
    \raggedright\large Arbitrary positioning with the ``\texttt{\textbackslash
    pos}'' command.
}

\closing
\end{document}
