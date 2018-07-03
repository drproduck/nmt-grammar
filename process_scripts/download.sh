path=$1
cur=$(pwd)
cd $path
wget http://www.statmt.org/europarl/v7/fr-en.tgz -O corpus.tgz
tar -xvf corpus.tgz
cd $cur

