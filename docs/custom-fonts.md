# Install and use custom fonts
Download font-family (all fonts must be .ttf).

Install them in `/usr/share/fonts` or `$HOME/.local/share/fonts`
```bash
cp -v font-family/* ~/.local/share/fonts
```
Clear and regenerate your font cache:
```bash
fc-cache -f -v
```
Verify the installation:
```bash
fc-list | grep -i 'fontname'
```
## Install [xelatex](https://en.wikipedia.org/wiki/XeTeX) typesetting engine (or `lualatex`)
```bash
sudo apt update && sudo apt install texlive-xetex
``` 
## Example.tex
```latex
\documentclass[12pt]{article}
\usepackage[a5paper,margin=5mm,bottom=15mm]{geometry}
\usepackage{fontspec}
\setmainfont{Roboto}
\begin{document}

\title{Title}
\author{Author}
\date{\today}
\maketitle
% Prevent showing page number on this page
\thispagestyle{empty}

Content on the first page

\begin{sloppypar}
\newpage

Some document content.

\end{sloppypar}
\end{document}
```
## Compile Example.tex to pdf
```bash
xelatex Example.tex
```
