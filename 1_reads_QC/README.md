This folder contains the description of procedures performed with reads and main quality control results.

Initial quality control of reads (FastQC v0.11.9)
`fastqc *`

Summary of all QC files (MultiQC v1.13)
`multiqc .`

As adapters were present in reads, they were trimmed (`bbduk.sh` from BBMAP package v38.95):

`bbduk.sh in1=../01_raw/Control_fish_S21_R1_001.fastq.gz in2=../01_raw/Control_fish_S21_R2_001.fastq.gz ref=/media/secondary/apps/bbmap/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo out1=Control_fish_S21_trimmed_R1.fq.gz out2=Control_fish_S21_trimmed_R2.fq.gz`

`bbduk.sh in1=../01_raw/Infected_fish_S22_R1_001.fastq.gz in2=../01_raw/Infected_fish_S22_R2_001.fastq.gz ref=/media/secondary/apps/bbmap/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo out1=Infected_fish_S22_trimmed_R1.fq.gz out2=Infected_fish_S22_trimmed_R2.fq.gz`

`bbduk.sh in1=../01_raw/Ligula_S20_R1_001.fastq.gz in2=../01_raw/Ligula_S20_R2_001.fastq.gz ref=/media/secondary/apps/bbmap/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo out1=Ligula_S20_trimmed_R1.fq.gz out2=Ligula_S20_trimmed_R2.fq.gz`

Then, fastqc and multiqc steps were repeated, and adapter contamination was gone.

The results of QC analysis of raw data (before adapter trimming) and trimmed data are presented as .html files.