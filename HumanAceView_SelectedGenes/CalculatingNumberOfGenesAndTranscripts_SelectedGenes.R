# Program to calculate number of genes and transcripts for selected genes.
# Note ! You should customize the names of folders or files.

# Loading the necessary packages
library(dplyr)
library(stringr)
library(readxl)

# Path to the GTF file 
gtf_file <- "C:/Users/aleks/SUPPA-2.3/HumanAV/AV_ex.gtf"
excel_file <- "C:/Users/aleks/SUPPA-2.3/HumanAV/A2.av.xlsx"

# Path to Excel file with list of genes
gene_list <- read_excel(excel_file)

# Extracting gene names from the first column of an Excel file
genes_of_interest <- gene_list$Gene

tail(genes_of_interest)

# Loading a GTF file as a table
gtf_data <- read.table(gtf_file, sep = "\t", header = FALSE, quote = "", stringsAsFactors = FALSE)

#head(gtf_data)


# Counting the number of rows in a file
num_rows <- nrow(gtf_data)

# Extraction of column containing gene and transcript information
info_column <- gtf_data$V9

# Extraction of gene_id and transcript_id using regular expressions
gene_ids <- str_match(info_column, 'gene_id "([^"]+)"')[,2]

# Filtering GTF rows based on selected genes
filtered_gtf_data <- gtf_data[gene_ids %in% genes_of_interest, ]

# Count the number of rows in the filtered file
num_filtered_rows <- nrow(filtered_gtf_data)

# Extraction of gene_id and transcript_id from the filtered file
filtered_gene_ids <- str_match(filtered_gtf_data$V9, 'gene_id "([^"]+)"')[,2]
filtered_transcript_ids <- str_match(filtered_gtf_data$V9, 'transcript_id "([^"]+)"')[,2]

# Remove NA and count unique values
unique_filtered_gene_ids <- unique(filtered_gene_ids[!is.na(filtered_gene_ids)])
unique_filtered_transcript_ids <- unique(filtered_transcript_ids[!is.na(filtered_transcript_ids)])

# Number of unique genes and transcripts in the filtered file
num_unique_filtered_genes <- length(unique_filtered_gene_ids)
num_unique_filtered_transcripts <- length(unique_filtered_transcript_ids)

# Displaying the results
cat("Liczba wierszy w oryginalnym pliku GTF:", num_rows, "\n")
cat("Liczba wierszy w przefiltrowanym pliku GTF:", num_filtered_rows, "\n")
cat("Liczba unikalnych genów (gene_id) w przefiltrowanym pliku:", num_unique_filtered_genes, "\n")
cat("Liczba unikalnych transkryptów (transcript_id) w przefiltrowanym pliku:", num_unique_filtered_transcripts, "\n")