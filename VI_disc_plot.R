# VI_disc_plot

library(readr)
VI_disc <- read_csv("/Volumes/LaCie/Imbalanced Rashomon/VI_disc.csv")

library(tidyverse)
VI_disc <- VI_disc |> mutate(balancing_methods = as.factor(balancing_methods))
levels(VI_disc$balancing_methods) <- c("Original", "Oversampling", "Undersampling", "Near miss", "SMOTE")

library(ggplot2)
ggplot(VI_disc, aes(x = balancing_methods, y = similarity_values)) + 
  geom_boxplot() + 
  labs(title = "Rashomon VI Discrepancy Plot",
       x = "balancing method",
       y = "similarity score") + 
  coord_flip() + 
  theme_bw()

library(ggstatsplot)
ggstatsplot::ggbetweenstats(data = VI_disc,
                            x = balancing_methods,
                            y = similarity_values,
                            type = "nonparametric",
                            pairwise.display = "s",
                            ylab = "variable importance order discrepancy",
                            xlab = "balancing method")

## Mann-Whitney U test (nonparametric test)
# ikili 
ggwithinstats(
  data = VI_disc |> filter(balancing_methods %in% c("Original", "Oversampling")),
  x = balancing_methods,
  y = similarity_values,
  xlab = "",
  ylab = "Variable Importance Discrepancy",
  type = "np",
  conf.level = 0.99,
  title = "Non-parametric Test",
  package = "ggsci",
  palette = "uniform_startrek")

ggwithinstats(
  data = VI_disc |> filter(balancing_methods %in% c("Original", "Undersampling")),
  x = balancing_methods,
  y = similarity_values,
  xlab = "",
  ylab = "Variable Importance Discrepancy",
  type = "np",
  conf.level = 0.99,
  title = "Non-parametric Test",
  package = "ggsci",
  palette = "uniform_startrek")

ggwithinstats(
  data = VI_disc |> filter(balancing_methods %in% c("Original", "Near miss")),
  x = balancing_methods,
  y = similarity_values,
  xlab = "",
  ylab = "Variable Importance Discrepancy",
  type = "np",
  conf.level = 0.99,
  title = "Non-parametric Test",
  package = "ggsci",
  palette = "uniform_startrek")

ggwithinstats(
  data = VI_disc |> filter(balancing_methods %in% c("Original", "SMOTE")),
  x = balancing_methods,
  y = similarity_values,
  xlab = "",
  ylab = "Variable Importance Discrepancy",
  type = "np",
  conf.level = 0.99,
  title = "Non-parametric Test",
  package = "ggsci",
  palette = "uniform_startrek")

# tüm gruplar
## Mann-Whitney U test (nonparametric test)
ggwithinstats(
  data = VI_disc,
  x = balancing_methods,
  y = similarity_values,
  xlab = "",
  ylab = "Variable Importance Discrepancy",
  type = "np",
  conf.level = 0.99,
  title = "Non-parametric Test",
  package = "ggsci",
  palette = "uniform_startrek")

