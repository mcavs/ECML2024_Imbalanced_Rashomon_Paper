# ---------------------------------------------------------------------------------------------------------------
# Figure 3
# ---------------------------------------------------------------------------------------------------------------
# The distribution plots of the Rashomon metrics obscurity and discrepancy for different balancing methods. The 
# plots consist of the results of the statistical tests Kruskal Wallis and Dunn’s Pairwise tests. The reference 
# bars above each violin indicate statistically significant differences between the medians of groups and the 
# corresponding statistical information.
# ---------------------------------------------------------------------------------------------------------------
library(ggstatsplot)
library(tidyverse)
p1 <- ggbetweenstats(
  data                  = data_rashomon,
  x                     = balancing_method,
  y                     = obscurity,
  type                  = "nonparametric",
  xlab                  = "balancing method",
  ylab                  = "obscurity",
  package               = "RColorBrewer",
  palette               = "Set1",
  ggplot.component      = list(theme(text               = element_text(size = 18),
                                     plot.subtitle      = element_text(size = 18),
                                     axis.title.y.right = element_blank(),
                                     axis.title.x       = element_blank(),
                                     axis.text.x        = element_blank())),
  ggsignif.args         = list(textsize                 = 3, 
                               tip_length               = 0.02),
  centrality.label.args = list(size                     = 5))

p2 <- ggbetweenstats(
  data                    = data_rashomon,
  x                       = balancing_method,
  y                       = discrepancy,
  type                    = "nonparametric",
  xlab                    = "balancing method",
  ylab                    = "discrepancy",
  package                 = "RColorBrewer",
  palette                 = "Set1",
  ggplot.component        = list(theme(text               = element_text(size = 18),
                                       plot.subtitle      = element_text(size = 18),
                                       axis.title.y.right = element_text(size = 18))),
  ggsignif.args           = list(textsize                 = 3, 
                                 tip_length               = 0.02),
  centrality.label.args   = list(size                     = 5)) + 
  scale_x_discrete(labels = c("Original", 
                              "Undersampling", 
                              "Near miss", 
                              "Oversampling", 
                              "SMOTE"))

combine_plots(
  list(p1, p2),
  plotgrid.args = list(ncol = 1))
# ---------------------------------------------------------------------------------------------------------------
