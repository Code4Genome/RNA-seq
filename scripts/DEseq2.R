#Load txi objects
install.packages("DEseq2")
install.packages("tidyverse")

txi <- readRDS("txi.rds")
class(txi)
names(txi)

txi$counts %>% head()
txi$length %>% head()

#same metadata
sampleinfo <-read.csv("mydata.csv")
sampleinfo

all(colnames(txi$counts) ==sampleinfo$id)

#design 
simple.model <- as.formula(~ condition)
simple.model

model.matrix(simple.model, data=sampleinfo)

sampleinfo <- sampleinfo %>%
  mutate(condition = fct_relevel(condition, "A"))
          
sampleinfo$condition           

model.matrix(simple.model, data = sampleinfo)

#dds object

ddsObject <- DESeqDataSetFromTximport(txi = txi, colData = sampleinfo, design = simple.model)
ddsObject

#class
class(ddsObject)

#filter out low expressed genes

keep <- rowSums(counts(ddsObject)) >5
keep

ddsObject.filt <- ddsObject[keep,]
ddsObject.filt
dim(ddsObject.filt)

#DESeq2

ddsObject <- estimateSizeFactors(ddsObject.filt)
counts(ddsObject.filt) %>% head()


logcounts <- log2(counts(ddsObject.filt, normalize = F) +1)
logcounts

ddsObject <- DESeq(ddsObject.filt)
results.simple <- results(ddsObject, alpha = 0.05)
resultsNames(ddsObject)
results.simple
summary(results.simple)
results.simple %>% as.data.frame()%>% View()
write.csv(results.simple, file = "B_vs_A.csv")

sum(results.simple$padj <0.05 & results.simple$log2FoldChange > 1, na.rm = T)
upregulated <- subset(results.simple, log2FoldChange > 1 & padj < 0.05)

sum(results.simple$padj <0.05 & results.simple$log2FoldChange < -1, na.rm = T)
downregulated <- subset(results.simple, log2FoldChange < -1 & padj < 0.05)
write.csv(upregulated,"upregulated.csv")
write.csv(downregulated,"downregulated.csv")
