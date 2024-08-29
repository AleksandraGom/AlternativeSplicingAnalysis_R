# Program to calculate the number of transcripts for each event
# Note ! You should customize the names of folders or files.

# Loading the necessary packages
library(readxl)
library(ggplot2)
library(dplyr)
library(viridis)


# Path to excel files folder
folder_path <- "C:/Users/aleks/SUPPA-2.3/HumanAVGenes"

# Downloading a list of files in a folder
files <- list.files(path = folder_path, pattern = "HumanAVG(ex)?_SE_strict\\.xlsx$", full.names = TRUE)

# Initializing data frame to store results
all_data <- data.frame()


# Processing of each file
for (file in files) {
  # Loading Excel file (we assume that we are interested in the first tab and that the first row is the header)
  data <- read_excel(file, sheet = 1)
  
  # Adding a release column based on file name
  version <- ifelse(grepl("HumanAVGex", basename(file)), "Wersja rozszerzona", "Wersja podstawowa")
  data$Version <- version
  
  # Calculating the number of alternative transcripts for each event
  data <- data %>%
    mutate(AltTranscriptCount = sapply(strsplit(alternative_transcripts, ","), length))
  
  # Adding to all_data
  all_data <- bind_rows(all_data, data)
}


# Selecting a color from the viridis palette
selected_color = "#440154"

# Creating a violin chart
plot_violin <- ggplot(all_data, aes(x = Version, y = AltTranscriptCount)) +
  geom_violin(fill = selected_color, color = "black", show.legend = FALSE) +
  theme_minimal() +
  labs(title = "Pominięcie eksonu",
       y = "Liczba alternatywnych transkryptów") +
  scale_y_log10() +
  scale_fill_grey(start = 0.2, end = 0.8) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 30, face = "bold", margin = margin(b = 20)),
    axis.text.x = element_text(angle = 0, hjust = 0.5, size = 25, color = "black"),
    axis.title.x = element_blank(),
    axis.text.y = element_text(size = 25, color = "black"),
    axis.title.y = element_blank(),
    legend.position = "none"

  )

# Displaying the violin chart
print(plot_violin)

# Saving the violin chart to a PNG file
png("violin_plot_SE.png", width = 800, height = 600, units = "px")
print(plot_violin)
dev.off()