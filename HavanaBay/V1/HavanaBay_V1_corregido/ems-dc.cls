%% ems-dc.cls -- two-column layout that follows the published look of
%% Environmental Modelling & Software (A4-like 210x280 mm page, two columns,
%% ARTICLE INFO / ABSTRACT box, Charter-type text). Derived from the Elsevier CAS
%% class cas-sc.cls (CAS Bundle, LPPL 1.3c); renamed because it is modified.
%% Not an Elsevier file. Elsevier typesets the final version itself.
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ems-dc}[2026/11/08 two-column manuscript class after cas-sc]
\def\ABD{\AtBeginDocument}
\newif\iflongmktitle    \longmktitletrue
\newif\ifdc             \global\dctrue
\newif\ifsc             \global\scfalse
\newif\ifcasreviewlayout  \global\casreviewlayoutfalse
\newif\ifcasfinallayout   \global\casfinallayoutfalse
\newcounter{blind}
\setcounter{blind}{0}
\def\blstr#1{\gdef\@blstr{#1}}
\def\@blstr{1}
\newdimen\@bls
\@bls=\baselineskip
\DeclareOption{singleblind}{\setcounter{blind}{1}}
\DeclareOption{doubleblind}{\setcounter{blind}{2}}
\DeclareOption{longmktitle}{\global\longmktitletrue}
\DeclareOption{final}{\global\casfinallayouttrue}
\DeclareOption{review}{\global\casreviewlayouttrue}
\ExecuteOptions{a4paper,10pt,oneside,fleqn,twocolumn}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[twocolumn]{article}
\RequirePackage{graphicx}
\RequirePackage{amsmath,amsfonts,amssymb}
\allowdisplaybreaks
\RequirePackage{expl3,xparse}
\@ifundefined{regex_match:nnTF}{\RequirePackage{l3regex}}{}
\RequirePackage{etoolbox}
\RequirePackage{booktabs,makecell,multirow,array,colortbl,dcolumn,stfloats}
\RequirePackage{xspace,xstring,footmisc}
\RequirePackage[svgnames,dvipsnames]{xcolor}
\ifbool{casreviewlayout}{\RequirePackage{setspace}}{}
\RequirePackage[colorlinks]{hyperref}
\colorlet{scolor}{black}
\colorlet{hscolor}{DarkSlateGrey}
\hypersetup{pdfcreator={LaTeX; ems-dc.cls; hyperref.sty},pdfproducer={pdfTeX;},
  linkcolor={hscolor},urlcolor={hscolor},citecolor={hscolor},filecolor={hscolor},menucolor={hscolor}}
\let\comma\@empty
\let\tnotesep\@empty
\let\@title\@empty
\ExplSyntaxOn
\cs_if_exist:NF \vbox_unpack_clear:N { \cs_new_eq:NN \vbox_unpack_clear:N \vbox_unpack_drop:N }
\cs_if_exist:NF \hbox_unpack_clear:N { \cs_new_eq:NN \hbox_unpack_clear:N \hbox_unpack_drop:N }
\ExplSyntaxOff
\RequirePackage{cas-common}
\ExplSyntaxOn
\bool_gset_true:N \g_stm_nologo_bool
\RenewDocumentCommand \maketitle {}
{
  \thispagestyle{first}
  \ifbool{longmktitle}
  { \begingroup\hsize=\textwidth \linewidth=\textwidth \columnwidth=\textwidth \LongMaketitleBox\endgroup \twocolumn[{\vbox_unpack_clear:N \g_stm_front_box}] \printFirstPageNotes }
  { \MaketitleBox \printFirstPageNotes }
  \normalcolor \normalfont
  \setcounter{footnote}{\int_use:N \g_stm_fnote_int}
  \renewcommand\thefootnote{\arabic{footnote}}
  \gdef\@pdfauthor{\infoauthors}
  \gdef\@pdfsubject{Complex ~STM ~Content}
}
\ExplSyntaxOff
%% Fonts: Charter text (ancestor of Charis SIL used by the journal), Helvetica headings.
\RequirePackage[T1]{fontenc}
\RequirePackage{charter}
\RequirePackage[scaled=.92]{helvet}
\RequirePackage{textcomp}
\renewcommand{\ttdefault}{pcr}% Courier, Type 1 (T1 cmtt is a bitmap font without cm-super)
%% Geometry measured on a published article (595.3 x 793.7 pt page, text 37.6--558.3 pt)
\usepackage[paperwidth=210mm,paperheight=280mm,vmargin={20mm,20mm},
  hmargin={13.3mm,13.3mm},headsep=10pt,footskip=14pt]{geometry}
\setlength{\columnsep}{16pt}
%% Page styles: running head "A.M. Rivera et al. | journal", page number at the foot;
%% first page: grey journal banner (no publisher logo) and a preprint foot line.
\RequirePackage{lastpage}
\definecolor{emsgrey}{gray}{0.92}
\ExplSyntaxOn\cs_new:Npn\emsshortauthors{\__short_authors:}\ExplSyntaxOff
\renewcommand\ps@cas{%
  \renewcommand\@oddhead{\parbox{\textwidth}{\sffamily\footnotesize
    \emsshortauthors\hfill Environmental Modelling \& Software\\[-3pt]\rule{\textwidth}{0pt}}}%
  \let\@evenhead\@oddhead
  \renewcommand\@oddfoot{\hfill\sffamily\footnotesize\thepage\hfill}%
  \let\@evenfoot\@oddfoot}
\renewcommand\ps@first{%
  \renewcommand\@oddhead{\parbox{\textwidth}{\centering\sffamily\footnotesize
    Manuscript submitted to Environmental Modelling \& Software\\[-2pt]\rule{\textwidth}{0pt}}}%
  \let\@evenhead\@oddhead
  \renewcommand\@oddfoot{\parbox[t]{\textwidth}{\rule{\textwidth}{.2pt}\\[1pt]\sffamily\footnotesize
     Preprint submitted to Environmental Modelling \& Software\hfill \thepage}}%
  \let\@evenfoot\@oddfoot}
\pagestyle{cas}
\endinput
