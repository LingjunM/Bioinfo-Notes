# 什么是参考基因组

根据中心法则，执行生物功能的蛋白质是由DNA编码的，因此确定DNA的序列并对其功能进行注释十分重要。经过多年努力，已建立了人类、多种模式生物如小鼠、果蝇等以及非模式生物的参考基因组及其注释。

理想情况下，参考基因组应该能代表研究的群体。因此，参考基因组的每个片段都应该是在群体的基因组中最常观察到的序列。由于基因突变的广泛存在，真正的参考基因组是混合杂交种，尽管用作参考，任何特定的单个基因组序列未必与参考基因组完全相同。

目前大多数物种的参考基因组序列都是haploid，只代表一个拷贝。对于像人类这样的二倍体生物来说，在那些经常以heterozygous状态出现的位点（即表现出两个不同的等位基因，例如A/T）上，选择哪个作为标准表示在很大程度上是任意的。

[ref1：参考基因组](https://gatk.broadinstitute.org/hc/en-us/articles/360035891071-Reference-genome)

# 参考基因组的构建

1.contig  A contig is a contiguous sequence without "physical" gaps. 一个contig是把一系列重叠的DNA序列片段组装成的更长的连续序列,代表了基因组中一个连续的区域.
![image](https://github.com/user-attachments/assets/c0efa51d-76e5-4832-9e87-08073e930fca)
图片来自[GRC](https://www.ncbi.nlm.nih.gov/grc/help/definitions/)

2.scaffold

# 参考基因组的术语

Analysis set reference genomes have special features to accommodate sequence read alignment. This type of genome reference can differ from the reference you use to browse the genome. See the document on the Human genome reference builds for an example.

Alternate contigs, alternate scaffolds or alternate loci allow for representation of diverging haplotypes in regions that are too complex for a single representation. See the document on the Human genome reference builds for more discussion on the purpose and usage of ALT contigs.

Primary assembly refers to the collection of (i) assembled chromosomes, (ii) unlocalized (known to belong on a specific chromosome but with unknown order or orientation) and (iii) unplaced (chromosome unknown) sequences. It represents a non-redundant haploid genome.

PAR stands for pseudoautosomal region. PAR regions in mammalian X and Y chromosomes allow for recombination between the sex chromosomes. Because the PAR sequences together create a diploid or pseudo-autosomal sequence region, the X and Y chromosome sequences are intentionally identical in the genome assembly. Analysis set genomes further hard-mask two of the Y chromosome PAR regions so as to allow mapping of reads solely to the X chromosome PAR regions.

Different assemblies shift coordinates for loci and are released infrequently. In the human genome context, Hg19 and GRCh38/hg38 represent two different major assemblies. Comparing data from different assemblies requires lift-over tools that adjust genomic coordinates to match loci, at times imperfectly.

Patches are regional fixes that are released periodically for a given assembly. They are intended to improve representation or add information to the assembly without disrupting the chromosome coordinates. There are two types of patches, fixed and novel, representing different types of sequence changes.

Fix patches represent sequences that will replace primary assembly sequence in the next major assembly release. When interpreting data, fix patches should take precedence over the chromosomes.
Novel patches represent alternate loci. When interpreting data, treat novel patches as population sequence variants.

[ref2: ](https://gatk.broadinstitute.org/hc/en-us/articles/360041155232-Reference-Genome-Components)
# 参考基因组版本
在高通量测序中，我们需要把测序得到的序列和参考基因组比较，以得到序列的位置、关联的基因等信息。为此需要一个公共承认的参考基因组
目前，主流的参考基因组版本有RefSeq、ENSEMBL、UCSC
参考基因组联盟（Genome Reference Consortium） GRC已完成了人、大小鼠、斑马鱼、鸡的参考基因组构建。
截至2025/01/15，GRC的决定仍然是"indefinitely postpone next coordinate-changing update (GRCh39)"

# 参考基因组的选择

我的选择是ENCODE

