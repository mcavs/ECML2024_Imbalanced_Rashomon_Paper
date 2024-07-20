# 22.02.2024
# performance gain plot
library(readr)
data_rashomon_perf <- read_csv("data_rashomon_perf.csv")
data_rashomon      <- read_csv("data_rashomon.csv")
data_VIDisc        <- read_csv("data_VIDisc.csv")

auc_performance_gain <- numeric()
for (i in seq(1, nrow(data_rashomon_perf), by = 5)) {
  auc_performance_gain <- c(auc_performance_gain, 
                            data_rashomon_perf$auc[(i + 1) : min(i + 4, nrow(data_rashomon_perf))] - data_rashomon_perf$auc[i])}

 data_performance_gain <- data_rashomon_perf |>
  filter(balancing_method != "Original") |>
  cbind(auc_performance_gain)

library(MetBrewer)
library(ggalt)
library(gridExtra)
library(ggplot2)
library(ggpubr)

VI_disc2 <- data_VIDisc |> filter(balancing_method != "Original")
data_performance_gain2 <- data_performance_gain |> left_join(VI_disc2)
data_performance_gain2$resampling_ratio <- paste0("resampling ratio = ", 
                                                  data_performance_gain2$resampling_ratio)

p1 <- ggplot(data_performance_gain2, aes(x     = auc_performance_gain, 
                                         y     = obscurity,
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
  theme_bw() + 
  theme(axis.text.x  = element_text(size = 18),    
        axis.text.y  = element_text(size = 18),    
        axis.title.x = element_text(size = 18),   
        axis.title.y = element_text(size = 18),
        strip.text.x = element_text(size = 18),
        legend.text  = element_text(size = 18))



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
  theme_bw() + 
  theme(axis.text.x  = element_text(size = 18),    
        axis.text.y  = element_text(size = 18),    
        axis.title.x = element_text(size = 18),   
        axis.title.y = element_text(size = 18),
        strip.text.x = element_text(size = 18),
        legend.text  = element_text(size = 18)) 

p3 <- ggplot(data_performance_gain2, aes(x     = auc_performance_gain, 
                                         y     = similarity_value,
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
  theme_bw() + 
  theme(axis.text.x  = element_text(size = 18),    
        axis.text.y  = element_text(size = 18),    
        axis.title.x = element_text(size = 18),   
        axis.title.y = element_text(size = 18),
        strip.text.x = element_text(size = 18),
        legend.text  = element_text(size = 18)) 

ggarrange(p1, p2, p3, ncol = 3, common.legend = TRUE, legend = "top")
