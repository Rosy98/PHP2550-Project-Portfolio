# PHP2550-Project-2
## Introduction
This repository is created for Project 2 of PHP2515. This project is a collaboration with Dr. Chris Schmid in the Biostatistics Department, Dr. Robin McKinney and Dr. Jon Levin in the Alpert Medical School. The objective of this project is to do a regression analysis on the data collected by BPD Collaborative Registry. Study participants were drawn from the BPD Collaborative Registry, a multi-center consortium of interdisciplinary BPD programs located in the United States and Sweden formed to address gaps in evidence and promote research to enhance the care of children with severe forms of BPD. The registry includes infants whose gestational age is less than 32 weeks and who have severe bronchopulmonary dysplasia (sBPD) (defined by 2001 NHLBI criteria; specifically, FiO2 3 0.3 or positive pressure ventilation (invasive or non-invasive) at 36-weeks PMA). In the registry, standard demographic and clinical data are collected at four time points: birth, 36 weeks PMA, 44 weeks PMA and discharge.

The goal is to create a regression model to predict the composite outcome of tracheostomy or death, thus guiding to determine the criteria and optimal timing for tracheostomy. Several models will be discussed and compared, including mixed-effects model, best subset selection, and lasso regression and ridge regression. The language used for this project is R.
## Files
- `preprocess.R`:Code to preprocess data, with some variables handled differently than in `data_process_EDA.Rmd`.
- `bestsubset.R`: Code to perform best subset models.
- `lasso.R`: Code to perform lasso models.
- `project2_update.Rmd`: Code and text to generate the updated report.
- `project2_update.pdf`: The updated report.
- `Project2.bib`: Bibliography used for this project.

## Packages
| Package    | Version  |
|------------|----------|
| knitr      | 1.44     |
| car        | 3.1-2    |
| carData    | 3.0-5    |
| MASS       | 7.3-58.2 |
| lme4       | 1.1-34   |
| leaps      | 3.1      |
| L0Learn    | 2.1.0    |
| gtsummary  | 1.7.2    |
| pROC       | 1.18.4   |
| Matrix     | 1.6-1.1  |
| mice       | 3.16.0   |
| lubridate  | 1.9.3    |
| forcats    | 1.0.0    |
| stringr    | 1.5.0    |
| dplyr      | 1.1.3    |
| purrr      | 1.0.2    |
| readr      | 2.1.4    |
| tidyr      | 1.3.0    |
| tibble     | 3.2.1    |
| ggplot2    | 3.4.4    |
| tidyverse  | 2.0.0    |
| kableExtra | 1.3.4    |
| glmmLasso  | 1.6.3    |


## License
Distributed under the MIT License. 
