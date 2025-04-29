[ref-pValue](https://biostatsquid.com/confidence-intervals-p-values-explained/)











# same adjusted p-values

[ref1-observation](https://support.bioconductor.org/p/51916/#51952)

Convert the p values to adjusted p-values(using benjamin Hochberg) may result in many adjusted p-values that have the exact same value.

[ref2-interpretation](https://www.biostars.org/p/9469973/)

In short, each unadjusted p-value is multiplied by the number of tests and then divided by its rank order. When p-values are particularly close to each other, this can lead to a more lowly ranked unadjusted p-value ending up with a smaller adjusted p-value than the one before it. In these cases where the resulting sequence is non-decreasing, the preceding p-value is changed to the subsequent one such that they are the same. This is what you're observing in your results, and it's normal.

[ref3-formula](https://stats.stackexchange.com/questions/238458/whats-the-formula-for-the-benjamini-hochberg-adjusted-p-value)

$`N_0`$ = # pvalues ≤ $`p_0`$, N = # pvalues

$\text{FDR}(p_0) = \frac{p_0 N}{N_0}$

$\text{FDR}(p_i) = \min\left(\text{FDR}(p_i), \text{FDR}(p_{i+1})\right)$




