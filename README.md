# Setup LaTeX in Windows + WSL (Ubuntu)
Mini-framework used as starting point for document creation with LaTeX typesetting system. Contains an example of calling an external program from within a `.tex` document, retrieving it’s standard output and compiling the resulting document to `pdf`. More specifically `dynamic-syntax-highlight.tex` calls the python program `syntax_highlight.py` - a simple code parser - that returns formatted latex text with highlighting theme applied (i.e. write documentation in LaTeX that require code snippets). Examples can be found in `built` folder.

### Windows Prerequisites
Using [Chocolatey](https://chocolatey.org/install), open `PowerShell` with elevated permissions (right click -> `Run as administrator`).
- Edit `.tex` source files with [VSCode](https://code.visualstudio.com/docs/remote/wsl):
```ps
choco install vscode -y
```
- Watch real time compiled pdf's with [SumatraPDF](https://www.sumatrapdfreader.org/free-pdf-reader):
```ps
choco install sumatrapdf -y
```
Open another `PowerShell` and install required WSL-VSCode [Remote Development Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack):
```ps
code --install-extension ms-vscode-remote.remote-wsl
```

### WSL-Ubuntu Prerequisites
Install a TeX compiler program `pdflatex` or better `xelatex`. Read about differences between [LaTeX-pdfTeX-XeTeX-LuaTeX](https://www.overleaf.com/learn/latex/Articles/The_TeX_family_tree:_LaTeX,_pdfTeX,_XeTeX,_LuaTeX_and_ConTeXt) .
```bash
sudo apt update -y && sudo apt install texlive-xetex -y
```
Install recommended VSCode extensions:
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
```bash
code --install-extension james-yu.latex-workshop
```
- [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
```bash
code --install-extension formulahendry.code-runner
```
### Clone this repository
```bash
git clone https://github.com/CosminEugenDinu/latex-setup-library.git
```
### Go to project root and open VSCode
```bash
cd latex-setup-library && code .
```

### Create and edit `.tex` files in `src` folder and compile with `Ctrl+Alt+N`

### Documentation:
- [Install and use custom fonts](docs/custom-fonts.md)
- [Execute external program from `tex` document](docs/execute-external-program.md)
- [Additional documentation](docs/additional-documentation.md)
