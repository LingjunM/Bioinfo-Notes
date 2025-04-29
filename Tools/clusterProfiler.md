
```{r}
data(geneList,package = "DOSE")
de <- names(geneList)[abs(geneList) > 2]
```

k = pathway genes
n = total input genes
M = total pathway genes
N = total query genes

GeneRatio=k/n
BgRatio=M/N

# ORA analysis

## enrichGO

default parameter

- `minGSSize = 10`，基因集包含的基因数阈值
- `maxGSSize = 500`，基因集包含的基因数阈值
- `pool = F`，三个术语的条目是否放在一起分析
- `pAdjustMethod = "BH"`，多重假设检验矫正

```{r}
ggo = enrichGO(gene = de,
               OrgDb = org.Hs.eg.db,
               keyType = "ENTREZID",
               ont = "ALL",
               pvalueCutoff = 0.2,
               qvalueCutoff = 0.2,
               readable = T,
             )
```

DO、GO、Reactome等分析可以设置`readable = T` ,把富集的基因ID转换为symbol

如果忘记设置，或者对于KEGG等数据库，使用`setReadable`函数。

Any gene ID type that is supported in OrgDb can be directly used in GO analyses.We can query `OrgDb` online via the `AnnotationHub` package. 

## enrichKEGG

```{r}
ora.kegg = enrichKEGG(gene = de,
                      organism = "hsa",
                      pvalueCutoff = 0.2
                      )

ora.kegg = setReadable(ora.kegg,keyType = "ENTREZID",OrgDb = org.Hs.eg.db)
```

A rule of thumb for the ‘kegg’ ID is entrezgene ID for eukaryote species and Locus ID for prokaryotes.

-  `keyType = "kegg"`,
-  `pAdjustMethod = "BH"`,
-  `universe`,background gene counts 背景基因数
-  `minGSSize = 10`,
-  `maxGSSize = 500`,
-  `qvalueCutoff = 0.2`,
-  `use_internal_data = FALSE`，是否本地数据库

Translating gene IDs to gene symbols is partly supported using the `setReadable` function if and only if there is an OrgDb available. 


# GSEA

## gsego

```{r}
gse.go = gseGO(geneList = geneList,
               ont = "ALL",
               OrgDb = org.Hs.eg.db,
               keyType = "ENTREZID",
               pvalueCutoff = 0.2,
               verbose = F,
               eps = 0,
               seed = 101)
```

- `exponent = 1`,  加权方式，=0则所有gene都加1/k
- `minGSSize = 10`, 基因集包含的基因数
- `maxGSSize = 500`, 基因集包含的基因数
- `pAdjustMethod = "BH"`, FDR矫正方法
- `by = "fgsea"`,调用的包
- `universe`	missing: all genes listed in the database will be used as background.

默认最小p值显示为1e-10。 For some pathways, in reality P-values are less than 1e-10. You can set the `eps` argument to zero for better estimation.

verbose输出的是进程信息

`seed = 101` 设置seed参数 使NES pvalue等结果可复现

## gseKEGG

```{r}
gse.kegg = gseKEGG(geneList = geneList,
                   organism = "hsa",
                   eps = 0,
                   pvalueCutoff = 0.2,
                   verbose = F,
                   seed = 101
)
```

-  `keyType = "kegg"`, entrezid
-  `exponent = 1`, 加权系数
-  `minGSSize = 10`,
-  `maxGSSize = 500`,
-  `pAdjustMethod = "BH"`,
-  `use_internal_data = FALSE`,使用在线数据库
-  `by = "fgsea"`



# specific function



# dplyr


# trans id


# make own database



# warning

警告: 载入时'package:stats'可能无用 /
warning: 'package:stats' may not be available when loading 

根据 rstudio/rstudio#3946  以及 rstudio/rstudio#7438，这是RStudio引发的问题，无需担心。

[可能的解决办法](https://github.com/yihui/litedown/commit/182e89a)

根据 Calvagone/campsis#157， 有的包可能已经解决，但有的尚未解决，[参考](https://stackoverflow.com/questions/27623901/r-warning-packagestats-may-not-be-available-when-loading)










