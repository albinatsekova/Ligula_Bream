## packages
library(openxlsx)

add_annotation_to_names <- function(sample_name) {
#  ## get names
#  ## the whole list
  cleaned_by_NCBI <- data.frame(query = readLines(paste0(sample_name, ".names.txt")))
  cleaned_by_NCBI$query <- gsub(">", "",cleaned_by_NCBI$query)
  
  ## get eggNOG annotation
  #remove .px from the proteins to match transcript names
  kv <- read.xlsx(paste0(sample_name, "_out.emapper.annotations.xlsx"), startRow = 3)
  kv$query <- gsub("\\.p.", "", kv$query)
  

  kv2 <- kv[ ,c("query", "Preferred_name", "Description")]
  
  kv2 <- merge(kv2, cleaned_by_NCBI, all = TRUE)

  #remove NAs
  kv2$Preferred_name[is.na(kv2$Preferred_name)] <- ""
  kv2$Description[is.na(kv2$Description)] <- ""
  
  ## make the transcript names shorter (NCBI only allows 50 symbols)
  kv2$short_query <- gsub("\\..*", "", kv2$query)
  kv2$short_query <- gsub("length", "len", kv2$short_query)
  
  ## get rid of non-accepted symbols
  kv2$Annotation <- paste(kv2$Preferred_name, kv2$Description, sep="_")
  kv2$Annotation <- gsub("\\,", "", kv2$Annotation)
  kv2$Annotation <- gsub("\\[", "", kv2$Annotation)
  kv2$Annotation <- gsub("\\]", "", kv2$Annotation)
  kv2$Annotation <- gsub("\\'", "", kv2$Annotation)
  
  ## combine names and annotations 
  kv2$Name <- paste(kv2$short_query, kv2$Annotation, sep = "_")
  ## and shorten the results
  kv2$Name <- substr(kv2$Name, 1, 50)
  
  ## write out transcripts for filtering by name with seqkit
#  writeLines(kv2$query, paste0(sample_name, "transcripts_for_TSA_submission_names.txt"))
  
  ## write out table for seqkit -kv
  write.table(kv2[, c("query", "Name")], paste0(sample_name, "_annotated_transcripts.tsv"),  
              col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")
  }

add_annotation_to_names("Control_fish")
add_annotation_to_names("Infected_fish")
add_annotation_to_names("Ligula")
