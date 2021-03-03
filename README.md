# Setup LaTeX in Windows + WSL (Ubuntu)
Mini-framework used as starting point for document creation with LaTeX typesetting system. Contains an example of calling an external program from within a `.tex` document, retrieving it’s standard output and compiling the resulting document to `pdf`. More specifically `dynamic-syntax-highlight.tex` calls the python program `syntax_highlight.py` - a simple code parser - that returns formatted latex text with highlighting theme applied. Examples can be found in `built` folder.

### Install pdflatex (file.tex -> file.pdf)
```bash
sudo apt install texlive-latex-base
```
### Also install the recommended and extra fonts to avoid running into the error [1], when trying to use pdflatex on latex files with more fonts.
```bash
sudo apt install texlive-fonts-recommended
sudo apt install texlive-fonts-extra
```
### For use custom fonts:
```bash
sudo apt install texlive-fonts-extra
```
### Extra packages
```bash
sudo apt install texlive-latex-extra
``` 
## Convert latex file to pdf
```bash
pdflatex file.tex
```
## Create and edit LaTeX using VSCode
### install required extensions:
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)

### Create project settings
```bash
mkdir .vscode
echo "
{
  "code-runner.executorMapByFileExtension": {
    ".tex": "pdflatex -interaction=nonstopmode $fileName"
    },  
    "code-runner.runInTerminal": true,
    "latex-workshop.latex.autoBuild.run": "never",
}
" > .vscode/settings.json
```
### Edit .tex file and compile it with Ctrl+Alt+N

## Watch pdf on Windows side with SumatraPDF
https://www.sumatrapdfreader.org/free-pdf-reader.html

### [Install and use custom fonts](docs/custom-fonts.md)
### [Execute external program from `tex` document](docs/execute-external-program.md)
### [Additional documentation](docs/additional-documentation.md)
