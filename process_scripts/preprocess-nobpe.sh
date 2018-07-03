#!/bin/bash

P=$1

# source language (example: fr)
S=$2
# target language (example: en)
T=$3

# tokenize
perl tokenizer.perl -threads 8 -l $S < ${P}.${S} > ${P}.${S}.tok
perl tokenizer.perl -threads 8 -l $T < ${P}.${T} > ${P}.${T}.tok

# build dictionary
python build_dictionary.py ${P}.${S}.tok
python build_dictionary.py ${P}.${T}.tok

