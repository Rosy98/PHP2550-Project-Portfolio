# PHP2550-Project-3
## Introduction
This repository is created for Project 3 of PHP2515. This project is a collaboration with Dr. Jon Steingrimsson in the Biostatistics Department. The objective of this project is to compare simulation-based to data-based analysis of a prediction model. In the healthcare system, these prediction models are desired to be deployed to identify individuals at high risk for certain diseases across different populations. The data used to develop the model, referred to as the source study data, often come from randomized trials, large observational databases, or prospective cohort studies. However, these sources may not represent random samples of the target population, leading to potential disparities in data distribution. This discrepancy makes it difficult to derive the accurate assessment of a model's performance on the target population, as performance metrics derived from the source population may not translate directly to the target population.

Two datasets are used in this project: Framingham Heart Study and National Health and Nutrition Examination Survey (NHANES) population. The models are developed using data from Framingham and then evaluate its transportability to the NHANES population and simulated NHANES dataset. The outcome data CVD is not available in the NHANES cohort. Brier Score is used for this tranportability analysis evaluation (Steingrimsson et al., 2023).

The language used for this project is R.

## Files
- `project3.R`: Code to preprocess data and basic exploratory data analysis.
- `project3.bib`: Bibliography used for this project.
- `project3_updated.R`: An extended version of `project3.R` containing additional exploratory data analysis (EDA) code.
- `project3_updated.Rmd`: Code and text to generate the updated report based on feedback.
- `project3_updated.pdf`: The updated report.
- `Data`
  - `framingham_df.RData`: The cleaned Framingham data.
  - `df_2017.RData`: The cleaned NHANES data.
  - `brier_scores.RData`: Results data of simulation.

## Packages
| Package    | Version  |
|------------|----------|
| tidyverse  | 2.0.0    |
| ggplot2    | 3.4.4    |
| ggpubr     | 0.6.0    |
| tableone   | 0.13.2   |
| gtsummary  | 1.7.2    |
| pROC       | 1.18.5   |
| mice       | 3.16.0   |
| MASS       | 7.3-58.2 |
| DescTools  | 0.99.50  |
| stringr    | 1.5.0    |
| dplyr      | 1.1.3    |
| knitr      | 1.45     |
| tidyr      | 1.3.0    |
| forcats    | 1.0.0    |
| kableExtra | 1.3.4    |

## License
Distributed under the MIT License. 
