
# ORA / Over Representation Analysis

[ref-Overview of enrichment analysis](https://yulab-smu.top/biomedical-knowledge-mining-book/enrichment-overview.html)

$p = 1 - \displaystyle\sum_{i = 0}^{k-1}\frac{{M \choose i}{{N-M} \choose {n-i}}} {{N \choose n}}$

`N` is the total number of genes in the background distribution,
`M` is the number of genes within that distribution that are annotated (either directly or indirectly) to the gene set of interest, 
`n` is the size of the list of genes of interest and `k` is the number of genes within that list which are annotated to the gene set. 

N是总基因数，M是某通路的基因数，k是给定基因集中富集到该通路的基因数，n是给定基因集中总基因数

hypergeometric distribution.

超几何分布

one-sided version of Fisher’s exact test?


# GSEA / Gene Set Enrichment Analysis

[ref-Gene Set Enrichment Analysis](https://www.pathwaycommons.org/guide/primers/data_analysis/gsea/)

ORA approaches have three major limitations.

First, the inclusion criteria for input gene lists are rather arbitrary and typically involves selecting genes that exceed some user-defined statistical cutoff. 
This risks excluding potentially important genes that for whatever reason fail to reach statistical significance.

Second, ORA approaches use gene names but not any of the rich quantitative information associated with gene expression experiments.
In this way, equal importance is assigned to each an every gene. 

Third, many of the ORA procedures uses statistical procedures that assume independence among genes: Changes in any gene do not affect or are not influenced by any others.
Clearly, this is unrealistic for biological systems and has the effect of making ORA procedures more prone to erroneous discoveries or false-positives.

ORA方法有几个局限：

选择基因集的标准是任意的，可能会丢失没有统计显著性的基因。

使用基因名作为输入，没有利用基因的表达量信息，因此每个基因重要性相同。

假定基因之间是独立的，通路之间是独立的。

