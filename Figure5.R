# ---------------------------------------------------------------------------------------------------------------
# Figure 5
# ---------------------------------------------------------------------------------------------------------------
# The distribution plots of the Rashomon metric variable importance order discrepancy for different balancing 
# methods and varying partial resampling ratios.
# ---------------------------------------------------------------------------------------------------------------
library(tidyr)
library(tidyverse)
library(ggplot2)

data_VIDisc2 <- data_VIDisc |> left_join(data_rashomon)

data_long <- data_VIDisc2 |>
  pivot_longer(cols = c(ambiguity, discrepancy, VIOdiscrepancy), names_to = "type", values_to = "value")

data_long$resampling_ratio <- paste0("resampling ratio = ", data_long$resampling_ratio)

ggplot(data_long, aes(x = value, y = balancing_method, fill = balancing_method)) + 
  geom_boxplot(staplewidth = 0.8) + 
  theme_bw() + 
  labs(x = "values", y = "", fill = "") +
  scale_y_discrete(limits = c("SMOTE", "Oversampling", "Near miss", "Undersampling", "Original")) +
  theme(legend.position = "none",
        axis.text.x   = element_text(size = 12),    
        axis.text.y   = element_text(size = 12),    
        axis.title.x  = element_text(size = 12),   
        axis.title.y  = element_text(size = 12),
        strip.text.x  = element_text(size = 12),
        strip.text.y  = element_text(size = 11)) + 
  facet_grid(resampling_ratio ~ type, scales = "free_x")
# ---------------------------------------------------------------------------------------------------------------
