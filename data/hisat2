#!/bin/bash
# LOAD MODULES HERE IF REQUIRED
ml HISAT2/2.2.1
# START THE APPLICATION
hisat2 --dta -t -x Genome/hisat2_index/genome -1 B/A/13_12_R1_001.fastq.gz -2 B/A/13_12_R2_001.fastq.gz -S SAM_files/135.sam --rna-strandness RF --summary-file SAM_files/S135.txt
hisat2 --dta -t -x Genome/hisat2_index/genome -1 B/A/12_152_R1_001.fastq.gz -2 B/A/12_152_R2_001.fastq.gz -S SAM_files/125.sam --rna-strandness RF --summary-file SAM_files/S125.txt
