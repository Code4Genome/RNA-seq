#!/bin/bash
# LOAD MODULES HERE IF REQUIRED
ml STAR/2.7.3a
# START THE APPLICATION
STAR --runThreadN 2 --runMode genomeGenerate --genomeDir /scratch/tmp/c/RNA/index/ --genomeFastaFiles Homo_sapiens.GRCh38.dna.primary_assembly.fa --sjdbGTFfile Homo_sapiens.GRCh38.109.gtf --sjdbOverhang 99
