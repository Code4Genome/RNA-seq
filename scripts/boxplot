library(DESeq2)
library(tidyverse)
install.packages("gplots")

boxplot<-distro_expr(vst,plot_type = "boxplot") +
  # Title of plot
  ggtitle('B vs. A') +
  # modify the visual theme
  theme(axis.text.x=element_text(angle = 90, vjust=0.5, hjust=1, size = 10))
# display the boxplot
print(boxplot)
