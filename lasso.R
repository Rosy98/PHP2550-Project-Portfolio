###################################################### 
#### Lasso #### 
###################################################### 

library(glmmLasso)
library(pROC)

load("mice_train_36.RData")
load("traindata_36.RData")
load("mice_train_44.RData")
load("traindata_44.RData")

traindata_36_long <- mice::complete(data_36_df_mice_out.train, action="long") 
traindata_44_long <- mice::complete(data_44_df_mice_out.train, action="long")

set.seed(2550)
k <- 10 # 10-fold CV

# 36 week pma
folds <- sample(1:k, nrow(data_36_df_imp.train[[1]]), replace = TRUE)
lambda <- seq(0, 50, length = 20)
AUC_set_36 <- matrix(nrow = 20, ncol = k)

for (i in 1:5){
  for (j in 1:length(lambda)) {
    for (k in 1:10) {
      mod <- glmmLasso(fix = Y ~  mat_ethn + log(bw) + ga + blength + birth_hc + 
                         del_method + prenat_ster + com_prenat_ster + mat_chorio + gender + sga + 
                         any_surf + log(weight_today.36) + ventilation_support_level.36 + inspired_oxygen.36 + 
                         p_delta.36 + peep_cm_h2o_modified.36 + med_ph.36, 
                       rnd = list(center=~1), 
                       data = data_36_df_imp.train[[i]][folds != k,], 
                       family = binomial(),
                       lambda = lambda[j], 
                       control = list(print.iter=TRUE),
                       final.re=TRUE
      )
      pred <- predict(mod, 
                      newdata = data_36_df_imp.train[[i]][folds == k, ], 
                      type = "response")
      roc <- roc(predictor = pred, 
          response = data_36_df_imp.train[[i]][folds == k, "Y"], 
          levels = c(0,1), direction = "<")
      AUC_set_36[j, k] <- auc(roc)
      
    }
  }
  
  mod_lasso_36 <-  glmmLasso(fix = Y ~  mat_ethn + log(bw) + ga + blength + birth_hc + 
                                               del_method + prenat_ster + com_prenat_ster + mat_chorio + gender + sga + 
                                               any_surf + log(weight_today.36) + ventilation_support_level.36 + inspired_oxygen.36 + 
                                               p_delta.36 + peep_cm_h2o_modified.36 + med_ph.36, 
                    rnd = list(center=~1), 
                    data = traindata_36_long, 
                    family = binomial(),
                    lambda = lambda[which.min(colMeans(AUC_set_36))], 
                    control = list(print.iter=TRUE),
                    final.re=TRUE)
  
}


# 44 week pma
folds <- sample(1:k, nrow(data_44_df_imp.train[[1]]), replace = TRUE)
AUC_set_44 <- matrix(nrow = 20, ncol = k)

for (i in 1:5){
  for (j in 1:length(lambda)) {
    for (k in 1:10) {
      mod <- glmmLasso(fix = Y ~  mat_ethn + log(bw) + ga + blength + birth_hc + 
                         del_method + prenat_ster + com_prenat_ster + mat_chorio + gender + sga + 
                         any_surf + 
                         log(weight_today.36) + ventilation_support_level.36 + inspired_oxygen.36 + 
                         p_delta.36 + peep_cm_h2o_modified.36 + med_ph.36 +
                       log(weight_today.44) + ventilation_support_level_modified.44 + inspired_oxygen.44 + 
                         p_delta.44 + peep_cm_h2o_modified.44 + med_ph.44, 
                       rnd = list(center=~1), 
                       data = data_44_df_imp.train[[i]][folds != k,], 
                       family = binomial(),
                       lambda = lambda[j], 
                       control = list(print.iter=TRUE),
                       final.re=TRUE
      )
      pred <- predict(mod, 
                      newdata = data_44_df_imp.train[[i]][folds == k, ], 
                      type = "response")
      roc <- roc(predictor = pred, 
                 response = data_44_df_imp.train[[i]][folds == k, "Y"], 
                 levels = c(0,1), direction = "<")
      AUC_set_44[j, k] <- auc(roc)
      
    }
  }
  
  mod_lasso_44 <-  glmmLasso(fix = Y ~  mat_ethn + log(bw) + ga + blength + birth_hc + 
                              del_method + prenat_ster + com_prenat_ster + mat_chorio + gender + sga + 
                              any_surf + 
                              log(weight_today.36) + ventilation_support_level.36 + inspired_oxygen.36 + 
                              p_delta.36 + peep_cm_h2o_modified.36 + med_ph.36 +
                              log(weight_today.44) + ventilation_support_level_modified.44 + inspired_oxygen.44 + 
                              p_delta.44 + peep_cm_h2o_modified.44 + med_ph.44, 
                            rnd = list(center=~1), 
                            data = traindata_44_long, 
                            family = binomial(),
                            lambda = lambda[which.min(colMeans(AUC_set_44))], 
                            control = list(print.iter=TRUE),
                            final.re=TRUE)
  
}


save(mod_lasso_36, file = "lasso_36.RData")
save(mod_lasso_44, file = "lasso_44.Rdata")

