# 什么是参考基因组

蛋白质是生命活动的主要承担者，根据中心法则（central dogma），蛋白质是由DNA编码的，因此确定生物基因组中DNA的序列并对其功能进行注释十分重要。经过多年努力，科学家已建立了多种生物的参考基因组及其注释，在此我们只讨论人以及小鼠等模式生物的情况。

![image](https://github.com/user-attachments/assets/8188cb5d-0d2a-4e08-a83b-4159033f0271)

central-dogma illustration from [NHGRI](https://www.genome.gov/genetics-glossary/Central-Dogma)

以下是对gatk解释的摘要
[gatk explanation for reference genome](https://gatk.broadinstitute.org/hc/en-us/articles/360035891071-Reference-genome)

理想情况下，参考基因组应该能代表研究的群体。因此，参考基因组的每个片段都应该是在群体的基因组中最常观察到的序列，但是某一个体的基因组序列未必与参考基因组完全相同。

目前大多数物种的参考基因组序列都是haploid，只代表一个拷贝。对于像人类这样的二倍体生物来说，在那些经常以heterozygous状态出现的位点（即表现出两个不同的等位基因，例如A/T）上，选择哪个序列作为标准表示在很大程度上是任意的。

通常测定基因组序列需要打断DNA，从小片段开始测序，然后组装起来，因此构建参考基因组的操作本身或者构建好的参考基因组又称为genome assembly

以下是NIH对assembly的解释
[NIH for genome assembly](https://support.nlm.nih.gov/kbArticle/?pn=KA-03568)

A major strategy to generate an assembly involves (1) isolation of genomic DNA from a biological sample and (2) fragmentation of DNA into small pieces that are then sequenced individually. Once the sequences of the small pieces — called reads — are obtained, researchers assemble these like tiny pieces of a giant puzzle into progressively larger contiguous sequence pieces (called contigs). This approach is termed Whole Genome Shotgun (WGS) sequencing.


# 参考基因组的术语

必须了解基因组组装的术语，才能挑选适合项目的基因组。

以下是对相关术语的解释
参考了[Genome Reference Consortium](https://www.ncbi.nlm.nih.gov/grc/help/)和[GATK](https://gatk.broadinstitute.org/hc/en-us/articles/360041155232-Reference-Genome-Components)

1. component

A low genomic level sequence used to construct the genome, typically these are either clone sequences, WGS sequence or a PCR fragment. These sequences must be submitted to GenBank/EMBL/DDBJ .

2. join

The sequence overlap between two adjacent components in a contig..

3. switch point

The base at which the contig sequence stops being generated from one component sequence and switches to using the next component sequence. There must be at least 1 switch points between adjacent component sequences in a contig .

4. contig

一个contig是把一系列重叠的DNA序列片段组装成的更长的连续序列,代表了基因组中一个连续的区域.

A contig is a contiguous sequence without "physical" gaps. 

![image](https://github.com/user-attachments/assets/c0efa51d-76e5-4832-9e87-08073e930fca)

contig illustration from[GRC](https://www.ncbi.nlm.nih.gov/grc/help/definitions/)

The short blue lines labelled Component# are the low level sequences used to build the contig. These will typically have GenBank accessions. 

5. scaffold

An ordered and oriented set of contigs. A scaffold will contain gaps, but there is typically some evidence to support the contig order, orientation and gap size estimates.

6. Unlocalized Sequence
知道在哪个染色体上，不知道位置和方向
A sequence found in an assembly that is associated with a specific chromosome but cannot be ordered or oriented on that chromosome.

7. Unplaced Sequence
知道来自基因组，不知道在哪个染色体上
A sequence found in an assembly that is not associated with any chromosome.

8. Alternate locus:
A sequence that provides an alternate representation of a locus found in a largely haploid assembly. These sequences don't represent a complete chromosome sequence although there is no hard limit on the size of the alternate locus; currently these are less than 1 Mb. Previously these sequences have been referred to as "partial chromosomes", "alternate alleles", and "alternate haplotypes". However, these terms are confusing because they contain terms that have biological implications. Diploid assemblies (which by definition are from a single individual) should not have alternate loci representations. Multiple scaffolds from different loci that are considered to be part of the same haplotype should be grouped into alternate locus groups (e.g. mouse 129/Sv group). Note: an alternate locus group was previously considered an alternate partial assembly.
Alternate contigs, alternate scaffolds or alternate loci allow for representation of diverging haplotypes in regions that are too complex for a single representation. See the document on the Human genome reference builds for more discussion on the purpose and usage of ALT contigs.

9. Chromosome Assembly:
a relatively complete pseudo-molecule assembled from smaller sequences ([components](#COMPONENT)) that represent a biological chromosome. Relatively complete implies that some gaps may still be present in the assembly, but independent measures suggest that most of the sequence is represented by sequenced bases. Completeness is submitter defined. Understanding completeness is important for determining whether we submit chromosome level ASN for that chromosome.

10. Assembly:
a set of chromosomes, unlocalized and unplaced (random) sequences and alternate loci used to represent an organism's genome. Most current assemblies are a haploid representation of an organism's genome, although some loci may be represented more than once (see Alternate locus, above). This representation may be obtained from a single individual (e.g. chimp or mouse) or multiple individuals (e.g. human reference assembly). Except in the case of organisms which have been bred to homozygosity, the haploid assembly does not typically represent a single haplotype, but rather a mixture of haplotypes. As sequencing technology evolves, it is anticipated that diploid sequences representing an individual's genome will become available.

11. Assembly Units:
Collections of sequences used to define discrete parts of an assembly. For example, the Primary assembly is considered one sequence unit. Alternate-loci grouped together by a common name (e.g. 129/Sv in mouse) would be considered a separate assembly-unit. In many cases, the assembly-units are what many people previously considered ‘assemblies'.

12. Primary Assembly:
Relevant for haploid assemblies only. The primary assemblies represents the collection of assembled chromosomes, unlocalized and unplaced sequences that, when combined, should represent a non-redundant haploid genome. This excludes any of the alternate locus groups.
Primary assembly refers to the collection of (i) assembled chromosomes, (ii) unlocalized (known to belong on a specific chromosome but with unknown order or orientation) and (iii) unplaced (chromosome unknown) sequences. It represents a non-redundant haploid genome.

13. PAR
Pseudo-autosomal region. A region found on the X and Y chromosomes of mammals that allow recombination between the sex chromosomes. In human, the regions are defined on the X chromosome and the sequence from the X chromosome is copied onto the Y, but this is not a requirement for representing the PAR.Because the PAR sequences together create a diploid or pseudo-autosomal sequence region, the X and Y chromosome sequences are intentionally identical in the genome assembly. Analysis set genomes further hard-mask two of the Y chromosome PAR regions so as to allow mapping of reads solely to the X chromosome PAR regions.

14. PATCH:
A genome patch is a sequence that is part of a minor genome release. These sequences either correct errors in the assembly (a FIX patch) or add additional alternate loci (a NOVEL patch). These sequences allow us to update the assembly information without disrupting the chromosome coordinate system. FIX patches will be removed at the next major assembly release as the changes will be rolled into the new assembly. NOVEL patches will be moved from the PATCHES assembly unit to a proper assembly unit.

**总结**

来自[NIH](https://support.nlm.nih.gov/kbArticle/?pn=KA-03568)的总结以及[NCBI](https://www.ncbi.nlm.nih.gov/datasets/docs/v2/policies-annotation/data-model/)的示意图

![image](https://github.com/user-attachments/assets/0814abf8-956f-4f98-aea5-529a88f50987)

All assemblies contain a unit termed “primary assembly.” This includes non-redundant sequences (chromosomes and/or scaffolds) that represent an organism’s haploid genome. Additional assembly units that may be included are organelle genomes (mitochondria, plastids), alternate loci (sequences aligned to the primary assembly that provide alternate representations of corresponding loci found in the primary assembly), and genome patches that are sequences representing assembly updates.



Contigs are the first level in the hierarchy of a genomic assembly. The next step is to build scaffolds (supercontigs). To build a scaffold, researchers place several contigs in the correct order and orientation. To make a scaffold a single sequence unit (a single sequence record), they represent sequencing gaps between the contigs in the scaffold with series of NNN’s (instead of DNA sequence of A, T, G, and C). Assemblies at the scaffold level will generally have a number of scaffold records plus a number of contigs records.

The next step is to have the scaffolds that belong to the same chromosome properly ordered, oriented, and assembled into the chromosome sequence. Again, researchers represent any sequencing gaps in an assembled chromosome with NNN's. An assembly at the chromosome level will generally have one record for each chromosome. Unlocalized* and unplaced** contigs and scaffolds records may accompany the chromosome records and together constitute the primary assembly. In addition to the primary assembly, a genome assembly may contain other sequence records, such as patches (to correct regions of the primary assembly) and/or alternative loci (to offer alternative models for highly variable regions of chromosomes). Finally, a non-nuclear genome (such as mitochondrion) may complete the collection for the assembly.

# 参考基因组版本

GRC参考基因组联盟（Genome Reference Consortium）目前提供人、小鼠、大鼠等生物的参考基因组。对于人、鼠，主流的下载源有RefSeq、Ensembl、UCSC、GENCODE。
目前最新的人参考基因组版本为GRCh38.p14，p14代表第14个patch，鼠同理，为GRCm39，选择好下载源以及参考基因组的版本十分重要。
首先，不同源对同一版本的命名不同，对GRCh38.p14，有hg38 V44(UCSC)=GCF_000001405.40(RefSeq)=GRCh38 Release 110(Ensembl)=GRCh38 Release 44(GENCODE)
此外，不同源对于参考基因组的染色体命名不同，例如Chr1(UCSC)=1(Ensembl)=NC_000001.11(RefSeq)

Different assemblies shift coordinates for loci and are released infrequently. In the human genome context, Hg19 and GRCh38/hg38 represent two different major assemblies. Comparing data from different assemblies requires lift-over tools that adjust genomic coordinates to match loci, at times imperfectly.




根据[NCBI](https://www.ncbi.nlm.nih.gov/datasets/docs/v2/policies-annotation/data-model/)
NCBI uses identifiers to distinguish between GenBank assemblies represented with a ‘GCA_’ prefix and RefSeq assemblies that begin with a ‘GCF_’ prefix. The latter are copies of GenBank assemblies used by RefSeq to annotate genome assemblies.


# 参考基因组的选择

截至2025/01/15，GRC的决定仍然是["indefinitely postpone next coordinate-changing update (GRCh39)"](https://www.ncbi.nlm.nih.gov/grc)

我的选择是ENCODE

