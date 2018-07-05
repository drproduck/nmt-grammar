#!/bin/bash

p=src/
# source language (example: fr)
S=fr
# target language (example: en)
T=en

# tokenize
perl tokenizer.perl -threads 128 -time -lines 20000 $S < ${p}${S} > ${p}${S}.tok
perl tokenizer.perl -threads 128 -time -lines 20000 $T < ${p}${T} > ${p}${T}.tok

# fix underline fault in tokenized english (e.g generic_proper_en -> generic _ proper _ en)
echo fix underline fault in en.tok
./underline_fix.sh ${p}${T}.tok

# build dictionary
python build_dictionary.py ${p}${S}.tok
python build_dictionary.py ${p}${T}.tok.fix

