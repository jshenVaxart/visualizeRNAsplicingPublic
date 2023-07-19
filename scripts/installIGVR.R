if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("igvR",dependencies=TRUE)
library(igvR)

