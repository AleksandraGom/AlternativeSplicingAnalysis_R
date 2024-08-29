# A program to calculate the number of detected splicing events.
# Note ! You should customize the names of folders or files.

# Loading the necessary packages
library(readxl)
library(ggplot2)
library(dplyr)
library(viridis)


# Path to excel files folder
folder_path <- "C:/Users/aleks/SUPPA-2.3/HumanGencode"  

# Downloading a list of files in a folder
files <- list.files(path = folder_path, pattern = "HumanGencode\\d+_(A3|A5|AF|AL|MX|RI|SE)_strict\\.xlsx$", full.names = TRUE)

# Initializing data frame to store results
results <- data.frame(File = character(), RowCount = integer(), Version = character(), EventType = character(), stringsAsFactors = FALSE)

# Processing of each file
for (file in files) {
  # Extract the version number and event type from the file name
  version <- sub(".*HumanGencode(\\d+)_.*", "\\1", basename(file))
  event_type <- sub(".*HumanGencode\\d+_(A3|A5|AF|AL|MX|RI|SE)_strict.*", "\\1", basename(file))
  label <- paste("Wydanie", version)
  
  # Loading Excel file (we assume that we are interested in the first tab)
  data <- read_excel(file, sheet = 1)
  
  # Counting the number of rows
  row_count <- nrow(data)
  
  # Adding the result to the data frame
  results <- rbind(results, data.frame(File = basename(file), RowCount = row_count, Version = label, EventType = event_type, stringsAsFactors = FALSE))
}

print(results)


# Creating a chart
plot <- ggplot(data = results, aes(x = Version, y = RowCount, fill = EventType)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  theme_minimal() +
  labs(title = "Alternatywne zdarzenia splicingu",
       x = NULL,  
       y = "Liczba wykrytych zdarzeń") +
  scale_fill_viridis_d()  +
  scale_y_continuous(labels = scales::comma, breaks = seq(0, max(results$RowCount), by = 25000))+
  theme(
    plot.title = element_text(hjust = 0.5, size = 20, face = "bold", margin = margin(b = 20)),  
    axis.text.x = element_text(angle = 45, hjust = 1, size = 15, color = "black"),  
    axis.title.x = element_blank(),
    axis.text.y = element_text(size = 12, color = "black"),  
    axis.title.y = element_text(hjust = 0.5, size = 20, face = "bold", margin = margin(t = 0, r = 30, b = 0, l = 0)),  
    legend.title = element_blank(),
    legend.text = element_text(size = 12)
  )

# Displaying the chart
print(plot)

# Saving the chart to a PNG file 
png("liczba_zdarzeń_all.png", width = 800, height = 600, units = "px")
print(plot)
dev.off()
