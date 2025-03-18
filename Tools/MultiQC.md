# Usage 用法

`multiqc [OPTIONS] [ANALYSIS DIRECTORY] `

for ngs raw data 

`multiqc -n total_raw -s -o $raw_multiqc $fastqc_dir > multiqc_raw.log 2>&1`

summary fastqc files directly.

直接整合fastqc文件。

for trimmed data

`multiqc -n total_cut -s -o $cut_multiqc $trimqc_dir > multiqc_trim.log 2>&1`

can integrate trim tools report and fastqc report.

习惯把cutadapt/fastp的数据和修剪后fastqc的数据放在一个文件夹下，方便multiqc整合。

# Explanation 参数解释

`-n`  Report filename.  

输出文件名。

`-s`  leave as full file name.  

avoid issues like [error1](https://www.biostars.org/p/9555128/#9555134)   [error2](https://github.com/MultiQC/MultiQC/issues/1809)

参考以上问题，禁止自动清理文件。

`-o`  output directory.

输出目录。

`>log 2>&1`  to check in the future.

日志定向，方便后续检查。

# Other 其他

Refer to [seqera-supported tools](https://docs.seqera.io/multiqc/modules/) ,it can work with many tools like bowtie2,samtools......

可以整合非常多工具，不限于fastqc，[seqera-supported tools](https://docs.seqera.io/multiqc/modules/) 。
