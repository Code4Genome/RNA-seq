# 📈 Bulk RNA-seq Analysis
Bulk RNA sequencing is the method of choice for transcriptomic analysis of pooled cell populations, 
tissue sections, or biopsies. 
It measures the average expression level of individual genes across hundreds to millions of input 
cells and is useful to get a global idea of gene expression differences between samples.

RNA-Seq with next-generation sequencing (NGS) is increasingly the method of choice for scientists studying the transcriptome.

    Covers an extremely broad dynamic range
    Provides sensitive, accurate measurement of gene expression
    Captures both known and novel features; does not require predesigned probes
    Generates both qualitative and quantitative data
    Reveals the full transcriptome, not just a few selected transcripts
    Can be applied to any species, even if a reference sequence is not available


This repository contains scripts, data processing steps, and results for a bulk RNA-seq analysis pipeline. 
The workflow includes quality control, alignment, quantification, differential expression, and functional enrichment analysis.

## 📁 Project Structure

├── data/ # Bash processing (FASTQ, STAR, HISAT2, etc.)                              
├── scripts/ # Analysis scripts (DESeq2, KEGG)                                        
├── README.md #                               
    └── LICENSE
    
## 🧬 Dataset Overview

- **Experiment Type:** Bulk RNA-seq  
- **Organism:** Homo sapiens  
- **Sequencing Platform:** Illumina
