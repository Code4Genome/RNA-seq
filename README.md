# 📈 Bulk RNA-seq Analysis
Bulk RNA sequencing, commonly known as bulk RNA-seq, provides insights into the average gene expression levels within an entire tissue sample. 
This approach proves valuable for comparative transcriptomics and biomarker investigations. 
However, it lacks the capability to capture the nuanced heterogeneity present within tissues.

RNA-Seq with next-generation sequencing (NGS) is increasingly the method of choice for scientists studying the transcriptome.

    Covers an extremely broad dynamic range
    Provides sensitive, accurate measurement of gene expression
    Captures both known and novel features; does not require predesigned probes
    Generates both qualitative and quantitative data
    Reveals the full transcriptome, not just a few selected transcripts
    
This repository contains scripts, data processing steps, and results for a bulk RNA-seq analysis pipeline. 
The workflow includes quality control, alignment, quantification, differential expression, and functional enrichment analysis.

## 📁 Project Structure

├── data/ # Bash processing (FASTQ, STAR, HISAT2, etc.)                              
├── scripts/ # R scripts (DESeq2, KEGG)                                        
├── README.md #                               
    └── LICENSE
    
## 🧬 Dataset Overview

- **Experiment Type:** Bulk RNA-seq  
- **Organism:** Homo sapiens  
- **Sequencing Platform:** Illumina
