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
  data  = data_rashomon,
  x     = balancing_method,
  y     = obscurity,
  type  = "nonparametric",
  xlab  = "balancing method",
  ylab  = "obscurity")

p2 <- ggbetweenstats(
  data  = data_rashomon,
  x     = balancing_method,
  y     = discrepancy,
  type  = "nonparametric",
  xlab  = "balancing method",
  ylab  = "discrepancy")

combine_plots(
  list(p1, p2),
  plotgrid.args = list(ncol = 2))
# ---------------------------------------------------------------------------------------------------------------
