This folder describes the annotation process.

Before proteome prediction, the transcripts were cleaned by FCS in the Galaxy interface.

Then, the following code used to add annotation to the transcripts:
`Rscript transfer_annotation.R`
`seqkit replace -p "(.*)" -r '{kv}' --kv-file Control_fish_annotated_transcripts.tsv Cleaned_Fasta_Control_fish.fasta >Control_fish_transcripts_annotated.fasta`
`seqkit replace -p "(.*)" -r '{kv}' --kv-file Infected_fish_annotated_transcripts.tsv Cleaned_Fasta_Infected_fish.fasta >Infected_fish_transcripts_annotated.fasta`
`seqkit replace -p "(.*)" -r '{kv}' --kv-file Ligula_annotated_transcripts.tsv Cleaned_Fasta_Ligula.fasta >Ligula_transcripts_annotated.fasta`

These files were submitted to NCBI; some of the transcripts were removed according to the TSA requirement.

Then, the transcripts were downloaded from NCBI to save accession numbers in the fasta headers and subjected to proteome prediction with TransDecoder v5.7.0. 
Before the prediction, all spaces were replaced with underscores (required so that TransDecoder does not strip off parts of names):

`sed -e 's/ /_/g' Abr_Inf_Syamozero24_GLCE01.1.fsa  >with_underscore/Abr_Inf_Syamozero24_GLCE01.1.fsa`
`sed -e 's/ /_/g' Abr_Uninf_Syamozero24_GLCG01.1.fsa  >with_underscore/Abr_Uninf_Syamozero24_GLCG01.1.fsa`
`sed -e 's/ /_/g' Ligula_Syamozero24_GLCF01.1.fsa  >with_underscore/Ligula_Syamozero24_GLCF01.1.fsa`

`cd with_underscore/`

`$apps/TransDecoder-TransDecoder-v5.7.0/TransDecoder.LongOrfs -t Abr_Inf_Syamozero24_GLCE01.1.fsa -m 50`
`$apps/TransDecoder-TransDecoder-v5.7.0/TransDecoder.Predict -t Abr_Inf_Syamozero24_GLCE01.1.fsa --single_best_only`

`$apps/TransDecoder-TransDecoder-v5.7.0/TransDecoder.LongOrfs -t Abr_Uninf_Syamozero24_GLCG01.1.fsa -m 50 -f `
`$apps/TransDecoder-TransDecoder-v5.7.0/TransDecoder.Predict -t Abr_Uninf_Syamozero24_GLCG01.1.fsa --single_best_only`

`$apps/TransDecoder-TransDecoder-v5.7.0/TransDecoder.LongOrfs -t Ligula_Syamozero24_GLCF01.1.fsa -m 50 -f `
`$apps/TransDecoder-TransDecoder-v5.7.0/TransDecoder.Predict -t Ligula_Syamozero24_GLCF01.1.fsa --single_best_only`

The following code was used to remove duplicated parts of the names:
`sed -e 's/.*~~/>/'  Ligula_Syamozero24_GLCF01.1.fsa.transdecoder.pep >Ligula_Syamozero24_GLCF01.1.fsa.transdecoder.clean.pep`
`sed -e 's/.*~~/>/'  Abr_Inf_Syamozero24_GLCE01.1.fsa.transdecoder.pep >Abr_Inf_Syamozero24_GLCE01.1.fsa.transdecoder.clean.pep`
`sed -e 's/.*~~/>/'  Abr_Uninf_Syamozero24_GLCG01.1.fsa.transdecoder.pep >Abr_Uninf_Syamozero24_GLCG01.1.fsa.transdecoder.clean.pep`

The following code was used to shorten fasta headers to 50 symbols:
`sed -n '/>.*/{s/^\(.\{50\}\).*/\1/g;p}' Control_fish_transcripts.fasta.transdecoder.pep >Control_fish_transcripts.fasta.transdecoder.shortnames.pep`
