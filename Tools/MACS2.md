











# Explanation

`--call-summits`

[ref](https://www.biostars.org/p/464618/#464691)

[ref](https://www.biostars.org/p/162788/)

MACS will now reanalyze the shape of signal profile (p or q-score depending on the cutoff setting) to deconvolve subpeaks within each peak called from general procedure.
It’s highly recommended to detect adjacent binding events.
While used, the output subpeaks of a big peak region will have the same peak boundaries, and different scores and peak summit positions.

e.g.

```
chr17    35164351    35165393    p300_EpiLC_minusActivin_peak_17078a    49    .    3.62557    7.39305    4.98814    174
chr17    35164351    35165393    p300_EpiLC_minusActivin_peak_17078b    122    .    5.43658    15.04741    12.24058    420
chr17    35164351    35165393    p300_EpiLC_minusActivin_peak_17078c    247    .    6.42027    27.98737    24.78897    823
```


