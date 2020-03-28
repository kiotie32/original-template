%\NeedsTeXFormat{LaTeX2e} \ProvidesClass{BYUPhys}
\NeedsTeXFormat{LaTeX2e} \ProvidesClass{iiitg}

% ---------------------------- declarations -------------------------
%
% These macros are used to declare arguments needed for the
% construction of the preliminary pages  

% The year and month the degree is awarded
\newcommand{\Year}[1]{\gdef\@Year{#1}}
\newcommand{\Month}[1]{\gdef\@Month{#1}}

% The full name of the degree
\newcommand{\degree}[1]{\gdef\@degree{#1}}

% The name of this document (thesis/dissertation)
\newcommand{\docname}[1]{\gdef\@docname{#1}}

% First line of title
\newcommand{\TitleTop}[1]{\gdef\@TitleTop{\mbox{\uppercase{{\bf #1}}}}}
%\newcommand{\TitleBottom}[1]{\gdef\@TitleBottom{\mbox{{{\bf #1}}}}}




% Second line of title
%\newcommand{\TitleBottom}[1]{\gdef\@TitleBottom{\mbox{\uppercase{{\bf #1}}}}}
\newcommand{\TitleBottom}[1]{\gdef\@TitleBottom{\mbox{{{\bf #1}}}}}


% Abstract text
\newcommand{\Abstract}[1]{\gdef\@Abstract{#1}}


% Approval text
\newcommand{\Approval}[1]{\gdef\@Approval{#1}}

% Certificate text
\newcommand{\Certificate}[1]{\gdef\@Certificate{#1}}

% Declaration text
\newcommand{\Declaration}[1]{\gdef\@Declaration{#1}}

% Acknowledgments text
\newcommand{\Acknowledgments}[1]{\gdef\@Acknowledgments{#1}}

% The author's name
\newcommand{\Author}[1]{\gdef\@Author{#1}}

% The name of the advisor number 1
\newcommand{\AdvisorA}[1]{\gdef\@AdvisorA{#1}}

% The name of the advisor number 2
\newcommand{\AdvisorB}[1]{\gdef\@AdvisorB{#1}}

% The name of the "dummy" advisor
\newcommand{\Advisor}[1]{\gdef\@Advisor{#1}}

\newcommand{\MemberA}[1]{\gdef\@MemberA{#1}}

% The name of the committee member 3
\newcommand{\MemberB}[1]{\gdef\@MemberB{#1}}

% The name of the committee member 4
\newcommand{\MemberC}[1]{\gdef\@MemberC{#1}}

% The name of the committee member 5
\newcommand{\MemberD}[1]{\gdef\@MemberD{#1}}

% The name of the department chair
\newcommand{\DepRep}[1]{\gdef\@DepRep{#1}}

% The title of the department chair (allow for associate chair, etc.)
\newcommand{\DepRepTitle}[1]{\gdef\@DepRepTitle{#1}}

% The name of the department undergraduate coordinator
\newcommand{\UgradCoord}[1]{\gdef\@UgradCoord{#1}}

% The name of the dean
\newcommand{\Dean}[1]{\gdef\@Dean{#1}}

% The title of the dean
\newcommand{\DeanTitle}[1]{\gdef\@DeanTitle{#1}}

% The name of the honors dean
\newcommand{\HonorsDean}[1]{\gdef\@HonorsDean{#1}}

% Set default values for fields
  \Year{1905}
  \Month{January}
  \Author{Author}
  \TitleTop{First line of title}
  \TitleBottom{ } % default is empty
  \Abstract{Abstract text goes here.}
  \Acknowledgments{Acknowledgment text goes here.}
  \degree{Bachelor of Science}
  \docname{senior thesis}
  \AdvisorA{AdvisorA}
  \AdvisorB{AdvisorB}
  \Advisor{Advisor}
  \MemberA{Committee Member A}
  \MemberB{Committee Member B}
  \MemberC{Committee Member C}
  \MemberD{Committee Member D}
  \DepRep{Department Chair Name}
  \DepRepTitle{Chair}
  \Dean{Dean Name}
  \DeanTitle{Associate Dean}
  \HonorsDean{Honors Dean Name}
  \UgradCoord{Department Ugrad Coordinator }
  
% ---------------------------- options ------------------------------

% A command to switch to single spaced lines
\newcommand{\singlespace}{\renewcommand{\baselinestretch}{1}\small\normalsize}

% A command to switch to double spaced lines
\newcommand{\doublespace}{\renewcommand{\baselinestretch}{1.66}\small\normalsize}

\newcommand{\onehalfspace}{\renewcommand{\baselinestretch}{1.3}\small\normalsize}

% A command pirated from chngpage.sty
\DeclareRobustCommand{\ch@ngetext}{%
  \setlength{\@colht}{\textheight}\setlength{\@colroom}{\textheight}%
  \setlength{\vsize}{\textheight}\setlength{\columnwidth}{\textwidth}%
  \if@twocolumn%
    \advance\columnwidth-\columnsep \divide\columnwidth\tw@%
    \@firstcolumntrue%
  \fi%
  \setlength{\hsize}{\columnwidth}%
  \setlength{\linewidth}{\hsize}%
}

% A command to make margins right for the initial single sided business.
\newcommand{\preliminarymargins}{%
    \addtolength{\textwidth}{-0.5in}%
    \addtolength{\evensidemargin}{0.5in}%
    \ch@ngetext%
    }

% A command to fix the margins after the initial single sided business.
\newcommand{\fixmargins}{%
    \addtolength{\textwidth}{0.5in}
    \addtolength{\textheight}{0.5in}
    \addtolength{\oddsidemargin}{.60in}
    \addtolength{\evensidemargin}{-.990in}
    \ch@ngetext%
}

% Define the preliminary section for a senior thesis.  
% The senior option is essentially ignored since it is the default 
  \newcommand{\makepreliminarypages}{
    \preliminarymargins
	\namepage 
    \titlepage 
    \copyrightpage 
    \seniorapprovalpage 	%% uncomment this line to include the approval by DSC committee - SG
    \abstractpage 
    \acknowledgmentspage 
    \fixmargins
    \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}
  }

% Changes to PhD preliminary section if the 'phd' option is specified
\DeclareOption{mtp}{
  \degree{Master of Technology}
  \docname{Thesis}
  \renewcommand{\makepreliminarypages}{ 
    \preliminarymargins
	\namepage
    \titlepage 
%	\approvalpage		%% uncomment this line to include the approval by DSC committee - SG
	\certificatepage
    \declarationpage
    \acknowledgmentspage
    \abstractpage      
    \fixmargins
    \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}
  }
}

% --------------------- Some commands to handle the single sided preliminary pages ------------------

% Define the '\clearemptydoublepage' command to clear pages but not number any blank pages inserted.

\let\cle@rdoublep@ge\cleardoublepage
\newcommand{\cle@remptydoublep@ge}{
  \clearpage
  \if@twoside
  \ifodd\c@page\else
  \fi\fi
  {\pagestyle{empty}\cle@rdoublep@ge}}
\newcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}


% Create an abstract environment which is single sided, even in a double sided book.

\def\skip@bstr@ctp@ges{\relax}
\def\@@skip@bstr@ctp@ges{%
  \if@twoside
   \ifodd\c@page\else
    \vbox{\vbox to \vsize{}}
    \clearpage\fi
   \else
  \fi
  \afterpage{\skip@bstr@ctp@ges}
}
\newenvironment{abstractenv}{
   \def\skip@bstr@ctp@ges{\@@skip@bstr@ctp@ges}
%   \afterpage{\skip@bstr@ctp@ges \thispagestyle{empty}}
   \pagestyle{empty}
}

% Redefine above commands if etd option is specified.  The blank pages make printing nice,
% but they don't want them in the submitted PDF
\DeclareOption{etd}{
    \renewcommand{\clearemptydoublepage}{ \clearpage }
    %\renewenvironment{abstractenv}{\afterpage{\thispagestyle{empty}}\pagestyle{empty}}{}
    \renewenvironment{abstractenv}
  }

% ------------------------ Load the class and needed packages ---------------------------------

% Load the book class  
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} 
\ProcessOptions\relax 

%\LoadClass[letterpaper,12pt]{book}
\LoadClass[a4paper,11pt]{book}
% I changed the above option from letterpaper to a4paper - SG

% The afterpage package is required to make single sided formal pages 
% in a double sided environment
\RequirePackage{afterpage}

% Note: the hyperref package is required to make an appropriate ETD.
% However, we don't require it here since it is supposed to be the last
% package loaded and students may want to load other packages in the 
% main tex file.  So that this class file doesn't crash if the student
% forgets to load hyperref, we have used the following commands below:
%
%   \providecommand\phantomsection{}
%   \providecommand\pdfbookmark[3][]{}
%
% These commands provide dummy versions of the macros, but won't
% bother the real versions if the hyperref package is loaded in the 
% tex file.


% ---------------------------- main code ----------------------------

% 
%Set the margins to iiitg specifications for the single sided preliminary
% pages.  At the end of the \makepreliminarypages command we fix the margins
% to be appropriate alternating values for double sided printing (if selected).
% If the \makepreliminarypages macro is not run, this never gets fixed. 
  \setlength{\marginparwidth}{72pt}
  \setlength{\marginparsep}{0pt}
  \setlength{\oddsidemargin}{0.9in}
  \setlength{\evensidemargin}{0.7in}
  \setlength{\textwidth}{6in}
  \setlength{\topmargin}{0in}
  \setlength{\headheight}{0.125in}
  \setlength{\headsep}{0.25in}
  \setlength{\textheight}{8.625in}
%\setlength{\textheight}{15in}
  \setlength{\footskip}{0.25in}
  \raggedbottom

% Redefine the Table of Contents to deal with some blank page 
% and bookmarking issues relating to ETD submission
\let\TEMPtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
  \clearemptydoublepage
  \providecommand\phantomsection{} \phantomsection
  \addcontentsline{toc}{chapter}{Table of Contents}
  \TEMPtableofcontents
}
 
% Redefine the List of Figures to deal with some blank page 
% and bookmarking issues
\let\TEMPlistoffigures\listoffigures
\renewcommand{\listoffigures}{
  \providecommand\phantomsection{} \phantomsection
  \addcontentsline{toc}{chapter}{List of Figures}
  \TEMPlistoffigures
}

% Redefine the List of Tables to deal with some blank page 
% and bookmarking issues
\let\TEMPlistoftables\listoftables
\renewcommand{\listoftables}{
  \providecommand\phantomsection{} \phantomsection
  \addcontentsline{toc}{chapter}{List of Tables}
  \TEMPlistoftables
}

% Redefine the Bibliography to deal with a bookmarking issues
\let\TEMPbibliography\bibliography
\renewcommand{\bibliography}{
  \providecommand\phantomsection{} \phantomsection
  \addcontentsline{toc}{chapter}{Bibliography}
  \TEMPbibliography
}

%---------------------------- The Preliminary Page Definitions --------------------------
% ============================== Name Page =============================== 
 \newcommand{\namepage}{
    \thispagestyle{empty}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}    
    \vspace*{0.375in}   
    \@TitleTop\\[\baselineskip]
    \@TitleBottom\\
    \end{center}
    \begin{flushright}
    \vfill
    {\bf {\em \@Author}}
    \end{flushright}
    \clearemptydoublepage
  }
% ============================== Title Page ===============================
\renewcommand{\titlepage}{
    \thispagestyle{empty}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}    
    \vspace*{0.375in}
    \@TitleTop\\[\baselineskip]
    \@TitleBottom\\
    \vfill
    {\bf {\em Thesis submitted to the}}\\
    {\bf {\em Indian Institute of Information Technology Guwahati}}\\
    {\bf {\em for award of the degree}}\\[\baselineskip]
	{\bf {\em of}}\\[\baselineskip]
	%\vskip 0.667in
    {\large {\bf \@degree}} \\[\baselineskip]
	%\vskip 0.667in
    {\bf {\em by}}\\[\baselineskip]
    {\large {\bf \@Author}}\\[\baselineskip]
	%{\em {\bf Under the joint supervision of}}\\[\baselineskip]
        {\em {\bf under the supervision of}}\\[\baselineskip]
	{\bf \@AdvisorA}\\
%	{\bf and}\\
%	{\bf \@AdvisorB}
	\vfill
	%\includegraphics[width=1.2in]{logo.eps}\\[0.5cm]
	\includegraphics[width=1.2in]{iiitglogo.eps}\\[0.5cm]
	{\bf DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING}\\[\baselineskip]
	{\bf INDIAN INSTITUTE OF INFORMATION TECHNOLOGY GUWAHATI}\\[\baselineskip]
	{\bf \@Month~\@Year} \\[\baselineskip]
{\copyright \@Year~\@Author. All rights reserved.}
    \end{center}
    \clearemptydoublepage
  }

% ======================== Copyright page ===============================
\newcommand{\copyrightpage}{
    \thispagestyle{empty}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Copyright}{bm:Copyright}    
    \vspace*{\fill}
    \begin{center}
    Copyright \copyright\ \@Year~\@Author\\[\baselineskip]
    All Rights Reserved\\[5\baselineskip]
    \end{center}
    \vspace{1in}
    \vfill
    \clearemptydoublepage
  }
  
  \newcommand{\datebox}{
    \parbox[t]{1.5in}{
        \ \\[2\baselineskip]
        Date: %\rule{1.5in}{0.4pt}\\
        
    }
} 

\newcommand{\signaturebox}[1]{
    \parbox[t]{3.6in}{
        \ \\[2\baselineskip]
     %\rule{1.8in}{0.4pt}\\
      #1
    }
}


% ======================= Approval Page ============================
\newcommand{\approvalpage}{
    \thispagestyle{empty}%
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Approval Page}{bm:Approval}    
    \vspace*{0.375in}
   {\large {\bf APPROVAL OF THE VIVA-VOCE BOARD}}\\[3\baselineskip]
    \end{center}%
    
    \renewcommand{\baselinestretch}{1.66} \small\normalsize%
    \@Approval  
\clearemptydoublepage
  }


% ======================= Certificate Page ============================
\newcommand{\certificatepage}{
    \thispagestyle{empty}%
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Certificate Page}{bm:Accept}    
    \vspace*{0.375in}
   {\large \textbf{CERTIFICATE}}\\[3\baselineskip]
    \end{center}%
    
    \renewcommand{\baselinestretch}{1.66} \small\normalsize%
    \@Certificate  
\clearemptydoublepage
  }



% ========================= Declaration ==============================
\newcommand{\declarationpage}{
    \renewcommand{\baselinestretch}{1}\small\normalsize
    \thispagestyle{empty}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Declaration}{bm:Declaration}    
    \vspace*{0.375in}
    {\large \textbf{DECLARATION}}\\[3\baselineskip]
    \end{center}
    
    \renewcommand{\baselinestretch}{1.66} \small\normalsize%
    \@Declaration  
    \clearemptydoublepage
  }



% ========================= Acknowledgments ==============================
\newcommand{\acknowledgmentspage}{
    \renewcommand{\baselinestretch}{1}\small\normalsize
    \thispagestyle{empty}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Acknowledgments}{bm:Acknowledge}    
    \vspace*{0.375in}
    {\large \textbf{ACKNOWLEDGMENTS}}\\[3\baselineskip]
    \end{center}
    
    \renewcommand{\baselinestretch}{1.66} \small\normalsize%
    \@Acknowledgments  
    \clearemptydoublepage
  }



% ========================= Abstract ===================================

\newcommand{\abstractpage}{
    \thispagestyle{empty}
    \begin{abstractenv}
    \begin{center}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}    
    %\vspace*{0.375in}
    {\large \textbf{ABSTRACT}}\\[3\baselineskip]
    \vspace*{-0.5in}
    \end{center}   
    \renewcommand{\baselinestretch}{1.66}\small\normalsize
    \@Abstract
    
    \end{abstractenv}
    \clearemptydoublepage
  }


