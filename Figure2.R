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
library(RColorBrewer)
library(ggalt)
library(gridExtra)
library(readr)

data_rashomon                  <- read_csv("data_rashomon.csv")
data_rashomon$resampling_ratio <- paste0("resampling ratio = ", 
                                         data_rashomon$resampling_ratio)
data_rashomon$balancing_method <- factor(data_rashomon$balancing_method,
                                         levels = c("Original", 
                                                    "Undersampling", 
                                                    "Near miss", 
                                                    "Oversampling", 
                                                    "SMOTE"))

ggplot(data_rashomon, aes(x   = obscurity, 
                          y   = discrepancy, 
                          col = balancing_method)) +
  geom_point(size  = 1, 
             alpha = 0.8) +
  xlim(c(0, 0.4)) + 
  labs(x    = "obscurity", 
       y    = "discrepancy", 
       col  = "", 
       fill = "") +
  theme_bw() + 
  theme(legend.position = "top",
        axis.text.x  = element_text(size = 18),    
        axis.text.y  = element_text(size = 18),    
        axis.title.x = element_text(size = 18),   
        axis.title.y = element_text(size = 18),
        strip.text.x = element_text(size = 18),
        legend.text  = element_text(size = 18)) + 
  geom_density_2d(aes(group  = balancing_method, 
                      col    = balancing_method), 
                  alpha      = 0.5, 
                  linewidth  = 0.2) + 
  geom_encircle(aes(fill     = balancing_method), 
                s_shape      = 2, 
                expand       = 0, 
                spread       = 0.02, 
                alpha        = 0.2, 
                show.legend  = TRUE) + 
  scale_color_brewer(palette = "Set1") +
  scale_fill_brewer(palette  = "Set1") +
  facet_wrap(~ resampling_ratio, 
             ncol = 1)
# ---------------------------------------------------------------------------------------------------------------
