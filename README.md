# "An Evaluation Study on the Rashomon Effect of Balancing Methods in Imbalanced Classification" 

1. Install the essential packages [packages.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/packages.R)
2. Import datasets [import_datasets.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/import_dataset.R)
3. Run the essential functions to calculate Rashomon metrics [ambiguity.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/ambiguity.R) and [discrepancy.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/discrepancy.R)
4. Run the `balance()` function to balance the imbalanced datasets [balance.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/balance.R)
5. Run the `rashomon_set()` function to create a Rashomon set for a dataset [rashomon_set.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/rashomon_set.R)
6. Run the experiments on the datasets for various resampling ratios [experiments.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/experiments.R)

## Plots

### Figure 2 
The zone plot of the Rashomon metrics ambiguity and discrepancy for different balancing methods and various resampling ratios. The zones show two-dimensional regions where metrics’ values are dense. The value of 1.25 means the frequency of the majority class over the frequency of the minority class. Zones being close to zero on both axes indicate low severity of multiplicity, and moving away from them indicates increasing severity of multiplicity.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/plot1.png" width="800">

Run [performance_gain_plot.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/performance_gain_plot.R) to reproduce `Figure 2`.


### Figure 3 
The distribution plots of the Rashomon metrics ambiguity and discrepancy for different balancing methods. The plots consist of the results of the statistical tests Kruskal Wallis and Dunn’s Pairwise tests. The reference bars above each violin indicate statistically significant differences between the medians of groups and the corresponding statistical information.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/comparison_amb_disc.png" width="800">

Run [performance_gain_plot.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/performance_gain_plot.R) to reproduce `Figure 3`.


### Figure 4 
The distribution plots of the Rashomon metric variable importance order discrepancy for different balancing methods. The plots consist of the results of the only Kruskal-Wallis test. Because there is no difference between groups, no need to conduct any pairwise comparison test.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/VIO_disc.png" width="800">

Run [VI_disc_plot.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/VI_disc_plot.R) to reproduce `Figure 4`.


### Figure 5
The distribution plots of the Rashomon metric variable importance order discrepancy for different balancing methods and varying partial resampling ratios.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/partial_resampling_plot.png" width="800">

Run [partial_resampling_plots.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/partial_resampling_plots.R) to reproduce `Figure 5`.


### Figure 6
The performance gain plots of ambiguity, discrepancy, variable importance order discrepancy for different balancing methods and varying partial resampling ratios. The horizontal axis shows the performance gain in terms of AUC. The zero indicates no gain, and the negative values indicate the performance loss. The vertical axes are limited between zero and one for ambiguity and discrepacny, but it is between minus one and one for variable importance order discrepancy. The moving of the zones towards the positive way on the horizontal axis indicates an increase in performance gain, and moving towards the negative way on the vertical axis indicates a decrease in the multiplicity.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/performance_gain_plot.png" width="800">

Run [performance_gain_plot.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/performance_gain_plot.R) to reproduce `Figure 6`.



