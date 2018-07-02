nematus=../nematus

python $nematus/translate.py \
    --models models/model.npz-5000 \
    --input in.txt \
    --output out \
    #-k 5 \
    -v \
    #--n-best 5
    
    
