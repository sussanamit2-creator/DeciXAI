% =========================================================
% template.cls – תבנית העיצוב של הדוח המכין "מצפן ספקים"
% קובץ זה מחזיק את כל החלטות העיצוב (גופנים, שוליים, כיוון, טבלאות, איורים).
% התוכן עצמו נמצא בקובצי ה-.tex של הפרקים; main.tex רק מחבר ביניהם.
% קומפילציה: LuaLaTeX (MiKTeX), פעמיים-שלוש לתוכן העניינים.
%
% גרסה 1.0 (25.11.2026)
% יומן שינויים:
%   1.0 – הפרדת העיצוב מ-main.tex לקובץ תבנית נפרד, בלי שינוי במראה.
%
% פקודות שהתבנית מגדירה:
%   \en{...}          טקסט באנגלית בתוך עברית (מונע היפוך אותיות)
%   \latinfallback    גופן לאותיות לטיניות עם סימנים שאין ב-David (למשל č)
% =========================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template}[2026/11/25 v1.0 Supplier Compass preparatory report]
\LoadClass[12pt,a4paper]{report}

% ---------- שוליים ----------
\RequirePackage[margin=2.5cm,bindingoffset=0.5cm]{geometry}

% ---------- שפות וגופנים ----------
\RequirePackage[bidi=basic]{babel}
\babelprovide[main,import]{hebrew}
\babelprovide[import]{english}
\babelfont{rm}{David}
\babelfont{sf}{Arial}
% גופן חלופי לאותיות לטיניות עם סימנים דיאקריטיים שאין ב-David (למשל č)
\newfontfamily\latinfallback{Times New Roman}
% טקסט באנגלית בתוך עברית (מונע היפוך אותיות)
\newcommand{\en}[1]{\foreignlanguage{english}{#1}}

% ---------- ריווח ופסקאות ----------
\RequirePackage{setspace}
\onehalfspacing
% פסקאות מתחילות בתחילת השורה, עם רווח קטן בין פסקאות
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.6em}

% ---------- מספור עמודים ----------
% מספר העמוד בתחתית תמיד משמאל לימין, כדי שלא יתהפך (למשל 16 → 61)
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}\fancyfoot[C]{\hbox{\textdir TLT\thepage}}}
\pagestyle{plain}

% ---------- טבלאות, נוסחאות וקישורים ----------
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{amsmath}
\RequirePackage{url}
\def\UrlBreaks{\do\/\do\-\do\_\do\.\do\=\do\?\do\&}

% ---------- איורים (TikZ ו-pgfplots) ----------
\RequirePackage{tikz}
\usetikzlibrary{arrows.meta,positioning,shapes.geometric,calc}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
% כל תרשים TikZ רץ בכיוון שמאל-לימין; אחרת בעברית הצירים והטקסטים מתהפכים
\RequirePackage{etoolbox}
\BeforeBeginEnvironment{tikzpicture}{\begin{otherlanguage}{english}}
\AfterEndEnvironment{tikzpicture}{\end{otherlanguage}}
% טבלאות בריווח צפוף יותר מגוף הטקסט (1.1 במקום 1.5)
\AtBeginEnvironment{longtable}{\setstretch{1.1}}
% איורים גדולים יכולים לחלוק עמוד עם טקסט, במקום לעבור לבד לעמוד ריק למחצה
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.7}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.8}

% hyperref נטען אחרון
\RequirePackage[hidelinks]{hyperref}

\endinput
