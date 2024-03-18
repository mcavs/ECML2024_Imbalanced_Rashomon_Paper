library(ggplot2)
library(MetBrewer)
library(ggalt)
library(gridExtra)

#data_rash$ic <- paste0("resampling ratio = ", data_rash$ic)

plot1 <- ggplot(data_rash, aes(x = ambiguity, y = discrepancy, col = balancing_method)) +
  geom_point(size = 1, alpha = 0.7) +
  xlim(c(0, 0.4)) + 
  labs(x = "ambiguity", y = "discrepancy", col = "", fill = "") +
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
  facet_wrap(~resampling_ratio, ncol = 1)

#####################
library(tidyr)
data_long <- data_rash |>
  pivot_longer(cols = c(amb, dis), names_to = "type", values_to = "value")

plot2 <- ggplot(data_long, aes(x = value, fill = type, y = met)) + 
  geom_boxplot() + 
  theme_bw() + 
  labs(x = "values", y = "", fill = "") +
  scale_y_discrete(position = "right") + 
  scale_fill_discrete(labels = c("Ambiguity", "Discrepancy")) + 
  theme(legend.position = "top",
        axis.text.x = element_text(size = 12),    
        axis.text.y = element_text(size = 12),    
        axis.title.x = element_text(size = 14),   
        axis.title.y = element_text(size = 14),
        strip.text.x = element_text(size = 14),
        legend.text = element_text(size = 9)) + 
  facet_wrap(~ic, ncol = 1)

####################

grid.arrange(plot1, plot2, ncol = 2)

# plot_grid(plot1, plot2, labels = c('A', 'B'), label_size = 20)



####################
# rss
library(ggplot2)
library(tidyverse)


