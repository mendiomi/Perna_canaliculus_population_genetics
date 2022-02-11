#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=64G
#SBATCH --partition=parallel
#SBATCH --time=10-00:00
#SBATCH --job-name=pcan_opt
#SBATCH -o /nfs/scratch2/mendiomi/01_pcanaliculus/03_optimization/m_optimization.out
#SBATCH -e /nfs/scratch2/mendiomi/01_pcanaliculus/03_optimization/m_optimization.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=michaeljohn.mendiola@vuw.ac.nz

module load stacks/2.2

IN=/nfs/scratch2/mendiomi/01_pcanaliculus/02_clean/01_pcanaliculus_1349
OUT=/nfs/scratch2/mendiomi/01_pcanaliculus/03_optimization
POPMAP=/nfs/home/mendiomi/00_scripts

#mkdir -p $OUT/m{1..10}

# running m for 1 to 10

for i in {1..10}; 
do 
denovo_map.pl --samples $IN --popmap $POPMAP/popmap_optimization.txt -o $OUT/m$i -m $i -M 2 -n 2 -T 24; 
done


