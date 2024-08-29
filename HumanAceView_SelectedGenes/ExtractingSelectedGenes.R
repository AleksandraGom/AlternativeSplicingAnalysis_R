# Program to extract data for selected genes from gtf file.
# Note ! You should customize the names of folders or files.

# Loading the necessary packages
library(stringr)
library(readxl)
library(dplyr)


# Path to the GTF file 
gtf_file <- "C:/Users/aleks/SUPPA-2.3/HumanAV/AV_ex.gtf"

# Ścieżka do pliku Excel z listą genów
excel_file <- "C:/Users/aleks/SUPPA-2.3/HumanAV/A2.av.xlsx"

# Path to Excel file with list of genes
gene_list <- read_excel(excel_file)

# Extracting gene names from the first column of an Excel file
genes_of_interest <- gene_list$Gene

# Loading a GTF file as a table
gtf_data <- read.table(gtf_file, sep = "\t", header = FALSE, quote = "", stringsAsFactors = FALSE)

#head(gtf_data)

# Extraction of column containing gene and transcript information
info_column <- gtf_data$V9

# Gene_id extraction using regular expressions
gene_ids <- str_match(info_column, 'gene_id "([^"]+)"')[,2]

# Filtering GTF rows based on selected genes
filtered_gtf_data <- gtf_data[gene_ids %in% genes_of_interest, ]

head(filtered_gtf_data)

# Path to save the filtered GTF file (change to your path)
output_gtf_file <- "C:/Users/aleks/SUPPA-2.3/HumanAVGenes/AVGenes_ex.gtf"

# Save the filtered GTF file to disk.
write.table(filtered_gtf_data, file = output_gtf_file, sep = "\t", quote = FALSE, row.names = FALSE, col.names = FALSE)
