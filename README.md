# PHP2550-Project-Portfolio
A portfolio for PHP2550, Practical Data Analysis course projects at Brown University. The language used is R

## Data Privacy
Data used for Project 1 and Project 2 can only be shared with the instructor, students, and TA of this class. The report and code itself can be public as long as it does not contain any raw or identifiable data and instead presents results at a summary level.

## Files
Each folder contains a readme file that describes each project.

- `Project 1`: Code and report for project 1: Exploratory Data Analysis (EDA)
- `Project 2`: Code and report for project 2: Regression Analysis
- `Project 3`: Code and report for project 3: Simulation Studies

## Abstracts

### Project 1
This study investigates the effects of maternal smoking during pregnancy (SDP) and environmental tobacco smoke (ETS) exposure on adolescent self-regulation and behavioral outcomes. We analyzed data from 49 mother-child pairs, evaluating 79 variables related to demographics, smoke exposure, and behavioral assessments. The analysis indicates a correlation between increased SDP/ETS and self-regulation issues, substance use, and externalizing behaviors among adolescents. These associations suggest potential long-term impacts of prenatal and postnatal smoke exposure on child development. The findings, limited by the study's sample size and self-reported data, underline the necessity for future research to confirm these trends.

### Project 2
 \textbf{Aim:} This study aims to develop a model predicting the necessity and timing of tracheostomy in infants with severe Bronchopulmonary Dysplasia (BPD), using a rich dataset from the BPD Collaborative Registry. It examines demographic and clinical variables to identify significant predictors of tracheostomy or death.
 
 \textbf{Method:} Best Subset and Lasso regression were used to select variables for a logistic mixed-effects model, treating center as a random effect. Models were developed for two time points: 36 weeks and 44 weeks. The Brier score and AUC were employed for model assessment.
  
\textbf{Result:} Both best subset and lasso regression models, using a mixed-effects approach, effectively identified factors influencing tracheotomy/death in infants with severe BPD. The Best Subset model at 36 weeks had a Brier Score of 0.0835 and an AUC of 0.8920, while the Lasso model at 44 weeks showed a Brier Score of 0.0923 and an AUC of 0.8853. However, calibration plots indicated some deviation in the 44-week models.
  
\textbf{Conclusions:} The project reveals key factors impacting tracheotomy timing in severe BPD infants, highlighting birth metrics, respiratory support, and pulmonary hypertension medication. However, hese models need to be improved considering logistic regression assumptions such as linearity, outlier influence, and multicollinearity.
  
### Project 3
\textbf{Aim:} This study aims to assess the transportability of a gender-specific risk score model for cardiovascular diseases (CVD), built using data from the Framingham Heart Study (FHS), to the population underlying the NHANES (National Health and Nutrition Examination Survey) survey data through a simulation study. 

\textbf{Method:} The Brier Score is used to measure predictive accuracy for logistic prediction models for men and women based on Framingham data. These models were then applied to both the NHANES population and a simulated NHANES population based on summary statistics, and assessed by Brier score with adjustment for weights. 

\textbf{Result:} The average Brier scores for FHS are 0.1993 for men and 0.1184 for women. When the model is applied to NHANES, the Brier Scores change to 0.2013 for men and 0.1374 for women. The Brier scores for the simulated NHANES data have a mean of 0.2123 with a standard deviation of 0.0263 for men, and a mean of 0.1278 with a standard deviation of 0.0149 for women.

\textbf{Conclusions:} The analysis reveals that the model for women achieves a higher Brier Score than the model for men across all three datasets, suggesting that the transportability of the model is better for women than for men. They highlight the challenges in transporting prediction models across diverse populations, emphasizing the impact of varying covariate distributions on model performance. The transportability of the Brier Score is constrained by two identification conditions. Future research could focus on additional performance metrics, such as the AUC, and on developing methods to better address missing data.

## License
Distributed under the MIT License. 
