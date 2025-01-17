# 什么是参考基因组

根据中心法则，执行生物功能的蛋白质是由DNA编码的，因此确定DNA的序列并对其功能进行注释十分重要。经过多年努力，已建立了人类、小鼠等多种模式生物以及非模式生物的参考基因组及其注释。

理想情况下，参考基因组应该能代表研究的群体。因此，参考基因组的每个片段都应该是在群体的基因组中最常观察到的序列。由于基因突变的广泛存在，真正的参考基因组是混合杂交种，尽管用作参考，任何特定的单个基因组序列未必与参考基因组完全相同。

目前大多数物种的参考基因组序列都是haploid，只代表一个拷贝。对于像人类这样的二倍体生物来说，在那些经常以heterozygous状态出现的位点（即表现出两个不同的等位基因，例如A/T）上，选择哪个作为标准表示在很大程度上是任意的。

A major strategy to generate an assembly involves (1) isolation of genomic DNA from a biological sample and (2) fragmentation of DNA into small pieces that are then sequenced individually. Once the sequences of the small pieces — called reads — are obtained, researchers assemble these like tiny pieces of a giant puzzle into progressively larger contiguous sequence pieces (called contigs). This approach is termed Whole Genome Shotgun (WGS) sequencing.


[ref1：参考基因组](https://gatk.broadinstitute.org/hc/en-us/articles/360035891071-Reference-genome)
https://support.nlm.nih.gov/kbArticle/?pn=KA-03568


# 参考基因组的术语

0. component
a low genomic level sequence used to construct the genome, typically these are either clone sequences, WGS sequence or a PCR fragment. These sequences must be submitted to GenBank/EMBL/DDBJ (Figure 2).

1. join
the sequence overlap between two adjacent components in a contig. Figure 1 shows the different types of joins (Figure 2).

1. Switch point:
the base at which the contig sequence stops being generated from one component sequence and switches to using the next component sequence. There must be at least 1 switch points between adjacent component sequences in a contig (Figure 2).

1. contig  

A contig is a contiguous sequence without "physical" gaps. 

一个contig是把一系列重叠的DNA序列片段组装成的更长的连续序列,代表了基因组中一个连续的区域.

![image](https://github.com/user-attachments/assets/c0efa51d-76e5-4832-9e87-08073e930fca)

图片来自[GRC](https://www.ncbi.nlm.nih.gov/grc/help/definitions/)
The short blue lines labelled Component# are the low level sequences used to build the contig. These will typically have GenBank accessions. 

2. scaffold

An ordered and oriented set of contigs. A scaffold will contain gaps, but there is typically some evidence to support the contig order, orientation and gap size estimates.

3. Unlocalized Sequence
A sequence found in an assembly that is associated with a specific chromosome but cannot be ordered or oriented on that chromosome.
知道在哪个染色体上，不知道位置和方向

4. Unplaced Sequence
A sequence found in an assembly that is not associated with any chromosome.
知道来自基因组，不知道在哪个染色体上

5. Alternate locus:
A sequence that provides an alternate representation of a locus found in a largely haploid assembly. These sequences don't represent a complete chromosome sequence although there is no hard limit on the size of the alternate locus; currently these are less than 1 Mb. Previously these sequences have been referred to as "partial chromosomes", "alternate alleles", and "alternate haplotypes". However, these terms are confusing because they contain terms that have biological implications. Diploid assemblies (which by definition are from a single individual) should not have alternate loci representations. Multiple scaffolds from different loci that are considered to be part of the same haplotype should be grouped into alternate locus groups (e.g. mouse 129/Sv group). Note: an alternate locus group was previously considered an alternate partial assembly.
Alternate contigs, alternate scaffolds or alternate loci allow for representation of diverging haplotypes in regions that are too complex for a single representation. See the document on the Human genome reference builds for more discussion on the purpose and usage of ALT contigs.

Chromosome Assembly:
a relatively complete pseudo-molecule assembled from smaller sequences ([components](#COMPONENT)) that represent a biological chromosome. Relatively complete implies that some gaps may still be present in the assembly, but independent measures suggest that most of the sequence is represented by sequenced bases. Completeness is submitter defined. Understanding completeness is important for determining whether we submit chromosome level ASN for that chromosome.

Assembly:
a set of chromosomes, unlocalized and unplaced (random) sequences and alternate loci used to represent an organism's genome. Most current assemblies are a haploid representation of an organism's genome, although some loci may be represented more than once (see Alternate locus, above). This representation may be obtained from a single individual (e.g. chimp or mouse) or multiple individuals (e.g. human reference assembly). Except in the case of organisms which have been bred to homozygosity, the haploid assembly does not typically represent a single haplotype, but rather a mixture of haplotypes. As sequencing technology evolves, it is anticipated that diploid sequences representing an individual's genome will become available.

Assembly Units:
Collections of sequences used to define discrete parts of an assembly. For example, the Primary assembly is considered one sequence unit. Alternate-loci grouped together by a common name (e.g. 129/Sv in mouse) would be considered a separate assembly-unit. In many cases, the assembly-units are what many people previously considered ‘assemblies'.

Primary Assembly:
Relevant for haploid assemblies only. The primary assemblies represents the collection of assembled chromosomes, unlocalized and unplaced sequences that, when combined, should represent a non-redundant haploid genome. This excludes any of the alternate locus groups.
Primary assembly refers to the collection of (i) assembled chromosomes, (ii) unlocalized (known to belong on a specific chromosome but with unknown order or orientation) and (iii) unplaced (chromosome unknown) sequences. It represents a non-redundant haploid genome.

PAR:
Pseudo-autosomal region. A region found on the X and Y chromosomes of mammals that allow recombination between the sex chromosomes. In human, the regions are defined on the X chromosome and the sequence from the X chromosome is copied onto the Y, but this is not a requirement for representing the PAR.
PAR stands for pseudoautosomal region. PAR regions in mammalian X and Y chromosomes allow for recombination between the sex chromosomes. Because the PAR sequences together create a diploid or pseudo-autosomal sequence region, the X and Y chromosome sequences are intentionally identical in the genome assembly. Analysis set genomes further hard-mask two of the Y chromosome PAR regions so as to allow mapping of reads solely to the X chromosome PAR regions.

Genome Patch:
A contig sequence that is released outside of the full assembly release cycle. These sequences are meant to add information to the assembly without disrupting the stable coordinate system. There are two types of patches, FIX and NOVEL. FIX patches are released to correct an error in the assembly and will be removed when the new full assembly is released. NOVEL sequences are sequences that were not in the last full assembly release and will be retained with the next full assembly release.
PATCH:
A genome patch is a scaffold sequence that is part of a minor genome release. These sequences either correct errors in the assembly (a FIX patch) or add additional alternate loci (a NOVEL patch). These sequences allow us to update the assembly information without disrupting the chromosome coordinate system. FIX patches will be removed at the next major assembly release as the changes will be rolled into the new assembly. NOVEL patches will be moved from the PATCHES assembly unit to a proper assembly unit.
Patches are regional fixes that are released periodically for a given assembly. They are intended to improve representation or add information to the assembly without disrupting the chromosome coordinates. There are two types of patches, fixed and novel, representing different types of sequence changes.

Fix patches represent sequences that will replace primary assembly sequence in the next major assembly release. When interpreting data, fix patches should take precedence over the chromosomes.
Novel patches represent alternate loci. When interpreting data, treat novel patches as population sequence variants.

**总结**

来自[NIH](https://support.nlm.nih.gov/kbArticle/?pn=KA-03568)的总结

Contigs are the first level in the hierarchy of a genomic assembly. The next step is to build scaffolds (supercontigs). To build a scaffold, researchers place several contigs in the correct order and orientation. To make a scaffold a single sequence unit (a single sequence record), they represent sequencing gaps between the contigs in the scaffold with series of NNN’s (instead of DNA sequence of A, T, G, and C). Assemblies at the scaffold level will generally have a number of scaffold records plus a number of contigs records.

The next step is to have the scaffolds that belong to the same chromosome properly ordered, oriented, and assembled into the chromosome sequence. Again, researchers represent any sequencing gaps in an assembled chromosome with NNN's. An assembly at the chromosome level will generally have one record for each chromosome. Unlocalized* and unplaced** contigs and scaffolds records may accompany the chromosome records and together constitute the primary assembly. In addition to the primary assembly, a genome assembly may contain other sequence records, such as patches (to correct regions of the primary assembly) and/or alternative loci (to offer alternative models for highly variable regions of chromosomes). Finally, a non-nuclear genome (such as mitochondrion) may complete the collection for the assembly.


[ref1:grc](https://www.ncbi.nlm.nih.gov/grc/help/)
[ref2:gatk ](https://gatk.broadinstitute.org/hc/en-us/articles/360041155232-Reference-Genome-Components)

# 参考基因组版本

Different assemblies shift coordinates for loci and are released infrequently. In the human genome context, Hg19 and GRCh38/hg38 represent two different major assemblies. Comparing data from different assemblies requires lift-over tools that adjust genomic coordinates to match loci, at times imperfectly.

在高通量测序中，我们需要把测序得到的序列和参考基因组比较，以得到序列的位置、关联的基因等信息。为此需要一个公共承认的参考基因组
目前，主流的参考基因组版本有NCBI、ENSEMBL、UCSC
参考基因组联盟（Genome Reference Consortium） GRC已完成了人、大小鼠、斑马鱼、鸡的参考基因组构建。
截至2025/01/15，GRC的决定仍然是["indefinitely postpone next coordinate-changing update (GRCh39)"](https://www.ncbi.nlm.nih.gov/grc)

根据[NCBI](https://www.ncbi.nlm.nih.gov/datasets/docs/v2/policies-annotation/data-model/)
NCBI uses identifiers to distinguish between GenBank assemblies represented with a ‘GCA_’ prefix and RefSeq assemblies that begin with a ‘GCF_’ prefix. The latter are copies of GenBank assemblies used by RefSeq to annotate genome assemblies.


# 参考基因组的选择

我的选择是ENCODE

