#!/bin/bash

../nematus/nmt.py \
  --model models/model.npz \
  --datasets ../data/src/fr.tok.train ../data/src/en.tok.fix.train \
  --dictionaries ../data/src/fr.tok.json ../data/src/en.tok.fix.json \
  --valid_source_dataset ../data/src/fr.tok.val \
  --valid_target_dataset ../data/src/en.tok.fix.val \
  --valid_batch_size 80 \
  --validFreq 5000 \
  --dim_word 512 \
  --dim 1024 \
  --maxlen 50 \
  --source_vocab_sizes 40000 \
  --optimizer adam \
  --learning_rate 0.0001 \
  --batch_size 80 \
  --dispFreq 100 \
  --finish_after 100000 \
  --saveFreq 10000 \
  --dropout_embedding 0.4 \
  --dropout_hidden 0.3 \
  --dropout_source 0.3 \
  --dropout_target 0.3 \
  --use_layer_norm \
  --enc_depth 2\
  --dec_depth 2\
  --tie_decoder_embeddings
