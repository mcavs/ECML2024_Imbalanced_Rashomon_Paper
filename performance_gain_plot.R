# 22.02.2024
# performance gain plot
library(readr)
setwd("/Volumes/LaCie/Imbalanced Rashomon")
data_rash     <- read_csv("data_rash.csv")
data_rashomon <- read_csv("data_rashomon.csv")

auc_performance_gain <- numeric()
for (i in seq(1, nrow(data_rash), by = 5)) {
  auc_performance_gain <- c(auc_performance_gain, data_rash$auc[(i + 1) : min(i + 4, nrow(data_rash))] - data_rash$auc[i])}

 data_performance_gain <- data_rash |>
  filter(balancing_method != "Original") |>
  cbind(auc_performance_gain)

library(MetBrewer)
library(ggalt)
library(gridExtra)
library(ggplot2)
library(ggpubr)

# data_performance_gain$resampling_ratio <- paste0("resampling ratio = ", data_performance_gain$resampling_ratio)
names(VI_disc)[2] <- "balancing_method"
names(VI_disc)[4] <- "resampling_ratio"
VI_disc$resampling_ratio <- paste0("resampling ratio = ", VI_disc$resampling_ratio)
VI_disc2 <- VI_disc |> filter(balancing_method != "Original")
data_performance_gain2 <- data_performance_gain |> left_join(VI_disc2)

p1 <- ggplot(data_performance_gain2, aes(x     = auc_performance_gain, 
                                         y     = ambiguity,
                                         color = balancing_method)) +
  geom_point() +
  ylim(0, 1) +
  facet_wrap(~resampling_ratio, nrow = 6) + 
  geom_density_2d(aes(group = balancing_method, col = balancing_method), alpha = 0.5, linewidth = 0.2) + 
  geom_encircle(aes(fill = balancing_method), s_shape = 2, expand = 0, 
                spread = 0.02, alpha = 0.2, show.legend = TRUE) + 
  scale_fill_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
  scale_color_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
  labs(x = "AUC performance gain",
       color = "",
       fill = "") +
  theme_bw() 



p2 <- ggplot(data_performance_gain2, aes(x     = auc_performance_gain, 
                                         y     = discrepancy,
                                         color = balancing_method)) +
  geom_point() +
  ylim(0, 1) +
  facet_wrap(~resampling_ratio, nrow = 6) + 
  geom_density_2d(aes(group = balancing_method, col = balancing_method), alpha = 0.5, linewidth = 0.2) + 
  geom_encircle(aes(fill = balancing_method), s_shape = 2, expand = 0, 
                spread = 0.02, alpha = 0.2, show.legend = TRUE) + 
  scale_fill_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
  scale_color_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
  labs(x = "AUC performance gain",
       color = "",
       fill = "") + 
  theme_bw() 

p3 <- ggplot(data_performance_gain2, aes(x     = auc_performance_gain, 
                                         y     = similarity_values,
                                         color = balancing_method)) +
  geom_point() +
  ylim(-1, 1) +
  facet_wrap(~resampling_ratio, nrow = 6) + 
  geom_density_2d(aes(group = balancing_method, col = balancing_method), alpha = 0.5, linewidth = 0.2) + 
  geom_encircle(aes(fill = balancing_method), s_shape = 2, expand = 0, 
                spread = 0.02, alpha = 0.2, show.legend = TRUE) + 
  scale_fill_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
  scale_color_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
  labs(x = "AUC performance gain",
       y = "variable importance order discrepancy",
       color = "",
       fill = "") + 
  theme_bw() 

ggarrange(p1, p2, p3, ncol = 3, common.legend = TRUE, legend = "top")





















