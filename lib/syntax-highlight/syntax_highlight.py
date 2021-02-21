#!/usr/bin/env python3
import os, sys, re
import time
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE,SIG_DFL)
from theme import black_metal
import lang_definition


def textbf(txt):
    return r'\textbf{%s}' % txt
def flushleft(txt):
    return r'\begin{flushleft}%s\end{flushleft}' % txt
def verb(txt):
    return r'\verb|%s|' % txt
def verbatim(txt):
    return r'\begin{verbatim}%s\end{verbatim}' % txt


latex_currfilepath = ''
identifier = ''
if len(sys.argv) == 3:
    identifier = sys.argv[1]
    latex_currfilepath = sys.argv[2]
elif len(sys.argv) == 2:
    latex_currfilepath = sys.argv[1]
else:
    raise Exception('Invalid number of arguments.')
    
    
# print(verbatim('len(sys.argv) is: %s\n' % len(sys.argv)))
# print(verbatim('latex\_currfilepath: %s\n' % latex_currfilepath))
# print(verbatim('identifier: %s\n' % identifier))
# print('---------------------\n')


def get_text(latex_currfilepath, identifier):
    with open(latex_currfilepath, 'r') as f:
        lines = f.readlines()
    startline = False
    startline_re = re.compile(r'.+%s' % identifier)
    endline_re = re.compile(r' *}{}\n')
    characters = [] 
    for line in lines:
        if not startline and re.match(startline_re, line):
            startline = True
            continue
        if not startline: continue
        if re.match(endline_re, line): break
        for character in line:
            characters.append(character)

    return ''.join(characters) 

def _get_definition(language, lang_definition):
    if language == 'py': return lang_definition.py
    if language == 'js': return lang_definition.js

def _get_till_end(text, from_i, end_conditions):
    word = ''
    re_ends = [re.compile('%s$'%cond) for cond in end_conditions]
    for i, character in enumerate(text):
        word += character
        for re_end in re_ends:
            print(re_end)
            if re.match(re_end, word):
                return word, i
    return text[from_i], from_i+1

def get_words(text, language, lang_definition):
    definition = _get_definition(language, lang_definition)
    words = []
    tmp_word = ''
    curr_i = 0
    while curr_i < len(text):
        character = text[curr_i]
        tmp_word += character
        next_i = curr_i + 1
        next_character = text[next_i] if next_i < len(text) else ''
        if tmp_word in definition:
            typ = definition.get(tmp_word)['typ']
            end_conditions = definition.get(tmp_word)['end']
            if end_conditions == '':
                words.append((tmp_word, typ))
                tmp_word = ''
            if next_character in end_conditions:
                words.append((tmp_word, typ))
                tmp_word = ''
        elif next_character in definition:
            words.append((tmp_word, 'unknown'))
            tmp_word = ''
        curr_i += 1
            
    # print(words)
    return words


def highlight(words, language, theme):
    if language == 'py': lang_theme = theme.py
    if language == 'js': lang_theme = theme.js

    highlighted_words = []
    for word, typ in words:
        latex_escaped = [] 
        for char in word:
            latex_escaped.append(theme.latex_escape.get(char, char))
        highlighted_words.append(lang_theme[typ] % ''.join(latex_escaped))
    # print(highlighted_words)
    return ''.join(highlighted_words)

codetext = get_text(latex_currfilepath, identifier) 
words = get_words(codetext, 'py', lang_definition)
highlighted_words = highlight(words, 'py', black_metal)

print(flushleft(highlighted_words))
# print(highlighted_words, file=sys.stderr)
