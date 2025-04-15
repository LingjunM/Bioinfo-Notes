
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

## GSEA

使用预定义的基因集（通常来自数据库的注释），将基因按照在两类样本中的差异表达程度排序，然后检验基因集是否在这个排序表的顶端或者底端富集。

**ES（Enrichment Score）**：富集得分。从排序列表L的第一个基因开始，计算一个累积统计值。遇到一个落在s里面的基因，则增加统计值。遇到一个不在s里面的基因，则降低统计值。 每一步统计值增加幅度与基因的表达变化程度（fold-change值）是相关的，减少幅度是$`\frac{1}{N_L - N_s}`$ 。ES定义为最大的峰值。正值表示基因集在列表的顶部富集，负值表示基因集在列表的底部富集。 通过排列检验 (permutation test)计算观察到的富集得分出现的可能性。

**NES (Normalized Enrichment Score)**：标准化富集得分。每个基因集s计算得到的ES根据基因集的大小进行标准化，得到标准化富集得分 (NES)。随后计算假阳性率FDR。

**Leading-edge subset**： 对富集贡献最大的成员。从ES为零到峰值包括的基因。
