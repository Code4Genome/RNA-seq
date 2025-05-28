library(DESeq2)
library(tidyverse)
install.packages("gplots")

pcaData <- plotPCA(vst, intgroup = c("condition"), returnData =TRUE, ntop = 15000)

pcaData

percenVar <- round(100*attr(pcaData, "percentVar"))

ggplot(pcaData, aes(PC2, PC1, color=condition, shape=condition)) +
  geom_point(size=2.5) +
  coord_fixed() + ggtitle("PCA on all genes") + 
  xlab(paste0("PC2: ", percenVar[2], "% variance")) +
  ylab(paste0("PC1: ", percenVar[1], "% variance")) +
  theme(plot.title= element_text(face="bold", hjust = 0.5)) 

#HEATMAP 

res <- results(object = ddsFiltered,
               # SampleTable col. "condition", compare "WT" (=Ref.) vs. "TG"
               contrast = c("condition", "A", "B"),
               # How to adjust for the multiple testing problem?
               pAdjustMethod="fdr",
               #significane cutoff
               alpha = 0.05)

summary(res)
res <- res[order(res$pvalue),]
res
results <- as.data.frame(res)
results
sigres <- results[which(results$padj < 0.05),]
dim(sigres)

signames <- rownames(sigres)
signames

pheatmap(mat = assay(vst),#[sig.names,],      # show sign genes, all samples 
         cluster_rows=T, cluster_cols=T,   # show dendrograms? [TRUE/FALSE]
         show_rownames=F, show_colnames=T, # show row/column names? [TRUE/FALSE]
         annotation_legend=T, #annotation_col=groups, # legend
         # Title of plot
         main="Heatmap B vs. A")
