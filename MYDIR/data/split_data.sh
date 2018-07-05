P=$1
head -205000 ${P}> ${P}.ref
pref=${P}.ref
tail -1032536 ${P} > ${P}.train
echo done with train
head -200000 ${pref} > ${P}.dev
tail -5000 ${pref} > ${P}.val
rm ${pref}

