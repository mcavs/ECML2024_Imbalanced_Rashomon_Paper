# "An Evaluation Study on the Rashomon Effect of Balancing Methods in Imbalanced Classification" 

1. Install the essential packages [packages.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/packages.R)
2. Import datasets [import_datasets.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/import_dataset.R)
3. Run the essential functions to calculate Rashomon metrics [ambiguity.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/ambiguity.R) and [discrepancy.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/discrepancy.R)
4. Run the `balance()` function to balance the imbalanced datasets [balance.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/balance.R)
5. Run the `rashomon_set()` function to create a Rashomon set for a dataset [rashomon_set.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/rashomon_set.R)
6. Run the experiments on the datasets for various resampling ratios [experiments.R](https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/experiments.R)

## Plots

### 1. Figure 2: The zone plot of the Rashomon metrics ambiguity and discrepancy for different balancing methods and various resampling ratios.
The zones show two-dimensional regions where metrics’ values are dense. The value of 1.25 means the frequency of the majority class over the frequency of the
minority class. Zones being close to zero on both axes indicate low severity of multiplicity, and moving away from them indicates increasing severity of multiplicity.

<img src="https://github.com/mcavs/ECML2024_Imbalanced_Rashomon_Paper/blob/main/plots/plot1.png" width="800">

