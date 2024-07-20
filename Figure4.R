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

ggbetweenstats(data = data_VIDisc,
               x    = balancing_method,
               y    = similarity_value,
               type = "nonparametric",
               pairwise.display = "s",
               ylab = "variable importance order discrepancy",
               xlab = "balancing method",
               ggplot.component = list(theme(text               = element_text(size = 18),
                                             plot.subtitle      = element_text(size = 18),
                                             axis.title.y.right = element_text(size = 18))),
               ggsignif.args = list(textsize = 3, tip_length    = 0.02),
               centrality.label.args = list(size = 5)) + 
  scale_x_discrete(labels = c("Original", 
                              "Undersampling", 
                              "Near miss", 
                              "Oversampling", 
                              "SMOTE"))
# ---------------------------------------------------------------------------------------------------------------

