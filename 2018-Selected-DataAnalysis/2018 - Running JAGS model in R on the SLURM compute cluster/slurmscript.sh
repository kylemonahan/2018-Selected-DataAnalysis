#!/bin/bash
#SBATCH -J kbbms
#SBATCH --time=4-0
#SBATCH -p batch
#SBATCH	-n 10
#SBATCH --mem=60G
#SBATCH --output=kbbms.%j.out
#SBATCH --error=kbbms.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=username

module load R
module swap gcc/5.3.0 gcc/7.3.0
#Put your command to run R script here.
Rscript kbbms_9site5years.R

