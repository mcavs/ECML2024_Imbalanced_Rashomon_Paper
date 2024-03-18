# 02.03.2024
# RQ3 partial resampling
library(tidyr)
library(tidyverse)
library(ggplot2)
# names(VI_disc)[2] <- "balancing_method"
# names(VI_disc)[4] <- "resampling_ratio"
# VI_disc2 <- VI_disc |> left_join(data_rash)
names(VI_disc2)[3] <- "VIOdiscrepancy"
data_long <- VI_disc2 |>
  pivot_longer(cols = c(ambiguity, discrepancy, VIOdiscrepancy), names_to = "type", values_to = "value")

#data_long$resampling_ratio <- paste0("resampling ratio = ", data_long$resampling_ratio)

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
