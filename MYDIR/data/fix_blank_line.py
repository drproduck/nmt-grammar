import os
for f in os.listdir('.'):
    print(f)
files =  [f for f in os.listdir('.') if f.endswith(('train','dev','val'))]
for f in files:
    print(os.path.abspath(f))

train=[f for f in files if f.endswith('.train')]
dev=[f for f in files if f.endswith('.dev')]
val=[f for f in files if f.endswith('.val')]

for f in dev:
    print(f)

x1=open(os.path.abspath('../../../data/europarl/europarl-v7.fr-en.fr')).readlines()
x2=open(os.path.abspath('../../../data/europarl/europarl-v7.fr-en.en')).readlines()
#x2=open(os.path.abspath('europarl.fr.tok')).readlines()
#x2=open(os.path.abspath('europarl.fr.tok')).readlines()

print(len(x1))
assert(len(x1) == len(x2))
n_blank = 0
n_miss = 0
i = 0
while i < len(x1):
    if x1[i] == '\n' and x2[i] == '\n':
        del x1[i]
        del x2[i]
        print('trivial blank lines')
        n_blank += 1
    elif x1[i] != '\n' and x2[i] != '\n':
        i += 1
    else:
        print(x1[i])
        print(x2[i])
        print('lines are different! Delete this line...')
        del x1[i]
        del x2[i]
        n_miss += 1

print('num blank ',n_blank)
print('num miss ',n_miss)
print('num lines left ',len(x1))
assert(len(x1) == len(x2))

print('writing lines back to file')
open('europarl.en.no.blank','w').writelines(x1)
open('europarl.fr.no.blank','w').writelines(x2)

import random
sample = random.choices(range(1000000), k=100)
for i in sample:
    print(x1[i])
    print(x2[i])
    print()


