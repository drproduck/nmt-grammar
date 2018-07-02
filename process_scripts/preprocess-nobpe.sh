#!/bin/bash

P=$1

# source language (example: fr)
S=$2
# target language (example: en)
T=$3

# path to nematus/data
P1=$4

# tokenize
perl $P1/tokenizer.perl -threads 5 -l $S < ${P}.${S} > ${P}.${S}.tok
perl $P1/tokenizer.perl -threads 5 -l $T < ${P}.${T} > ${P}.${T}.tok

# build dictionary
python $P1/build_dictionary.py ${P}.${S}.tok
python $P1/build_dictionary.py ${P}.${T}.tok

