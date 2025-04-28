#ref https://www.biostars.org/p/416573/

# customized script from DESeq2::plotPCA function

# library

library(DESeq2)
library(tidyverse)
library(airway)

# process

data(airway)
rawCounts = assay(airway)

meta.data = data.frame(sample = airway@colData$Run,
                       treatment = airway@colData$dex,
                       cell = airway@colData$cell
                       )

rawCounts <- rawCounts[rowSums(rawCounts) > 8,]

dds = DESeqDataSetFromMatrix(countData = rawCounts,
                             colData = meta.data,
                             design = ~treatment)

dds = DESeq(dds)

# select top 500 gene   get pca data

get.pcaData = function (object, method = "vst",ntop = 500,metaData) 
{
    if (method == "vst") {
      object = DESeq2::vst(dds)
    }else {
      object = DESeq2::rlog(dds)
    }
    # select top feature and pca
    rv <- rowVars(assay(object))
    select <- order(rv, decreasing = TRUE)[seq_len(min(ntop, length(rv)))]
    pca <- prcomp(t(assay(object)[select, ]))
    d <- data.frame(pca$x)
    d = cbind(d,meta.data)
    
    # get lab text
    percentVar <- pca$sdev^2/sum(pca$sdev^2)
    vat = character()
    for (i in seq_len(length(percentVar))) {
      vat[i] = paste0("PC",i, ": ", round(percentVar[i] * 100), "% variance")
}
    
    return(list(d = d,pvar = percentVar,varText = vat))
}

pca.data = get.pcaData(dds,metaData = meta.data)

# plot

p = ggplot(data = pca.data$d, aes(x = PC1, y = PC2)) + 
  geom_point(aes(color = treatment,shape = cell),size = 3) +
  labs(x = pca.data$varText[1],
       y = pca.data$varText[2],
       title = "Variance by first 2 PCs") +
  coord_fixed() + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid = element_blank()) +
  scale_shape_manual(values = c(15,16,17,18)) +
  ggrepel::geom_text_repel(size=3,aes(label = sample))

# or identify the top 500 genes contributing to variance along PCx
# ref https://www.biostars.org/p/333817/

pca <- prcomp(x)
# indices of top 500 genes on PC1 by absolute value
values1 <- order(abs(pca$rotation[,1]), decreasing=TRUE)[1:500]
