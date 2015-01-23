Files in this folder correspond to the analyses of ChIP-seq data
performed by Payne & Wagner (2014) Science. See supplementary sections
1.2, 2.5, and table S1.

The file 'DATA_DESCRIPTIONS.txt' provides detailed information on the
source of the ChIP-seq data, including download links.

There are 32 *kmercounts*.txt files in this folder. Each corresponds
to one of the 32 ChIP-seq experiments from 16 transcription factors
that we analyzed. They contain 32,896 rows (one per 8-mer) and 6
columns per row. The columns are:

(1) 8-mer
(2) E-score, PBM array 1
(3) E-score, PBM array 2
(4) Number of occurences of the 8-mer in the ChIP-seq peaks
(5) Number of expected occurences of the 8-mer
(6) p-value of enrichment (i.e., column 4 divided by column 5)

Please note that we use the average E-score from the two PBM arrays
(columns 2 and 3) as our measure of binding affinity. We consider a
site as “bound” (in vitro) if its average E-score exceeds 0.35.  

For information pertaining to the enrichment statistics in columns
4-6, please see van Helden et al. (1998) "Extracting regulatory sites
from the upstream region of yeast genes by computational analysis of
oligonucleotide frequencies" Journal of Molecular Biology. We consider
a site as significantly enriched (in vivo) if its associated p-value
(column 6) is less than 1/32896 (the inverse of the number of unique
8-mers).

To reproduce the statistical associations shown in table S1, run
tableS1.m in Matlab. Specifically, to reproduce the significant
associations, type tableS1(1); to reproduce the insignificant
associations, type tableS1(0);
