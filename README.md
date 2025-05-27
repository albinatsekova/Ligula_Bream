# Ligula_Bream
De novo transcriptome assembly, proteome prediction and annotation of the Ligula intestinalis (Cestoda: Diphyllobothriidae) plerocercoids and its intermediate host, the common bream Abramis brama L. (Cypriniformes: Leuciscidae).

## Materials and methods

### Sample collection
Breams were caught in Lake Syamozero, Russia (61.89778°, 33.08389°). Uninfected and infected bream were selected for analysis (females, gonad maturity stage 2-3, age 5+ to 7+). Tissues from infected and uninfected fish (muscle, hepatopancreas, spleen, brain) and L. intestinalis plerocercoids from the body cavity of infected bream were collected.

### RNA extraction, library preparation and sequencing
RNA extraction was performed from tissue fragments (muscles, brain, spleen, hepatopancreas) of Abramis brama and L. intestinalis plerocercoids. Total RNA was purified with Biolabmix columns. mRNA was enriched with NEBNext Poly(A) mRNA Magnetic Isolation Module for Illumina, and libraries were prepared with a NEBNext Ultra II Directional RNA Library Prep Kit for Illumina and sequenced with a NovaSeq 6000 device.

### De novo transcriptome assembly, proteome prediction and annotation
Read quality was controlled with FastQC. Adapters were removed with the bbduk.sh script from the BBMAP package v38.95. rnaSPAdes (Bushmanova et al., 2019, doi:10.1093/gigascience/giz100) v3.15.5 in the Galaxy interface (usegalaxy.org) with the --ss-fr flag was used for transcriptome assembly. Assembly quality was assessed with BUSCO v5.4.5 (Manni et al., 2021, doi:10.1002/cpz1.323) using the bony fish database (actinopterygii_odb10) / eukaryota database (eukaryota_odb10). All assemblies had >89% BUSCO completeness. Then, protein sequences were predicted with transDecoder v5.7.0 and annotated with eggnog-mapper v2 in web interface. Short annotation was appended to transcript names with custom bash and R commands. Potential contaminants were filtered out with NCBI FCS GX v0.5.4 in Galaxy.

## Results
All assemblies had high completeness according to BUSCO score, with at least 88% of conserved single-copy orthologs of the corresponding group present.

All raw data and sequences have been deposited to the NCBI BioProject database with accession number PRJNA1222162. Raw reads were deposited into the NCBI SRA database (SRR32306971, SRR32316192, SRR32316193), and assembled contigs were deposited to the Transcriptome Shotgun Assembly (TSA) database under the accession number GLCF00000000, GLCE00000000, GLCG00000000.

This repository contains predicted proteomes and annotations of resulting protein sequences, as well as the scripts used to analyze the data.
