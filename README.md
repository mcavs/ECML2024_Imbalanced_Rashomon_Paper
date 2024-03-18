# "An Evaluation Study on the Rashomon Effect of Balancing Methods in Imbalanced Classification" 

1. Install the essential packages [packages.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/packages.R)
2. Import datasets [import_datasets.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/import_dataset.R)
3. Run the essential functions to calculate Rashomon metrics [ambiguity.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/ambiguity.R) and [discrepancy.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/discrepancy.R)
4. Run the `balance()` function to balance the imbalanced datasets [balance.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/balance.R)
5. Run the `rashomon_set()` function to create a Rashomon set for a dataset [rashomon_set.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/rashomon_set.R)
6. Run the experiments on the datasets for various resampling ratios [experiments.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/experiments.R)

## Plots

### Figure 2: The zone plot of the Rashomon metrics ambiguity and discrepancy for different balancing methods and various resampling ratios. The zones show two-dimensional regions where metrics’ values are dense. The value of 1.25 means the frequency of the majority class over the frequency of the minority class. Zones being close to zero on both axes indicate low severity of multiplicity, and moving away from them indicates increasing severity of multiplicity.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/plot1.png" width="800">


### Figure 3: The distribution plots of the Rashomon metrics ambiguity and discrepancy for different balancing methods. The plots consist of the results of the statistical tests Kruskal Wallis and Dunn’s Pairwise tests. The reference bars above each violin indicate statistically significant differences between the medians of groups and the corresponding statistical information.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/comparison_amb_disc.png" width="800">


### Figure 4: The distribution plots of the Rashomon metric variable importance order discrepancy for different balancing methods. The plots consist of the results of the only Kruskal-Wallis test. Because there is no difference between groups, no need to conduct any pairwise comparison test.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/VIO_disc.png" width="800">


### Figure 5: The distribution plots of the Rashomon metric variable importance order discrepancy for different balancing methods and varying partial resampling ratios.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/partial_resampling_plot.png" width="800">


### Figure 6: The performance gain plots of ambiguity, discrepancy, variable importance order discrepancy for different balancing methods and varying partial resampling ratios. The horizontal axis shows the performance gain in terms of AUC. The zero indicates no gain, and the negative values indicate the performance loss. The vertical axes are limited between zero and one for ambiguity and discrepacny, but it is between minus one and one for variable importance order discrepancy. The moving of the zones towards the positive way on the horizontal axis indicates an increase in performance gain, and moving towards the negative way on the vertical axis indicates a decrease in the multiplicity.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/performance_gain_plot.png" width="800">

> library(readr)
> data_rash     <- read_csv("data_rash.csv")
> data_rashomon <- read_csv("data_rashomon.csv")
> auc_performance_gain <- numeric()
> for (i in seq(1, nrow(data_rash), by = 5)) {
>  auc_performance_gain <- c(auc_performance_gain, data_rash$auc[(i + 1) : min(i + 4, nrow(data_rash))] - data_rash$auc[i])}

> data_performance_gain <- data_rash |>
> filter(balancing_method != "Original") |>
> cbind(auc_performance_gain)

> library(MetBrewer)
> library(ggalt)
> library(gridExtra)
> library(ggplot2)
> library(ggpubr)

> data_performance_gain$resampling_ratio <- paste0("resampling ratio = ", data_performance_gain$resampling_ratio)
> names(VI_disc)[2] <- "balancing_method"
> names(VI_disc)[4] <- "resampling_ratio"
> VI_disc$resampling_ratio <- paste0("resampling ratio = ", VI_disc$resampling_ratio)
> VI_disc2 <- VI_disc |> filter(balancing_method != "Original")
> data_performance_gain2 <- data_performance_gain |> left_join(VI_disc2)
>
> p1 <- ggplot(data_performance_gain2, aes(x     = auc_performance_gain,
>                                          y     = ambiguity,
>                                          color = balancing_method)) +
>   geom_point() +
>   ylim(0, 1) +
>   facet_wrap(~resampling_ratio, nrow = 6) +
>   geom_density_2d(aes(group = balancing_method, col = balancing_method), alpha = 0.5, linewidth = 0.2) +
>   geom_encircle(aes(fill = balancing_method), s_shape = 2, expand = 0,
>                 spread = 0.02, alpha = 0.2, show.legend = TRUE) +
>   scale_fill_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
>   scale_color_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
>   labs(x = "AUC performance gain",
>        color = "",
>        fill = "") +
>   theme_bw()
>
> p2 <- ggplot(data_performance_gain2, aes(x     = auc_performance_gain,
>                                        y     = discrepancy,
>                                        color = balancing_method)) +
> geom_point() +
> ylim(0, 1) +
> facet_wrap(~resampling_ratio, nrow = 6) +
> geom_density_2d(aes(group = balancing_method, col = balancing_method), alpha = 0.5, linewidth = 0.2) +
> geom_encircle(aes(fill = balancing_method), s_shape = 2, expand = 0,
>               spread = 0.02, alpha = 0.2, show.legend = TRUE) +
> scale_fill_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
> scale_color_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
> labs(x = "AUC performance gain",
>      color = "",
>      fill = "") +
> theme_bw()
>
> p3 <- ggplot(data_performance_gain2, aes(x     = auc_performance_gain,
>                                        y     = similarity_values,
>                                        color = balancing_method)) +
> geom_point() +
> ylim(-1, 1) +
> facet_wrap(~resampling_ratio, nrow = 6) +
> geom_density_2d(aes(group = balancing_method, col = balancing_method), alpha = 0.5, linewidth = 0.2) +
> geom_encircle(aes(fill = balancing_method), s_shape = 2, expand = 0,
>               spread = 0.02, alpha = 0.2, show.legend = TRUE) +
> scale_fill_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
> scale_color_discrete(limits = c("Undersampling", "Near miss", "Oversampling", "SMOTE")) +
> labs(x = "AUC performance gain",
>      y = "variable importance order discrepancy",
>      color = "",
>      fill = "") +
> theme_bw()
>
> ggarrange(p1, p2, p3, ncol = 3, common.legend = TRUE, legend = "top")

