#!/bin/bash

# warning: this test is useful to check if training fails, and what speed you can achieve
# the toy datasets are too small to obtain useful translation results,
# and hyperparameters are chosen for speed, not for quality.
# For a setup that preprocesses and trains a larger data set,
# check https://github.com/rsennrich/wmt16-scripts/tree/master/sample

CUDA_VISIBLE_DEVICES=3
../nematus/nmt.py \
  --model models2/toymodel.npz \
  --datasets data/corpus.fr.tok data/corpus.en.tok \
  --dictionaries data/corpus.fr.tok.json data/corpus.en.tok.json \
  --dim_word 500 \
  --dim 1024 \
  --maxlen 50 \
  --source_vocab_sizes 30000 \
  --target_vocab_size 30000 \
  --optimizer adam \
  --learning_rate 0.0001 \
  --batch_size 80 \
  --no_shuffle \
  --dispFreq 500 \
  --finish_after 20000 \
  --saveFreq 10000 \
  --dropout_embedding 0.2 \
  --dropout_hidden 0.1 \
  --dropout_source 0.1 \
  --dropout_target 0.1 \
  --use_layer_norm \
  --enc_depth 2\
  --dec_depth 2\
  --tie_decoder_embeddings
