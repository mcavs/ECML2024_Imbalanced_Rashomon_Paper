# ---------------------------------------------------------------------------------------------------------------
# Figure 4
# ---------------------------------------------------------------------------------------------------------------
# The distribution plots of the Rashomon metric variable importance order discrepancy for different balancing 
# methods. The plots consist of the results of the only Kruskal-Wallis test. Because there is no difference 
# between groups, no need to conduct any pairwise comparison test.
# ---------------------------------------------------------------------------------------------------------------
library(tidyverse)
library(ggplot2)
library(ggstatsplot)

VI_disc <- VI_disc |> mutate(balancing_methods = as.factor(balancing_methods))
levels(VI_disc$balancing_methods) <- c("Original", "Oversampling", "Undersampling", "Near miss", "SMOTE")

ggplot(VI_disc, aes(x = balancing_methods, y = similarity_values)) + 
  geom_boxplot() + 
  labs(title = "Rashomon VI Discrepancy Plot",
       x = "balancing method",
       y = "similarity score") + 
  coord_flip() + 
  theme_bw()

ggbetweenstats(data = VI_disc,
               x = balancing_methods,
               y = similarity_values,
               type = "nonparametric",
               pairwise.display = "s",
               ylab = "variable importance order discrepancy",
               xlab = "balancing method")
# ---------------------------------------------------------------------------------------------------------------

