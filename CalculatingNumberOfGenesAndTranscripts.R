# Program to calculate number of genes and transcripts.
# Note ! You should customize the names of folders or files.


# Loading the necessary packages
library(dplyr)
library(stringr)
library(readxl)

# Path to the GTF file 
gtf_file <- "C:/Users/aleks/SUPPA-2.3/HumanAV/AV_ex.gtf"

# Loading a GTF file as a table
gtf_data <- read.table(gtf_file, sep = "\t", header = FALSE, quote = "", stringsAsFactors = FALSE)


#head(gtf_data)

# Counting the number of rows in a file
num_rows <- nrow(gtf_data)

# Extraction of column containing gene and transcript information
info_column <- gtf_data$V9

# Extraction of gene_id and transcript_id using regular expressions
gene_ids <- str_match(info_column, 'gene_id "([^"]+)"')[,2]
transcript_ids <- str_match(info_column, 'transcript_id "([^"]+)"')[,2]

# Remove NA and count unique values
unique_gene_ids <- unique(gene_ids[!is.na(gene_ids)])
unique_transcript_ids <- unique(transcript_ids[!is.na(transcript_ids)])

# Number of unique genes and transcripts in the filtered file
num_unique_genes <- length(unique_gene_ids)
num_unique_transcripts <- length(unique_transcript_ids)

# Displaying the results
cat("Liczba wierszy w pliku:", num_rows, "\n")
cat("Liczba unikalnych genów (gene_id):", num_unique_genes, "\n")
cat("Liczba unikalnych transkryptów (transcript_id):", num_unique_transcripts, "\n")