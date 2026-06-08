\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{aleph-notas}[2023/11/27 v2.0]
\newcommand\@idioma{spanish,es-noitemize}
\newcommand\@tipo{}
\RequirePackage{ifthen}
\newboolean{comentarios}\setboolean{comentarios}{false}
\newboolean{codigo}\setboolean{codigo}{false}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}
\DeclareOption{amplio}{
    \PassOptionsToPackage{paperwidth=195mm,paperheight=265mm,twoside,
    inner=2.2cm,outer=2.2cm,top=2.25cm,bottom=2.25cm,
    headsep=5mm}{geometry}}
\DeclareOption{compacto}{
    \PassOptionsToPackage{paperwidth=160mm,paperheight=240mm,twoside,
    inner=1.7cm,outer=1.7cm,top=2cm,bottom=2cm,
    headsep=5mm}{geometry}}
\DeclareOption{a4}{
    \PassOptionsToPackage{paperwidth=210mm,paperheight=297mm,twoside,
    inner=2.2cm,outer=2.2cm,top=2.25cm,bottom=2.25cm,
    headheight=14pt,headsep=5mm}{geometry}}
\DeclareOption{a5}{
    \PassOptionsToPackage{paperwidth=148mm,paperheight=210mm,twoside,
    inner=1cm,outer=1cm,top=2cm,bottom=2cm,
    headsep=5mm}{geometry}}

\DeclareOption{comentarios}{\setboolean{comentarios}{true}}

\DeclareOption{codigo}{\setboolean{codigo}{true}}

\ExecuteOptions{compacto,10pt}
\ProcessOptions\relax
\LoadClass{article}
\RequirePackage{iftex}
\ifPDFTeX 
    \RequirePackage[utf8]{inputenc}
\else 
\fi
\RequirePackage[T1]{fontenc}
\RequirePackage[\@idioma]{babel}
\RequirePackage{xcolor}
\RequirePackage{amsmath,amsthm}
\RequirePackage{enumitem}
\RequirePackage[many]{tcolorbox}
\RequirePackage{fontawesome}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{comment}
\RequirePackage[font={small},labelfont={bf,small},
   justification=centerlast]{caption}
\RequirePackage{float}
\RequirePackage{geometry}
\RequirePackage{tabularray}
\RequirePackage[colorlinks,allcolors=.,breaklinks]{hyperref}
\newcommand{\fuente}[1]{
    \ifthenelse{\equal{#1}{mathpazo}}
    {
        \ifPDFTeX 
            \RequirePackage{mathpazo}
        \else 
            \RequirePackage{fontspec}
            \RequirePackage{mathpazo}
            \setmainfont
             [ BoldFont       = texgyrepagella-bold.otf ,
               ItalicFont     = texgyrepagella-italic.otf ,
               BoldItalicFont = texgyrepagella-bolditalic.otf ]
             {texgyrepagella-regular.otf}
        \fi
    }{}
    \ifthenelse{\equal{#1}{montserrat}}
    {
        \ifPDFTeX 
            \RequirePackage[defaultfam,tabular,lining]{montserrat}
                \renewcommand*\oldstylenums[1]{{\fontfamily{Montserrat-TOsF}\selectfont #1}}
            \RequirePackage[OT1]{eulervm}
            \renewcommand{\labelitemi}{$\bullet$}
            \DeclareMathSizes{10}{10.78}{7}{7}
        \else 
            \RequirePackage[OT1]{eulervm}
            \RequirePackage{fontspec}
            \setmainfont{montserrat}
            \DeclareSymbolFont{operators}{\encodingdefault}{\familydefault}{m}{n}
            \DeclareMathSizes{10}{10.78}{7}{7}
            \renewcommand{\labelitemi}{$\bullet$}
        \fi
    }{}
}
\newcommand\@institucion{Alephsub0}
\newcommand\@temacorto{}
\newcommand\@interlineado{1.2}
\definecolor{colordef}{cmyk}{0.81,0.62,0.00,0.22}
\definecolor{colortext}{cmyk}{0.81,0.62,0.00,0.22}
\AtBeginDocument{
   \addtolength{\abovedisplayskip}{-0.5mm}
   \addtolength{\belowdisplayskip}{-0.5mm}
    }
%%  
\newcommand{\interlineado}[1]{\renewcommand\@interlineado{#1}}

\newcommand{\espteo}[1]{\renewcommand\@espteo{#1}}

\newcommand{\institucion}[1]%
    {\renewcommand\@institucion{#1}}
\newcommand{\autor}[2][]{\ifthenelse{\equal{#1}{}}
   {\newcommand\@autorcorto{#2}\newcommand\@autor{#2}}
   {\newcommand\@autorcorto{#1}\newcommand\@autor{#2}}}
\newcommand{\carrera}[1]%
    {\newcommand\@carrera{#1}}
\newcommand{\asignatura}[1]%
    {\newcommand\@asignatura{#1}}
\newcommand{\tema}[2][]{\ifthenelse{\equal{#1}{}}
   {\renewcommand\@temacorto{#2}\newcommand\@tema{#2}}
   {\renewcommand\@temacorto{#1}\newcommand\@tema{#2}}}
%%  
\newcommand{\fecha}[1]%
    {\newcommand\@fecha{#1}}

\newcommand{\logouno}[2][0.1\linewidth]%
    {\newcommand\@logouno{#2}
    \newcommand\@longlogouno{#1}}
%% 
\newcommand{\logodos}[2][0.1\linewidth]%
    {\newcommand\@logodos{#2}
    \newcommand\@longlogodos{#1}}
\newcommand\@titulo{
    \textbf{\textsc{\large\@institucion
    \normalsize
    \ifthenelse{
            \isundefined{\@carrera}
            \OR
            \isundefined{\@asignatura}
        }
        {
            \ifdef{\@carrera}{\\\@carrera}{}
            \ifdef{\@asignatura}{\\\@asignatura}{}
        }
        {\\\@carrera\ \ $\bullet$\ \ \@asignatura}}}
    \ifdef{\@tema}{\\\normalsize\textsc{\@tema}}{}
    \\\textsl{\@autor} \ifdef{\@fecha}{\ \ $\bullet$\ \ \ \textsl{\@fecha}}{}
    }
\newcommand\@inlogouno{
    \parbox{\@longlogouno}
        {\includegraphics[width=\linewidth]{\@logouno}}
    }
\newcommand\@inlogodos{
    \parbox{\@longlogodos}
        {\includegraphics[width=\linewidth]{\@logodos}}
    }
\newcommand{\encabezado}{
    \vspace*{-15mm}
    \begingroup\color{colortext}
    \thispagestyle{plain}
    \noindent
    \begin{minipage}{\linewidth}
    \begin{tblr}{
      colspec = {Q[m,c]<{\hspace{.02\linewidth}}|[1.2pt]>{\hspace{.02\linewidth}}X[m,l]},
      colsep = 2pt
    }
        \ifthenelse{\isundefined{\@logouno}}{}{\@inlogouno}
        \ifthenelse{\isundefined{\@logodos}}{}
            {\hspace{0.02\textwidth}\@inlogodos}
        & \parbox{.98\linewidth}{\@titulo}
    \end{tblr}
    \end{minipage}
    \endgroup\\
}
\renewcommand{\baselinestretch}{\@interlineado}
\titleformat{\section}[display]
    {\bfseries\scshape\centering}
    {}{0ex}
    {\color{colortext}\large\titlerule\vspace{0.25ex}
    \thesection.\ }
    [\color{colortext}\titlerule]
\titlespacing{\section}
    {0pt}
    {-0.5ex plus 1ex}
    {2.3ex plus .5ex}
\titleformat{name=\section,numberless}[display]
    {\bfseries\scshape\centering}
    {}{0ex}
    {\color{colortext}\large\titlerule\vspace{.25ex}}
    [\color{colortext}\titlerule]
\titleformat{\subsection}
    {\color{colortext}\normalsize\bfseries}
    {\thesubsection}{1em}{}
\titleformat{\subsubsection}
    {\color{colortext}\normalsize\bfseries}
    {\thesubsubsection}{1em}{}
\def\tcb@@tipo{}
    \tcbset{ tipo/.code = {\def\tcb@@tipo{#1} } }
\def\tcb@@contador{}
    \tcbset{ contador/.code = {\def\tcb@@contador{#1} } }
\def\tcb@@color{colordef}
    \tcbset{ color/.code = {\def\tcb@@color{#1} } }
\def\tcb@@icono{{\large\faWarning}}
    \tcbset{ icono/.code = {\def\tcb@@icono{#1} } }
\newtheoremstyle{estiloteorema}%
    {9pt}{9pt}{}{0pt}
    {\bfseries\color{\tcb@@color}}
    {}{ }
    {\textsc{\thmname{#1}\thmnumber{ #2}}\thmnote{: #3}.}
\tcbset{ recuadrost/.style ={
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=\tcb@@color!7,colframe=\tcb@@color,
    boxrule=0pt,leftrule=2pt,
    top=0.5mm,bottom=0.5mm,left=2mm,right=2mm,
    fontupper=\normalsize,
    }
    }
\tcbset{ postit/.style ={
    breakable,enhanced,
    before skip=2mm,after skip=3mm,
    colback=\tcb@@color!50,colframe=\tcb@@color!20!black,
    boxrule=0.4pt,
    drop fuzzy shadow,
    left=6mm,right=2mm,top=0.5mm,bottom=0.5mm,
    sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
    underlay unbroken and last = {%
        \path[fill=tcbcolback!80!black]
        ([yshift=3mm]interior.south east) --++ (-0.4,-0.1) --++ (0.1,-0.2);
        \path[draw=tcbcolframe,shorten <=-0.05mm,shorten >=-0.05mm]
        ([yshift=3mm]interior.south east) --++ (-0.4,-0.1) --++ (0.1,-0.2);
        \path[fill=\tcb@@color!50!black,draw=none]
        (interior.south west) rectangle node[white]{\tcb@@icono} ([xshift=5.5mm]interior.north west);
        },
    underlay = {%
        \path[fill=\tcb@@color!50!black,draw=none]
        (interior.south west) rectangle node[white]{\tcb@@icono} ([xshift=5.5mm]interior.north west);
        }
    }
    }
\tcbset{ recuadroctint/.style ={
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=colordef!7,colframe=colordef!7,colbacktitle=colordef!7,
    boxrule=0pt,toprule=0.4pt,
    drop fuzzy shadow,
    top=0.5mm,bottom=0.5mm,left=2mm,right=2mm,
    fontupper=\normalsize,
    code={\refstepcounter{\tcb@@contador}},
    overlay unbroken and first = {
        \draw[\tcb@@color,line width =2.5cm]
            ([xshift=1.25cm, yshift=0cm]frame.north west)--+(0pt,3pt);
        },
    overlay middle and last = { },
    title={
            \color{\tcb@@color}\bfseries
            {\scshape\tcb@@tipo~\arabic{\tcb@@contador}}%
                %
            \ifthenelse{\equal{#1}{}}{.}{: #1.}%
        },
    }
    }
\theoremstyle{estiloteorema}
    \newtheorem{ejem}{Ejemplo}
    \newtheorem*{obs}{\tikz \fill[colordef] (1ex,1ex) circle (.8ex); Observaci\'on}
    \newtheorem{prop}{Proposici\'on}
        \tcolorboxenvironment{prop}{%
            color=colordef,recuadrost,colback=colordef!7,drop fuzzy shadow
        }
    \newtheorem{cor}[prop]{Corolario}
        \tcolorboxenvironment{cor}{%
            color=colordef,recuadrost,colback=colordef!7,drop fuzzy shadow
        }
    \newtheorem{lem}[prop]{Lema}
        \tcolorboxenvironment{lem}{%
            color=colordef,recuadrost,colback=colordef!7,drop fuzzy shadow
        }
    \newtheorem{ejer}{Ejercicio}
        \tcolorboxenvironment{ejer}{%
            color=colordef,recuadrost,colback=colordef!7,drop fuzzy shadow
        }
\newtcolorbox{teo}[1][]
    {tipo=Teorema,contador=prop,color=colordef,recuadroctint={#1}}
\newcounter{defi}
\renewcommand{\thedefi}{\arabic{defi}}
\newtcolorbox{defi}[1][]
    {tipo=Definici\'on,contador=defi,color=colordef,recuadroctint={#1}}
\newcounter{axioma}
\renewcommand{\theaxioma}{\arabic{axioma}}
\newtcolorbox{axioma}[1][]
    {tipo=Axioma,contador=axioma,color=colordef,recuadroctint={#1}}
\newtcolorbox{advertencia}
    {color=yellow,postit}
\ifthenelse{\boolean{comentarios}}{
    \newtcolorbox{comentarios}{
        breakable,
        enhanced,
        outer arc=0pt, arc=0pt,
        colframe=colordef!20,
        colback=white,
        attach boxed title to top left,
        boxed title style={
            colback=colordef!50,
            outer arc=0pt, arc=0pt,
            boxrule=0pt,
        },
        boxrule=0pt,
        borderline west = {1.5pt}{0pt}{colordef!50},
        borderline south = {1.5pt}{0pt}{colordef!50},
        left=1mm,
        fontlower=\small,
        title=\textbf{\textsc{\small \textcolor{black}{Sugerencias metodológicas:}}}
        }
    }
    {\excludecomment{comentarios}}
\ifthenelse{\boolean{codigo}}{
    \newtcolorbox{codigo}{
    blanker,breakable, left=3mm, before skip=10pt, after skip=10pt, borderline west={1mm}{0pt}{colordef!50}, fontlower=\small}
    }
    {\excludecomment{codigo}}


\newcommand{\matricula}[1]{\def\@matricula{#1}}

\makeatletter
\renewcommand\@titulo{
  \parbox{\linewidth}{
    {\large\textbf{\textsc{\@institucion}}}\\
    \ifdef{\@carrera}{{\normalsize\textsc{\@carrera}}\\}{}          
    \ifdef{\@asignatura}{{\normalsize\textsc{\@asignatura}}\\}{}    
    \ifdef{\@tema}{{\normalsize\textsc{\@tema}}}{}                   
    \ifdef{\@fecha}{\ \ $\bullet$\ \ {\normalsize\textsc{\@fecha}}}{}\\
    {\normalsize\textsl{\@autor}%
    \ifdef{\@matricula}{\ \ $\bullet$\ \ \textsl{\@matricula}}{}}
  }
}
\makeatother


\endinput