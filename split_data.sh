head -205000 ../europarl-v7.fr-en.en.f > europarl-v7.fr-en.en.tmp
head -200000 europarl-v7.fr-en.en.tmp > europarl-v7.fr-en.en.analysis
tail -5000 europarl-v7.fr-en.en.tmp > europarl-v7.fr-en.en.val
tail -1030672 ../europarl-v7.fr-en.en.f > europarl-v7.fr-en.en.train
rm europarl-v7.fr-en.en.tmp

head -205000 ../europarl-v7.fr-en.fr.f > europarl-v7.fr-en.fr.tmp
head -200000 europarl-v7.fr-en.fr.tmp > europarl-v7.fr-en.fr.analysis
tail -5000 europarl-v7.fr-en.fr.tmp > europarl-v7.fr-en.fr.val
tail -1030672 ../europarl-v7.fr-en.fr.f > europarl-v7.fr-en.fr.train
rm europarl-v7.fr-en.fr.tmp
