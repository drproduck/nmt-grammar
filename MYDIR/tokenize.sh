P=$1
S=$2
perl ../process_scripts/tokenizer.perl -threads 8 -l $S < ${P}.${S} > ${P}.${S}.tok


