The assembly step was performed using rnaSPAdes v3.15.5 via the public Galaxy server usegalaxy.org.
The trimmed fastq files from previous step were uploaded to the Galaxy history, and rnaSPAdes was run as follows (an example command is provided):


`/usr/local/bin/rnaspades.py	-o	/jetstream2/scratch/main/jobs/63865506/working/output	-t	14	-m	58	--tmp-dir	/jetstream2/scratch/main/jobs/63865506/tmp	--pe-1	1	/jetstream2/scratch/main/jobs/63865506/working/paired_reads1/Infected_fish_S22_trimmed_R1.fq.gz.fastq.gz	--pe-2	1	/jetstream2/scratch/main/jobs/63865506/working/paired_reads1/Infected_fish_S22_trimmed_R2.fq.gz.fastq.gz	--pe-or	1	fr	--ss	rf`

Quality of the obtained assemblies was analyzed with BUSCO v5.4.5:

`usr/local/bin/busco -i ../03_assembly/Control_fish_transcripts.fasta -l $databases/actinopterygii_odb10/ -o Control_fish_busco/ -m transcriptome --offline -c 6`
`usr/local/bin/busco -i ../03_assembly/Infected_fish_transcripts.fasta -l $databases/actinopterygii_odb10/ -o Infected_fish_busco/ -m transcriptome --offline -c 6`
`/usr/local/bin/busco -i ../03_assembly/Ligula_transcripts.fasta -l $databases/eukaryota_odb10/ -o Ligula_busco_eu/ -m transcriptome --offline -c 6 -f`

The plot was generated using `generate_plot.py` script provided by BUSCO:
`$apps/busco-5.4.5/scripts/generate_plot.py -wd busco_summaries/`

Short summaries of the BUSCO analyses and the code used to generate the figure are provided in the `busco_summaries` folder. The code was slightly edited to improve the design of the figure.