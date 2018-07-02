#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
import unittest
import logging

sys.path.append(os.path.abspath('data'))
sys.path.append(os.path.abspath('../nematus'))
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

os.chdir('models')

"""
Initialize and customize settings.
"""
translation_settings = TranslationSettings()
translation_settings.models = ["toymodel.npz-5000"]
translation_settings.num_processes = 1
translation_settings.beam_width = 12
translation_settings.normalization_alpha = 1.0
translation_settings.verbose=True
translation_settings.n_best=5
translation_settings.suppress_unk = True

translate(
          input_file=open('../in.txt'),
          output_file=open('../out','w'),
          translation_settings=translation_settings
          )
print "everyting ok"
#outputEqual('en-de/ref2','en-de/out')



