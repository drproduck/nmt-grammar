#!/bin/bash
#SBATCH --job-name=nematus_train
#SBATCH --ntasks=1
#SBATCH --time=72:00:00
#SBATCH --partition=gpu
#SBATCH --output=log
#SBATCH --gres=gpu:GEFORCE:1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8GB


module load cudnn/7.0-cuda_9.0 
source activate nematus
srun --gres=gpu:1 train.sh
