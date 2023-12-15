###################################################### 
#### Best Subset #### 
###################################################### 
library(L0Learn)
library(lme4)

load("mice_train_36.RData")
load("traindata_36.RData")
load("mice_train_44.RData")
load("traindata_44.RData")

bestsubset <- function(df) { 
  #' Runs 10-fold CV for best subset and returns corresponding coefficients 
  #' @param df, data set
  #' @return coef, coefficients for minimum cv error
  
  # Matrix form for ordered variables 
  x.ord <- model.matrix(Y~. , data = df[, -c(1, 2)])[, -1]
  y.ord <- df$Y
  
  # Best subset model
  bestsubset_mod_cv <- L0Learn.cvfit(x.ord, y.ord, penalty="L0",loss="Logistic", maxSuppSize=20, nFolds=10, seed=1)
  best <- which(unlist(bestsubset_mod_cv$cvMeans)==min(unlist(bestsubset_mod_cv$cvMeans)))
  
  # Get coefficients 
  coef <- as.vector(coef(bestsubset_mod_cv, lambda=print(bestsubset_mod_cv)[best,]$lambda))
  names(coef) <- colnames(x.ord)
  return(coef)
} 

###### week 36 #####
# Find average bestsubset coefficients over imputed datasets
bestsubset_coef1_36 <- bestsubset(data_36_df_imp.train[[1]]) 
bestsubset_coef2_36 <- bestsubset(data_36_df_imp.train[[2]]) 
bestsubset_coef3_36 <- bestsubset(data_36_df_imp.train[[3]]) 
bestsubset_coef4_36 <- bestsubset(data_36_df_imp.train[[4]]) 
bestsubset_coef5_36 <- bestsubset(data_36_df_imp.train[[5]]) 
bestsubset_coef_36 <- cbind(bestsubset_coef1_36, bestsubset_coef2_36, bestsubset_coef3_36, 
                         bestsubset_coef4_36, bestsubset_coef5_36) 
avg_coefs_bestsubset_36 <- apply(bestsubset_coef_36, 1, mean)
select_coef_36 <- names(avg_coefs_bestsubset_36[avg_coefs_bestsubset_36 != 0])

  
# fit mixed-effects model
traindata_36_long <- mice::complete(data_36_df_mice_out.train,action="long") 

mod_bestsubset_36 <- glmer(Y ~  mat_ethn + log(bw) + ga + com_prenat_ster + mat_chorio + ventilation_support_level.36 + inspired_oxygen.36 + p_delta.36 +
                (1 | center), 
              family = binomial(), data = traindata_36_long)


###### week 44 #####
# Find average bestsubset coefficients over imputed datasets
bestsubset_coef1_44 <- bestsubset(data_44_df_imp.train[[1]]) 
bestsubset_coef2_44 <- bestsubset(data_44_df_imp.train[[2]]) 
bestsubset_coef3_44 <- bestsubset(data_44_df_imp.train[[3]]) 
bestsubset_coef4_44 <- bestsubset(data_44_df_imp.train[[4]]) 
bestsubset_coef5_44 <- bestsubset(data_44_df_imp.train[[5]]) 
bestsubset_coef_44 <- cbind(bestsubset_coef1_44, bestsubset_coef2_44, bestsubset_coef3_44, 
                            bestsubset_coef4_44, bestsubset_coef5_44) 
avg_coefs_bestsubset_44 <- apply(bestsubset_coef_44, 1, mean)
select_coef_44 <- names(avg_coefs_bestsubset_44[avg_coefs_bestsubset_44 != 0])


# fit mixed-effects model
traindata_44_long <- mice::complete(data_44_df_mice_out.train,action="long") 

mod_bestsubset_44 <- glmer(Y ~ mat_ethn + del_method + prenat_ster + com_prenat_ster + mat_chorio + gender + log(weight_today.36) + ventilation_support_level.36  + ventilation_support_level.36 + inspired_oxygen.36 + med_ph.36 + log(weight_today.44) + ventilation_support_level_modified.44 + inspired_oxygen.44 + med_ph.44 + (1 | center), 
                           family = binomial(), data = traindata_44_long)

# save(mod_bestsubset_36, file = "bestsubset_36.RData")
# save(mod_bestsubset_44, file = "bestsubset_44.Rdata")

