# install.packages("ggstatsplot")
library(ggstatsplot)
library(tidyverse)
p1 <- ggbetweenstats(
  data  = data_rash,
  x     = balancing_method,
  y     = ambiguity,
  type  = "nonparametric",
  xlab  = "balancing method",
  ylab  = "ambiguity" 
)

p2 <- ggbetweenstats(
  data  = data_rash,
  x     = balancing_method,
  y     = discrepancy,
  type  = "nonparametric",
  xlab  = "balancing method",
  ylab  = "discrepancy" 
)

combine_plots(
  list(p1, p2),
  plotgrid.args = list(ncol = 2)
  )
)