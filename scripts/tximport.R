BiocManager::install("tximport")
library("tximport")
install.packages("tidyverse")
install.packages("ggfortify")
library("tidyverse")

sampleinfo <- read.csv("mydata.csv", sep=",")
sampleinfo
files <- file.path("Samples", sampleinfo$id, "t_data.ctab")
files
files <- set_names(files, sampleinfo$id)
files
tmp <- read_tsv(files[1], show_col_types = FALSE)
tx2gene <- tmp[,c("t_name","gene_name")]
head(tx2gene)

#Full data table for the counts
txi <- tximport(files, type ="stringtie", tx2gene = tx2gene)
file.exists(files)
str(txi)
head(txi$counts)
tail(txi$counts)
#Dimensions
dim(txi$counts)
#save RDS
saveRDS(txi,file = "txi.rds")
#____________________
class(txi)
names(txi)
#____________________
#Round counts
rawCounts <- round(txi$counts, 0)
head(rawCounts)

#remove genes that are low expressed(at least 5 counts across all the rows)

keep <- rowSums(rawCounts) > 5
head(keep)

#summarize the number of genes containing the condition 
table(keep, useNA ="always")

#filter row counts(keep the genes with enough expression)

filterCounts <- rawCounts[keep,]
dim(filterCounts)
summary(filterCounts)
#boxplot (raw data)
boxplot(filterCounts, main = "Raw Counts", las =2)
#log transformation
logcounts <- log2(filterCounts +1)
summary(logcounts)
#boxplot1
boxplot(logcounts, main = "Raw Count", las = 2)
statusCols <- str_replace_all(sampleinfo$condition, c(MS = "red", HD = "blue" ))
statusCols
boxplot(logcounts, main = "Raw Count", las =2, col = statusCols)
#median
abline(h= median(logcounts, col= "black"))

vst_counts <- vst(filterCounts) 
head(vst_counts)

#boxplot2
boxplot(vst_counts, main = "Raw Count", las =2, col = statusCols)

#rlog (transform data)
rlogcounts <- rlog(filterCounts) 

#boxplot
boxplot(rlogcounts, main = "rlog count", las =2, col = statusCols)
abline(h= median(rlogcounts, col= "black"))

pcDat <- prcomp(t(rlogcounts))
str(pcDat)
autoplot(pcDat)
autoplot(pcDat, data =sampleinfo, colour = "condition", size =4)
autoplot(pcDat, data =sampleinfo, colour = "condition", shape= 'condition', size =4) + geom_text_repel(aes(x=PC1, y=PC2, label = id), box.padding=0.7)
