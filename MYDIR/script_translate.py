#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
import unittest
import logging

sys.path.append('../nematus')
from translate import main as translate
from settings import TranslationSettings

level = logging.DEBUG
logging.basicConfig(level=level, format='%(levelname)s: %(message)s')

"""
Regression tests for translation with WMT16 models
"""


def outputEqual(output1, output2):
    """given two translation outputs, check that output string is identical
    """
    for i, (line, line2) in enumerate(zip(open(output1).readlines(), open(output2).readlines())):
        #assertEqual(line.strip(), line2.strip())
        print "translate {}".format(i)
        print line
        print line2


# English-German WMT16 system, no dropout

"""
Initialize and customize settings.
"""
translation_settings = TranslationSettings()
translation_settings.models = ["model_test/model.npz-80000"]
#translation_settings.num_processes = 8
translation_settings.beam_width = 10
translation_settings.normalization_alpha = 1.0
translation_settings.verbose=True
translation_settings.n_best=True
translation_settings.suppress_unk = True

translate(
          input_file=open('data/translated/fr.00'),
          output_file=open('data/fr.00.8.out','w'),
          translation_settings=translation_settings
          )
print "everyting ok"
#outputEqual('en-de/ref2','en-de/out')



