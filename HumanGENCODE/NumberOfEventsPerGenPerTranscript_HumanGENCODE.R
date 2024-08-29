# Program to calculate the number of detected splicing events normalized per gene and per transcript.
# Note ! You should customize the names of folders or files.

# Loading the necessary packages
library(readxl)
library(ggplot2)
library(dplyr)
library(viridis)

# Path to excel files folder
folder_path <- "C:/Users/aleks/SUPPA-2.3/HumanGencode"  

# Downloading a list of files in a folder
files <- list.files(path = folder_path, pattern = "HumanGencode\\d+_A3_strict\\.xlsx$", full.names = TRUE)

# Initializing data frame to store results
results <- data.frame(File = character(), RowCount = integer(), Version = character(), Genes = integer(), Transcripts = integer(), stringsAsFactors = FALSE)

# Dictionary with number of genes and transcripts for each release
gene_transcript_counts <- list(
  "21" = list(Genes = 60155, Transcripts = 196327),
  "26" = list(Genes = 58219, Transcripts = 199325),
  "31" = list(Genes = 60603, Transcripts = 226882),
  "36" = list(Genes = 60660, Transcripts = 232117),
  "41" = list(Genes = 61852, Transcripts = 251236),
  "46" = list(Genes = 63086, Transcripts = 254070)
)

# Processing of each file
for (file in files) {
  # Extract the version number from the file name
  version <- sub(".*HumanGencode(\\d+)_A3_strict.*", "\\1", basename(file))
  label <- paste("Wydanie", version)
  
  # Loading Excel file (we assume that we are interested in the first tab)
  data <- read_excel(file, sheet = 1)
  
  # Counting the number of rows
  row_count <- nrow(data)
  
  # Get the number of genes and transcripts for the current release
  genes <- gene_transcript_counts[[version]]$Genes
  transcripts <- gene_transcript_counts[[version]]$Transcripts
  
  # Adding the result to the data frame
  results <- rbind(results, data.frame(File = basename(file), RowCount = row_count, Version = label, Genes = genes, Transcripts = transcripts, stringsAsFactors = FALSE))
}

# Calculate the number of events per gene and per transcript
results$EventsPerGene <- results$RowCount / results$Genes
results$EventsPerTranscript <- results$RowCount / results$Transcripts

#print(results)

# Convert data to long format for ggplot2
results_long <- melt(results, id.vars = "Label", measure.vars = c("EventsPerGene", "EventsPerTranscript"),
                     variable.name = "Metric", value.name = "Value")

# Definition of colors from the viridis palette
colors <- c("#33638D", "#440154")

# Creating a chart
plot_combined <- ggplot(data = results_long, aes(x = Version, y = Value, fill = Metric)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  theme_minimal() +
  labs(title = "Alternatywne miejsce splicingu 3'",
       x = NULL,  
       y = "Liczba wykrytych zdarzeń") +
  scale_fill_manual(values = setNames(colors, c("EventsPerGene", "EventsPerTranscript")),
                    labels = c("EventsPerGene" = "zdarzenia/gen", "EventsPerTranscript" = "zdarzenia/transkrypt")) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 30, face = "bold", margin = margin(b = 20)),  
    axis.text.x = element_text(angle = 45, hjust = 1, size = 25, color = "black"),  
    axis.title.x = element_blank(),  # Usuń podpis osi X
    axis.text.y = element_text(size = 25, color = "black"),  
    axis.title.y = element_blank(),
    legend.position = "none"  
    
  )

# Displaying the chart
print(plot_combined)

# Saving the chart to a PNG file 
png("liczba_zdarzeń_per_gen_i_transkrypt_A3.png", width = 800, height = 600, units = "px")
print(plot_combined)
dev.off()