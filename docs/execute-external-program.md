## Execute external program from within `main.tex` document
### Method 1 - use [Bashful](https://www.ctan.org/tex-archive/macros/latex/contrib/bashful)
LaTeX document `main.tex`:
```latex
\documentclass[12pt]{article}
\usepackage[a5paper,margin=5mm,bottom=15mm]{geometry}
\usepackage{bashful}

\begin{document}

The files in current directory are:

\bash[stdout]
ls 
\END

That 's it !

\end{document}
```
Compile it with `shell-escape` flag set to TRUE (`xelatex` or `pdflatex`):
```bash
xelatex -shell-escape main.tex
```
### Method 2 - use `\input{|../path/to/executable arg1 arg2}`
You could define a new command that takes tow parameters, calls an external program with those parameters and retrieve it's output:
```latex
% command \external takes tow parameters
\newcommand{\external}[2]{
  % input require compile flag -shell-escape
  \input{|../lib/demo-external-program/demo_bash_executable #1 #2}
}
```
In order to use it, call it like this:
```latex
\external{param1}{param2}
```
