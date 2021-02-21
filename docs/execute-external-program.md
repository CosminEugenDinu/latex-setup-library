## Execute external program from within `main.tex` document
[Bashful](https://www.ctan.org/tex-archive/macros/latex/contrib/bashful) should do it.
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
