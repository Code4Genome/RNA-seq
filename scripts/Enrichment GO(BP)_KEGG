install.packages("topGO")
library(topGO)
BiocManager::install("org.Hs.eg.db")
library(org.Hs.eg.db)
BiocManager::install("enrichplot")
library(enrichplot)
BiocManager::install("DOSE")
library(DOSE)
install.packages("enrichR")
devtools::install_github("ycl6/topGO-feat", ref = "v2.41.0-barplot")
install.packages("clusterProfiler")
library(clusterProfiler)


#view data

data <- read.csv("B_vs_A.csv")
data
dim(data)

up.idx <- which(data$padj < 0.05 & data$log2FoldChange >1)
dn.idx <- which(data$padj <0.05 & data$log2FoldChange < -1)

all.genes <- data$gene_name
up.genes <- data[up.idx,]$gene_name
dn.genes <- data[dn.idx,]$gene_name

ontology <- "BP"
algorithm <- "weight01"
statistic <- "fisher"
outTitle <- paste0("topGO_GO", ontology, "_ORA", algorithm, "_", statistic)

upList <- factor(as.integer(all.genes %in% up.genes))
names(upList) <- all.genes
upList

dnList <- factor(as.integer(all.genes %in% dn.genes))
names(dnList) <- all.genes
dnList

upGodata <- new("topGOdata", ontology = ontology, allGenes =upList, geneSel = function(x)(x == 1), nodeSize = 10, annot = annFUN.org, mapping = "org.Hs.eg.db", ID = "SYMBOL")
dnGodata <- new("topGOdata", ontology = ontology, allGenes =dnList, geneSel = function(x)(x == 1), nodeSize = 10, annot = annFUN.org, mapping = "org.Hs.eg.db", ID = "SYMBOL")

upRes <- runTest(upGodata, algorithm = algorithm, statistic = statistic)
upRes
dnRes <- runTest(dnGodata, algorithm = algorithm, statistic = statistic)
dnRes

png(paste0(outTitle, "_up.png"), width = 8, height = 6, units = "in", res = 300)
enrichment_barplot(upGodata, upRes, showTerms = 20, numChar = 60, orderBy = "Scores",
                   title = paste0("GO-", ontology," ORA of up-regulated genes"))
invisible(dev.off())

png(paste0(outTitle, "_dn.png"), width = 8, height = 6, units = "in", res = 300)
enrichment_barplot(dnGodata, dnRes, showTerms = 20, numChar = 60, orderBy = "Scores",
                   title = paste0("GO-", ontology," ORA of down-regulated genes"))
invisible(dev.off())

up.sigGenes <- sigGenes(upGodata)
up.sigGenes
dn.sigGenes <- sigGenes(dnGodata)
dn.sigGenes

up.tab <- GenTable(upGodata, Pval = upRes, topNodes = 20)
up.tab
dn.tab <- GenTable(dnGodata, Pval = dnRes, topNodes = 20)
dn.tab


up.AnnoList <- lapply(up.tab$"GO.ID",
                      function(x) as.character(unlist(genesInTerm(object = upGodata, whichGO = x))))
dn.AnnoList <- lapply(dn.tab$"GO.ID",
                      function(x) as.character(unlist(genesInTerm(object = dnGodata, whichGO = x))))



#For KEGG Pathway Analysis

library(enrichR)
dbs_pw <- "KEGG_2021_Human"
upEnriched_pw <- enrichr(genes = up.genes, databases = dbs_pw)
upEnriched_pw
dnEnriched_pw <- enrichr(genes = dn.genes, databases = dbs_pw)
dnEnriched_pw

plotEnrich(upEnriched_pw[[1]], showTerms = 15, numChar = 30, y = "Ratio", orderBy = "P.value", title = "Up-regulated Genes - KEGG Pathway Analysis")
plotEnrich(dnEnriched_pw[[1]], showTerms = 15, numChar = 45, y = "Ratio", orderBy = "P.value", title = "Down-regulated Genes - KEGG Pathway Analysis")

write.csv(upEnriched_pw, "up_kegg.csv")
write.csv(dnEnriched_pw, "dn_kegg.csv")

dev.off()
