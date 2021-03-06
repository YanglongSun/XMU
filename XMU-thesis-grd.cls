%==================================================
%% XMU-thesis-grd.cls for XMU Thesis
%% modified by miao yongchun
%% version: 1.0
%% last update: Sept. 22th, 2020
%%==================================================

%% math packages -- conflict with xunicode
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
% 直立希腊字母字体
\RequirePackage{upgreek}

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{XMU-thesis-grd}
  [2020/09/22 v1.0 XMU-thesis-grd document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifXMU@master\XMU@masterfalse
\newif\ifXMU@doctor\XMU@doctorfalse
\newif\ifXMU@istwoside\XMU@istwosidefalse
\DeclareOption{twoside}{\XMU@istwosidetrue}
\DeclareOption{master}{\XMU@mastertrue}
\DeclareOption{doctor}{\XMU@doctortrue}

\ProcessOptions\relax
\ifXMU@istwoside
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi

\let\songti\relax
\let\kaishu\relax
\let\heiti\relax
\newCJKfontfamily\songti{SimSun}[AutoFakeBold]
\newCJKfontfamily\kaishu{KaiTi}[AutoFakeBold]
\newCJKfontfamily\heiti{SimHei}[AutoFakeBold]
%%
%% the setup of ctex package
%%
\def\contentsname{目\XMUspace 录}
\def\encontentsname{Contents}
\def\listfigurename{插\XMUspace 图}
\def\listtablename{表\XMUspace 格}

%%
%% 封面标题
%%
\def\XMU@label@major{专业名称：}
\def\XMU@label@title{论文题目}
\def\XMU@label@author{作~~~~者~~~~姓~~~~名}
\def\XMU@label@classification{学校编码：}
\def\XMU@label@confidential{密级}
\def\XMU@label@UDC{UDC\!分类号：}
\def\XMU@label@serialnumber{编号}
\def\XMU@label@studentnumber{学~~~~~~~~号：}
\def\XMU@label@thesis{学位论文}
\def\XMU@label@advisor{指导教师姓名：}
%\def\XMU@label@degree{申~~~~请~~~~学~~~~位}
\def\XMU@label@submitdate{论文提交日期：}
\def\XMU@label@defenddate{论文答辩日期：}
\def\XMU@label@grantdate{学位授予日期：}
\def\XMU@label@institute{学~~~~院~~~~名~~~~称}
\def\XMU@label@school{学~位~授~予~单~位}
\def\XMU@label@chairman{答辩委员会主席}
\def\XMU@label@confidentialdate{\hspace{26pt}年\hspace{26pt}月\hspace{26pt}日}
%%
%% 封面内容
%%

\def\XMU@value@classification{}
\def\XMU@value@confidential{}

\def\XMU@value@UDC{}
\def\XMU@value@serialnumber{}
\def\XMU@value@school{}
\def\XMU@value@degree{}
\def\XMU@value@title{~~~~~（论~文~题~目）~~~~~}
\def\XMU@value@entitle{ }
\def\XMU@value@vtitle{竖排论文题目}
\def\XMU@value@titlemark{\XMU@value@title}
\def\XMU@value@author{（作~者~姓~名）}
\def\XMU@value@advisor{（姓名、专业技术职务、学位）}
\def\XMU@value@advisorinstitute{（单位）}
\def\XMU@value@major{}
\def\XMU@value@studentnumber{} 
\def\XMU@value@submitdate{}
\def\XMU@value@defenddate{}
\def\XMU@value@grantdate{}
\def\XMU@value@institute{}
\def\XMU@value@chairman{}
\def\XMU@label@statement{}


%% 设置圆圈的格式 或使用\textcircled
\usepackage{tikz}
\usepackage{etoolbox}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}

%% 论文原创性声明
\def\XMU@label@original{厦门大学学位论文原创性声明}
\def\XMU@label@authorization{厦门大学学位论文著作权使用声明}
\def\XMU@label@authorsign{声明人~~（签名）：}
\def\XMU@label@Supervisorsign{指导教师（签名）：}
\def\XMU@label@originalDate{\hspace{30pt} 年\hspace{26pt}月\hspace{26pt}日}

\def\XMU@value@team{}
\def\XMU@value@fundteam{}
\def\XMU@value@lab{}

\def\XMU@label@originalcontent{\XMUspace\XMUspace 本人呈交的学位论文是本人在导师指导下，独立完成的研究成果。本人在论文写作中参考其他个人或集体已经发表的研究成果，均在文中以适当方式明确标明，并符合法律规范和《厦门大学研究生学术活动规范（试行）》。\par 另外，该学位论文为（\@ifundefined{XMUT@value@team}%
    {\parbox[t]{200pt}{\quad}}{\XMUT@value@team}）课题（组）的研究成果，获得（\@ifundefined{XMUT@value@fundteam}{\parbox[t]{120pt}{\quad}}%
    {\XMUT@value@fundteam}）课题（组）经费或实验室的资助，在（\@ifundefined{XMUT@value@lab}{\parbox[t]{120pt}{\quad}}%
    {\XMUT@value@lab}）实验室完成。（请在以上括号内填写课题或课题组负责人或实验室名称，未有此项声明内容的，可以不作特别声明。）。\par 本人声明该学位论文不存在剽窃、抄袭等学术不端行为，并愿意承担因学术不端行为所带来的一切后果和法律责任。\par }
\def\XMU@label@authorizationcontent{\XMUspace\XMUspace 本人同意厦门大学根据《中华人民共和国学位条例暂行实施办法》等规定保留和使用此学位论文，并向主管部门或其指定机构送交学位论文（包括纸质版和电子版），允许学位论文进入厦门大学图书馆及其数据库被查阅、借阅。本人同意厦门大学将学位论文加入全国博士、硕士学位论文共建单位数据库进行检索，将学位论文的标题和摘要汇编出版，采用影印、缩印或者其它方式合理复制学位论文。
\par 本学位论文属于：
\par （\parbox[t]{45pt}{\quad}）1.经厦门大学保密委员会审查核定的涉密学位论文，于{\XMU@label@confidentialdate}解密，解密后适用上述授权。
\par （\parbox[t]{45pt}{\quad}）2.不涉密，适用上述授权。
\par （请在以上相应括号内打``\ensuremath{\checkmark}''或填上相应内容。涉密学位论文应是已经厦门大学保密委员会审定过的学位论文，未经厦门大学保密委员会审定的学位论文均为公开学位论文。此声明栏不填写的，默认为公开学位论文，均适用上述授权。）\par 
}


%%
%% 英语封面标题
%%
\def\XMU@label@englishadvisor{Supervisor:}
\def\XMU@label@englishstatement{Submitted in total fulfilment
  of the requirements for the degree of \XMU@value@englishdegree \\
  in \XMU@value@englishmajor}
\def\XMU@label@englishauthor{Candidate Name:}
\def\XMU@label@englishadvisor{Faculty Mentor:}
\def\XMU@label@englishchairman{Chair, Thesis Committee:}
\def\XMU@label@englishinstitute{School or Department:}
\def\XMU@label@englishdegree{Degree Applied:}
\def\XMU@label@englishmajor{Major:}
\def\XMU@label@englishschool{Degree by:}
\def\XMU@label@englishdate{The Date of Defence:}


%%
%% 英语封面内容
%%

\def\XMU@value@englishauthor{(Author Name)}
\def\XMU@value@englishadvisor{(Supervisor Name)}
\def\XMU@value@englishinstitute{(Institute Name)}
\def\XMU@value@englishscholl{(XMU)}
\def\XMU@value@englishchair{(someone)}
\def\XMU@value@englishdate{}
\def\XMU@value@englishdegree{}
\def\XMU@value@englishmajor{}



\def\XMU@label@abstract{摘\XMUspace 要}
\def\XMU@label@englishabstract{Abstract}
\def\XMU@label@keywords{关键词：}
\def\XMU@label@englishkeywords{Key Words:~}
\def\XMU@label@conclusion{结\XMUspace 论}
\def\XMU@label@appendix{附\XMUspace 录}
\def\XMU@label@publications{攻读博士学位期间取得的学术成果}
\def\XMU@label@projects{攻读学位期间参与的项目}
\def\XMU@label@resume{作者简介}
\def\XMU@label@reference{参考文献}
\def\XMU@label@thanks{致\XMUspace 谢}
\def\XMU@value@templateversion{v1.0}
%%
%% label in the head 页眉页脚
%%
\def\XMU@label@headschoolname{厦门大学博士学位论文}

%% 当前模板的版本
\newcommand{\version}{\XMU@value@templateversion}

%%==============引用geometry 宏包设置纸张和页面========================
%设置版面:上3.5cm，下2.5cm，左2.7cm，右2.7cm，页眉2.5cm，页脚1.8cm，装订线0cm
\usepackage[%
paper=a4paper,%
top=3.0cm,% 上 3.5cm %
bottom=2.54cm,% 下 2.5cm %
left=2.7cm,% 左 2.7cm %
right=2.7cm,% 右 2.7cm %
headheight=2.0cm,% 页眉 2.5cm %
footskip=1.75cm% 页脚 1.8cm %
]{geometry} % 页面设置 %
%% =========================================================

\parskip 0.5ex plus 0.25ex minus 0.25ex
%% Command -- Clear Double Page
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%设置行距，大概为1.5
\RequirePackage{setspace}
\setstretch{1.523}

%%% 设置章节目格式
%% 设置章节格式, 小3号加重黑体居中，行距22磅，与正文或节标题的间距设定为段后间距1行。章序号与章名间空一格。
\ctexset{chapter={
      name = {第,章},
      number = {\arabic{chapter}},
      format = {\bfseries \heiti \centering \zihao{-3}},
      pagestyle = {XMU@headings},
      beforeskip = 16 bp,
      afterskip = 32 bp,
      fixskip = true,
  }
}
%% 设置一级章节格式
% 黑体四号加粗顶左，行距22磅，与上一节的间距为1行，与下面正文或节标题的段间间距为0.5行。序号与题目间空一格。

\ctexset{section={
  format={\raggedright \bfseries \heiti \zihao{4}},
  beforeskip = 28bp plus 1ex minus .2ex,
  afterskip = 24bp plus .2ex,
  fixskip = true,
  }
}

% 设置二级标题格式

% 黑体小四加粗顶左，行距22磅，与上一节的间距为1行，与下面正文或节标题的段间间距为0.5行。序号与题目间空一格。 

\ctexset{subsection={
   format = {\bfseries \heiti \raggedright \zihao{-4}},
   beforeskip =28bp plus 1ex minus .2ex,
   afterskip = 24bp plus .2ex,
   fixskip = true,
   }
}


% 设置三节标题格式

\ctexset{subsubsection={
      format={\heiti \raggedright \zihao{-4}},
      beforeskip=28bp plus 1ex minus .2ex,
      afterskip=24bp plus .2ex,
      fixskip=true,
  }
}


%% 设定目录格式。目录颜色更改黑色
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{eoc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\heiti \zihao{4}}
    {\bfseries\thecontentslabel\hspace{\ccwd}}{\bfseries}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2\ccwd]{\heiti \zihao{-4}}
    {\bfseries\thecontentslabel\hspace{\ccwd}}{\bfseries}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4\ccwd]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{figure}[0pt]{\songti\zihao{-4}}
    {\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
    {\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}


%% 选择编译
\RequirePackage{ifthen}

%% check pdfTeX mode
\RequirePackage{ifpdf}

%% fancyhdr 页眉页脚控制
\RequirePackage{fancyhdr}

% 空 页眉页脚
\fancypagestyle{XMU@empty}{%
  \fancyhf{}}

%======正文页眉页脚=================
\fancypagestyle{XMU@headings}{%
  \fancyhf{}
  \fancyfoot[C]{\songti\zihao{5} \thepage}
  \fancyhead[C]{\ifXMU@doctor\zihao{5}{\songti 厦门大学博士学位论文}
                \else\zihao{5}{\songti 厦门大学硕士学位论文}\fi}
  }

%==================================对于openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚。===================
\let\XMU@cleardoublepage\cleardoublepage
\newcommand{\XMU@clearemptydoublepage}{%
	\clearpage{\pagestyle{XMU@empty}\XMU@cleardoublepage}}
\let\cleardoublepage\XMU@clearemptydoublepage

 %================修该frontmatter 的页码为大写罗马格式，并调整页面风格===============
\renewcommand{\frontmatter}{
 \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{XMU@headings}
}
%=======================修改mainmatter 的页码为阿拉伯格式，并调整页面风格========================
\renewcommand{\mainmatter}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{XMU@headings}
}


%% 复杂表格
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}


%% 定义几个常用的数学常量符号
\newcommand{\me}{\mathrm{e}} %定义 对数常数e，虚数符号i,j以及微分算子d为直立体。
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}} 

\theoremstyle{plain}
  \newtheorem{algo}{算法~}[chapter]
  \newtheorem{thm}{定理~}[chapter]
  \newtheorem{lem}[thm]{引理~}
  \newtheorem{prop}[thm]{命题~}
  \newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
  \newtheorem{defn}{定义~}[chapter]
  \newtheorem{conj}{猜想~}[chapter]
  \newtheorem{exmp}{例~}[chapter]
  \newtheorem{rem}{注~}
  \newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

%% 英文字体使用 Times New Roman
\RequirePackage{xltxtra} % \XeTeX Logo
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}


%% graphics packages
\RequirePackage{graphicx}
%% 并列子图
\RequirePackage{subfigure}

\RequirePackage{wrapfig}
%%===========================设置图表标题选项==========================
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{-4}}
\captionsetup{
  font = {fontsize},
  labelsep = zhspace,
  labelfont = bf,
  textfont  = bf,
}
\captionsetup[table]{
  position = top,
  aboveskip = 6bp,
  belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
  position = bottom,
  aboveskip = 6bp,
  belowskip = 6bp,
}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
% ccaption -- bicaption
%\RequirePackage{ccaption}
%\captiondelim{\ }
%\captionnamefont{\songti\zihao{5}}
%\captiontitlefont{\songti\zihao{5}}


%% sort and compress citations
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}


% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% 定公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}

% 颜色宏包
\RequirePackage{xcolor}


% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% listings 源代码显示宏包
\RequirePackage{listings}
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle=\footnotesize, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头


%% hyperref package
\definecolor{navyblue}{RGB}{0,0,128} 
\RequirePackage{hyperref}
\hypersetup{
  bookmarksnumbered,%
  linktoc=all,
  colorlinks=true,
  citecolor=navyblue,
  filecolor=cyan,
  linkcolor=navyblue,
  linkbordercolor=navyblue,
  urlcolor=navyblue,
  plainpages=false,%
  pdfstartview=FitH
}

%% enumerate 列表环境间距调节
\usepackage{enumitem}
% \setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
% \setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
% \setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

%_  参考文献风格 added by wei.jianwen@gmail.com
\bibliographystyle{GBT7714-2005NLang}

%_ XMUspace
%\newcommand\XMUspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\newcommand{\XMUspace}[1][1]{\hspace{#1\ccwd}}

\def\XMU@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\XMUfiledate{#1}%
  \def\XMUfileversion{#2}%
  \def\XMUfileinfo{#3}}%
\expandafter\ifx\csname ver@XMUmaster-xetex.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_XMUmaster-xetex.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@XMUmaster-xetex.cls\endcsname}
\fi
\expandafter\XMU@getfileinfo\reserved@a\relax? ? \relax\relax
\def\XMU@underline[#1]#2{%
  \underline{\hbox to #1{\hfill#2\hfill}}}
\def\XMUunderline{\@ifnextchar[\XMU@underline\underline}


%%%%中文标题页的可用命令
\newcommand\classification[1]{\def\XMU@value@classification{#1}}
\newcommand\studentnumber[1]{\def\XMU@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\XMU@value@confidential{#1}}
\newcommand\UDC[1]{\def\XMU@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\XMU@value@serialnumber{#1}}
\newcommand\school[1]{\def\XMU@value@school{#1}}
\newcommand\degree[1]{\def\XMU@value@degree{#1}}
\renewcommand\title[2][\XMU@value@title]{%
  \def\XMU@value@title{#2}
  \def\XMU@value@titlemark{\MakeUppercase{#1}}}
  
\newcommand\entitle[1]{\def\XMU@value@entitle{#1}}  
\newcommand\vtitle[1]{\def\XMU@value@vtitle{#1}}
\renewcommand\author[1]{\def\XMU@value@author{#1}}
\newcommand\advisor[1]{\def\XMU@value@advisor{#1}}
\newcommand\advisorinstitute[1]{\def\XMU@value@advisorinstitute{#1}}
\newcommand\major[1]{\def\XMU@value@major{#1}}
\newcommand\submitdate[1]{\def\XMU@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\XMU@value@defenddate{#1}}
\newcommand\grantdate[1]{\def\XMU@value@grantdate{#1}}
\newcommand\institute[1]{\def\XMU@value@institute{#1}}
\newcommand\chairman[1]{\def\XMU@value@chairman{#1}}



%% 第一页和第二页
%_ “绘制”XMU中文标题页

\newcommand\makeInfo[1]%
 {
  \newpage
  \cleardoublepage
  \thispagestyle{empty}

%udc ltz 
{ %
  {\songti \zihao{-4} \noindent \bfseries  \XMU@label@classification \XMU@value@classification} \\
  {\songti \zihao{-4} \bfseries  \XMU@label@studentnumber  \XMU@value@studentnumber}
}
   \begin{center}
    \vskip \stretch{2}
    \includegraphics[width=4.82cm]{figures/xmu-zi-3d-600dpi}\\
    \vskip \stretch{2} 
     
    {\ifXMU@doctor\zihao{2}{\songti \ziju{1} \bfseries 博士学位论文}
                \else\zihao{2}{\songti \ziju{1} \bfseries 硕士学位论文}\fi
    }
    \vskip \stretch{2} 
    {\heiti\zihao{-2} \bfseries \XMU@value@title}
    \vskip \stretch{1} 
    {\zihao{3}\textbf{\XMU@value@entitle}}
    \vskip \stretch{3} 
    {\kaishu\zihao{2} \bfseries \XMU@value@author}
    
    \vskip \stretch{1}
    
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}

	%黑体 小三
    {\kaishu\zihao{-3}
     \begin{tabular}{l p{3mm} c}
     \XMU@label@advisor & &  \@ifundefined{XMU@value@advisor}{\parbox[t]{180pt}{\quad}}{\XMU@value@advisor}
     \\
     {\ziju{0.67} \XMU@label@major} & &   \@ifundefined{XMU@value@major}{\parbox[t]{180pt}{\quad}}{\XMU@value@major}
     \\
     \XMU@label@submitdate & &  \@ifundefined{XMU@value@submitdate}{\parbox[t]{180pt}{\quad}}{\XMU@value@submitdate}
     \\
     \XMU@label@defenddate & &  \@ifundefined{XMU@value@defenddate}{\parbox[t]{180pt}{\quad}} {\XMU@value@defenddate}
     \\
     \XMU@label@grantdate & & \@ifundefined{XMU@value@grantdate}{\parbox[t]{180pt}{\quad}}{\XMU@value@grantdate}  
    \end{tabular}}
    
    \vskip \stretch{5}
    {\songti\zihao{4} \bfseries \XMU@value@submitdate}
  \end{center}

  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}


% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \pdfbookmark[0]{原创声明}{statement}
  \thispagestyle{empty}
  \begin{center}
  {\heiti\zihao{-2} \XMU@label@original}
  \end{center}
  \vskip 15pt
  {\songti\zihao{4}\XMU@label@originalcontent} 
  \vskip 40pt
  
  \hfill{\songti\zihao{4}\XMU@label@authorsign} \hspace*{4cm} 

  \hfill{\songti\zihao{4}\XMU@label@Supervisorsign} \hspace*{4cm} \\
  \vskip 10pt
  \hfill {\songti\zihao{4}\XMU@label@originalDate} \hspace*{4.2cm}
  
   
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

\newcommand\makeDeclareCopyright{%
 \cleardoublepage
 \pdfbookmark[0]{版权声明}{statement}
 \thispagestyle{empty}
  \begin{center}
  {\heiti\zihao{-2} \XMU@label@authorization}
  \end{center}
  \vskip 15pt
  {\zihao{4} \XMU@label@authorizationcontent}
  \vskip 40pt
   

  \hfill{\songti\zihao{4}\XMU@label@authorsign} \hspace*{4cm} \\
  \vskip 10pt
  \hfill {\songti\zihao{4}\XMU@label@originalDate} \hspace*{4.2cm}
   
   
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi

}


% 页眉页脚
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\songti \zihao{5} \XMU@label@headschoolname}  % 奇数页左页眉
\fancyfoot[C]{\songti \zihao{5} {\thepage}}      % 页脚


\fancypagestyle{plain}{% 设置开章页页眉页脚风格(只有页码作为页脚)
  \fancyhf{}%
  \fancyfoot[C]{\songti \zihao{5} \XMU@label@headschoolname}
  \fancyfoot[C]{\songti \zihao{5} ~---~{\thepage}~---~} %%首页页脚格式
}

%% 用于英文目录, list it in eoc
\newcommand\echapter[1]{\addcontentsline{eoc}{chapter}{\protect\numberline{\thechapter}#1}}
\newcommand\esection[1]{\addcontentsline{eoc}{section}{\protect\numberline{\thesection}#1}}
\newcommand\esubsection[1]{\addcontentsline{eoc}{subsection}{\protect\numberline{\thesubsection}#1}}
\newcommand\esubsubsection[1]{\addcontentsline{eoc}{subsubsection}{\protect\numberline{\thesubsubsection}#1}}

 % 中文摘要
 \newenvironment{abstract}
 {
  \cleardoublepage
  \chapter{\XMU@label@abstract}
 }
 {}
%下一页从偶数页开始
 \newcommand\beginatevenpage{
 \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
 }
 % 中文关键词
 \newcommand\keywords[1]{%
   \vspace{2ex}\noindent{\bfseries \XMU@label@keywords} #1}

 % 英文摘要
 \newenvironment{englishabstract}
 {
  \clearpage
  \chapter*{\XMU@label@englishabstract}
   \@mkboth{\MakeUppercase\XMU@label@englishabstract}{\MakeUppercase\XMU@label@englishabstract}%
   \addcontentsline{eoc}{chapter}{\XMU@label@englishabstract}
 }
 {}

 % 英文摘要
 \newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \XMU@label@englishkeywords} #1}

%% 中文目录
\renewcommand\tableofcontents{%
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi
  \chapter*{\contentsname}%目录里显示“目录”，否则\chapter*
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \pdfbookmark[0]{目录}{XMUtoc}
  \@starttoc{toc}%
  \chapter*{\encontentsname}%英文目录里显示“英文目录”，否则\chapter*
  \@mkboth{\MakeUppercase\encontentsname}{\MakeUppercase\encontentsname}%
  \pdfbookmark[0]{英文目录}{XMUeoc}
  \@starttoc{eoc}%
  \if@restonecol\twocolumn\fi
}

    
%_ 参考文献环境
\renewenvironment{thebibliography}[1]
     {\zihao{5}
      \chapter*{\bibname}
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \addcontentsline{toc}{chapter}{参考文献}
      \addcontentsline{eoc}{chapter}{References}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \setlength{\parsep}{1mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


\newenvironment{publications}[1]
     {\chapter{\XMU@label@publications}%
      \@mkboth{\MakeUppercase\XMU@label@publications}
              {\MakeUppercase\XMU@label@publications}%
      \addcontentsline{eoc}{chapter}{List of Publications}     
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \setlength{\parsep}{1mm}
            \setlength{\labelsep}{0.5em}
            \setlength{\itemsep}{0.05pc}
            \setlength{\listparindent}{0in}
            \setlength{\itemindent}{0in}
            \setlength{\rightmargin}{0in}
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}


\newenvironment{projects}[1]
     {\chapter{\XMU@label@projects}%
      \@mkboth{\MakeUppercase\XMU@label@projects}
              {\MakeUppercase\XMU@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

    \newenvironment{resume}
  {\chapter{\XMU@label@resume}}
  {}

\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
   {\endlist}

\newenvironment{resumeli}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
   {\endlist}

\renewenvironment{thanks}
  {\chapter{\XMU@label@thanks}
   \@mkboth{\MakeUppercase\XMU@label@thanks}{\MakeUppercase\XMU@label@thanks}%
    \addcontentsline{eoc}{chapter}{Thanks} } 
  {}
  
\newenvironment{symbolnote}
  {\chapter{\XMU@label@symbolnote}
  \fangsong}
  {}
  


  %%%============================术语=====================
  \newcommand{\XMU@denotation@name}{主要符号对照表}
  \newenvironment{denotation}[1][2.5cm]{
      \chapter{\XMU@denotation@name} % no tocline
      \noindent\begin{list}{}%
      {\vskip-30bp\zihao{-4}
       \renewcommand\makelabel[1]{##1\hfil}
       \setlength{\labelwidth}{#1} % 标签盒子宽度
       \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
       \setlength{\itemindent}{0cm} % 标签缩进量
       \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
       \setlength{\rightmargin}{0cm}
       \setlength{\parsep}{0cm} % 段落间距
       \setlength{\itemsep}{0cm} % 标签间距
      \setlength{\listparindent}{0cm} % 段落缩进量
      \setlength{\topsep}{0pt} % 标签与上文的间距
     }}{\end{list}}
%====增加化学、国际单位宏包
     \RequirePackage[version=4]{mhchem}
     \RequirePackage{siunitx}
\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)


\endinput
%%
%% End of file `XMUmaster-xetex.cls'.
