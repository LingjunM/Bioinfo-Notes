
[ref-havard tutorial](https://hbctraining.github.io/DGE_workshop/lessons/02_DGE_count_normalization.html)


# normalization

The counts of mapped reads for each gene is proportional to the expression of RNA (“interesting”) in addition to many other factors (“uninteresting”). 
Normalization is the process of scaling raw count values to account for the “uninteresting” factors. 
In this way the expression levels are more comparable between and/or within samples.

While normalization is essential for differential expression analyses, 
it is also necessary for exploratory data analysis, visualization of data, and whenever you are exploring or comparing counts between or within samples.

The main factors often considered during normalization are:

- Sequencing depth: Each gene appears to have doubled in expression **in Sample A relative to Sample B**, 
however this is a consequence of Sample A having double the sequencing depth.

![image](https://github.com/user-attachments/assets/2f22641e-1d38-48c9-aada-5bac30d67102)

- Gene length:  Gene X and Gene Y have similar levels of expression **within the same sample**,
but the number of reads mapped to Gene X would be many more than the number mapped to Gene Y because Gene X is longer.

![image](https://github.com/user-attachments/assets/76262cab-68ea-4621-bf13-3ede58c2bded)

- RNA composition: A few highly differentially expressed genes between samples, differences in the number of genes expressed between samples,
or presence of contamination can skew some types of normalization methods. Accounting for RNA composition is recommended for accurate comparison of expression **between samples**.

![image](https://github.com/user-attachments/assets/48a9e3e8-514f-4457-bc3b-cc7502548fe3)

if we were to divide each sample by the total number of counts to normalize, the counts would be greatly skewed by the DE gene, 
which takes up most of the counts for Sample A, but not Sample B.Most other genes for Sample A would be divided by the larger number of total counts 
and appear to be less expressed than those same genes in Sample B.

# comparison

---

| **Normalization Method** | **Description** | **Accounted Factors** | **Recommendations for Use** |
|--------------------------|------------------|------------------------|------------------------------|
| **CPM/RPM** (Counts Per Million) | Counts scaled by the total number of reads | Sequencing depth | gene count comparisons between replicates of the same sample group;**Not suitable** for within-sample comparisons or differential expression (DE) analysis |
| **TPM** (Transcripts Per Kilobase Million) | Counts per kilobase of transcript length per million mapped reads | Sequencing depth, gene length | gene comparisons within a single sample or between samples from the same group;**Not suitable** for DE analysis |
| **RPKM / FPKM**(reads/fragments per kilobase of exon per million reads/fragments mapped) | Similar to TPM | Sequencing depth, gene length | gene count comparisons between genes within a sample;**Not suitable** for between-sample comparisons or DE analysis |
| **DESeq2’s Median of Ratios** | counts divided by sample-specific size factors determined by median ratio of gene counts relative to geometric mean per gene | Sequencing depth, RNA composition |  comparing gene counts across samples and for differential expression analysis;**Not suitable** for within-sample  comparisons |
| **EdgeR’s TMM** (Trimmed Mean of M-values) | Uses a weighted trimmed mean of the log expression ratios between samples | Sequencing depth, RNA composition, gene length | both between- and within-sample comparisons and for DE analysis |

---

# formula

a = geneA count
m = total count
L = geneA length, **kb**(计算方式有争议)

CPM/RPM = a/m * 10^6
RPKM = a/(mL) * 10^6 (Reads as count)
FPKM = a/(mL) * 10^6 (Fragments as count)

RPKM is for single end RNA-seq
FPKM is very similar to RPKM, but for paired end RNA-seq.

TPM =  x/ ∑(x) * 10^6, x= a/L, ∑(x) = total genes

TPM = FPKM / (∑(FPKM)) * 10^6


