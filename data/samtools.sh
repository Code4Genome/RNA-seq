#!/bin/bash
# LOAD MODULES HERE IF REQUIRED
ml SAMtools/1.11
# START THE APPLICATION
samtools view -b SAM_files/B/106_32_S106.sam > BAM_files/Bcell/S106.bam 
samtools view -b SAM_files/B/109_160_S109.sam > BAM_files/Bcell/S109.bam
