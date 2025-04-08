# 样本信息

grep "\!Sample_characteristics_ch1"  GSE_series_matrix.txt >> gse.txt

# 多基因应该循环

grep ENSG0000_at -m 1 GSE_series_matrix.txt  >> gse.txt

sed -i  's/\"//g' gse.txt

# awk sub函数返回值是替换的数目，不能直接赋值

awk '{ if (NR <= 7) {$1 = $2 ;sub(":","",$1)} print $0}' gse.txt |sed 's/[A-Za-z]*://g' >curate.txt

# 替换空白字符，做成csv

sed "s/\s\+/,/g" curate.txt  > gse.csv
