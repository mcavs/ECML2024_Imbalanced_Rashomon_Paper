# ---------------------------------------------------------------------------------------------------------------
# Figure 2
# ---------------------------------------------------------------------------------------------------------------
# The zone plot of the Rashomon metrics obscurity and discrepancy for different balancing methods and various 
# resampling ratios. The zones show two-dimensional regions where metrics’ values are dense. The value of 1.25 
# means the frequency of the majority class over the frequency of the minority class. Zones being close to zero 
# on both axes indicate low severity of multiplicity, and moving away from them indicates increasing severity 
# of multiplicity.
# ---------------------------------------------------------------------------------------------------------------
library(ggplot2)
library(MetBrewer)
library(ggalt)
library(gridExtra)

data_rashomon$resampling_ratio <- paste0("resampling ratio = ", data_rashomon$resampling_ratio)

ggplot(data_rashomon, aes(x = obscurity, y = discrepancy, col = balancing_method)) +
  geom_point(size = 1, alpha = 0.7) +
  xlim(c(0, 0.4)) + 
  labs(x = "obscurity", y = "discrepancy", col = "", fill = "") +
  theme_bw() + 
  theme(legend.position = "top",
        axis.text.x  = element_text(size = 12),    
        axis.text.y  = element_text(size = 12),    
        axis.title.x = element_text(size = 14),   
        axis.title.y = element_text(size = 14),
        strip.text.x = element_text(size = 14),
        legend.text  = element_text(size = 9)) + 
  geom_density_2d(aes(group = balancing_method, col = balancing_method), alpha = 0.5, linewidth = 0.2) + 
  geom_encircle(aes(fill = balancing_method), s_shape = 2, expand = 0, 
                spread = 0.02, alpha = 0.2, show.legend = TRUE) + 
  facet_wrap(~ resampling_ratio, ncol = 1)
# ---------------------------------------------------------------------------------------------------------------

