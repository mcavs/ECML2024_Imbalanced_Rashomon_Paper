# ---------------------------------------------------------------------------------------------------------------
# Figure 5
# ---------------------------------------------------------------------------------------------------------------
# The distribution plots of the Rashomon metric variable importance order discrepancy for different balancing 
# methods and varying partial resampling ratios.
# ---------------------------------------------------------------------------------------------------------------
# Load necessary packages
library(tidyr)
library(tidyverse)
library(ggplot2)
library(RColorBrewer)
library(readr)
library(grid)
library(scales)  # Required for label_number()

# Read the data
data_VIDisc   <- read_csv("data_VIDisc.csv")
data_rashomon <- read_csv("data_rashomon.csv")
data_VIDisc2  <- data_VIDisc |> left_join(data_rashomon)

# Convert to long format
data_long <- data_VIDisc2 |>
  pivot_longer(cols = c(obscurity, 
                        discrepancy, 
                        similarity_value),
               names_to  = "type", 
               values_to = "value")

# Change the type label from 'similarity_value' to 'VIOdiscrepancy'
data_long$type <- recode(data_long$type,
                         similarity_value = "VIOdiscrepancy")

# Define color palette
color_palette <- brewer.pal(n.   = 5, 
                            name = "Set1")
names(color_palette) <- c("Original", 
                          "Undersampling", 
                          "Near miss", 
                          "Oversampling", 
                          "SMOTE")

# Create the plot
ggplot(data_long, aes(x    = value, 
                      y    = balancing_method, 
                      fill = balancing_method)) + 
  geom_boxplot(staplewidth = 0.8) + 
  theme_bw() + 
  labs(x    = "values", 
       y    = "", 
       fill = "") +
  scale_y_discrete(limits = c("SMOTE", 
                              "Oversampling", 
                              "Near miss", 
                              "Undersampling", 
                              "Original")) +
  scale_x_continuous(labels = function(x) {
    label_number(accuracy = 0.1)(x)
  }) +
  theme(legend.position = "none",
        axis.text.x     = element_text(size = 18),    
        axis.text.y     = element_text(size = 18),    
        axis.title.x    = element_text(size = 18),   
        axis.title.y    = element_text(size = 18),
        strip.text.x    = element_text(size = 18),
        strip.text.y    = element_text(size = 18)) + 
  scale_fill_manual(values = color_palette) +
  facet_grid(resampling_ratio ~ type, 
             scales = "free_x") + 
  theme(panel.spacing.y = unit(2, 'points'),
        panel.spacing.x = unit(20, 'points'))
# ---------------------------------------------------------------------------------------------------------------
