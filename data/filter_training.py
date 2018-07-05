import sys
import os
import collections

PREPROC_DIR = '/iesl/canvas/jwei/nmt_hpsg2/data/parse'
db = dict()
for fn in sorted(os.listdir(PREPROC_DIR)):
    if fn.startswith('.'):
        continue

    print('Reading in %s \r' % fn, end='')
    h = open(os.path.join(PREPROC_DIR, fn), 'rt')

    for line in h:
        line = line.strip().split('\t')
        db[line[0]] = line



def query(sent):
    return db.get(sent, ['NA']*3)


if __name__ == '__main__':
    MODE = 'training'

    if MODE == 'training':
        en = open('/iesl/canvas/jwei/3nmt_hpsg/data/europarl/nb/europarl-v7.fr-en.en.nb', 'rt')
        fr = open('/iesl/canvas/jwei/3nmt_hpsg/data/europarl/nb/europarl-v7.fr-en.fr.nb', 'rt')

        _en = open('./europarl-v7.fr-en.en.f', 'wt')
        _fr = open('./europarl-v7.fr-en.fr.f', 'wt')

        for eng, fren in zip(en, fr):
            row = query(eng.strip())

            if row[1] != 'NA':
                _en.write('%s\n' % row[2].strip())
                _fr.write('%s\n' % fren.strip())
