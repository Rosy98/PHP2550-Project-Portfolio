library(tidyverse)
library(mice)

data <- read.csv("project2.csv")

data <- unique(data)

# impute missing center 
data[is.na(data$center), ]$center <- 1

# impute center 21 to center 1
data$center[which(data$center == 21)] <- 1

# drop race
data <- data[, -3]

# change the data type according to the codebook
data$center <- as.factor(data$center)
data$mat_ethn <- as.factor(data$mat_ethn)
data$del_method <- as.factor(data$del_method)
data <- data %>% mutate(prenat_ster = case_when(prenat_ster == "Yes" ~ 1,
                                                prenat_ster == "No" ~ 0, 
                                                prenat_ster == "Unknown" ~ 2)) 
data$prenat_ster <- as.factor(data$prenat_ster)
data <- data %>% mutate(com_prenat_ster = case_when(com_prenat_ster == "Yes" ~ 1,
                                                    com_prenat_ster == "No" ~ 0, 
                                                    com_prenat_ster == "Unknown" ~ 2)) 
data$com_prenat_ster <- as.factor(data$com_prenat_ster)
data <- data %>% mutate(mat_chorio = case_when(mat_chorio == "Yes" ~ 1,
                                               mat_chorio == "No" ~ 0, 
                                               mat_chorio == "Unknown" ~ 2)) 
data$mat_chorio <- as.factor(data$mat_chorio)

data$gender <- as.factor(data$gender)
data$sga <- as.factor(data$sga)

data <- data %>% mutate(any_surf = case_when(any_surf == "Yes" ~ 1,
                                             any_surf == "No" ~ 0, 
                                             any_surf == "Unknown" ~ 2)) 
data$any_surf <- as.factor(data$any_surf)
data$med_ph.36 <- as.factor(data$med_ph.36)
data$Trach <- as.factor(data$Trach)
data$med_ph.36 <- as.factor(data$med_ph.36)
data$med_ph.44 <- as.factor(data$med_ph.44)
data$com_prenat_ster[which(data$prenat_ster == 0)] <- 0
data$ventilation_support_level.36 <- as.factor(data$ventilation_support_level.36)
data$ventilation_support_level_modified.44 <- as.factor(data$ventilation_support_level_modified.44)

# Create a 2-level composite outcome
data$Y <- case_when(data$Trach == 0 & data$Death == "No" ~ 0, 
                    data$Trach == 1 | data$Death == "Yes" ~ 1)

# save the data
# save(data, file = "project2_data.RData")


# subset the 36 weeks data
data_36 <- data[, -c(21:29)]

# subset the 44 weeks data
data_44 <-  data %>%
  filter(!is.na(weight_today.44) | 
           !is.na(ventilation_support_level_modified.44) |
           !is.na(inspired_oxygen.44) | 
           !is.na(p_delta.44) | 
           !is.na(peep_cm_h2o_modified.44) | 
           !is.na(med_ph.44))
data_44 <- data_44[, -c(27:29)]

# save the data
# save(data_36, file = "data_36.RData")
# save(data_44, file = "data_44.RData")

# train-test split
set.seed(2550)
ignore_36 <- sample(c(TRUE, FALSE), size = nrow(data_36), replace = TRUE, prob = c(0.3, 0.7))

data_36_df_mice_out <- mice(data_36, ignore = ignore_36, m=5, pri=F, seed=2550)

data_36_df_mice_out.train <- filter(data_36_df_mice_out, !ignore_36)
data_36_df_mice_out.test <- filter(data_36_df_mice_out, ignore_36)

# Store each imputed data set
data_36_df_imp.train <- vector("list",5)    
for (i in 1:5){
  data_36_df_imp.train[[i]] <- mice::complete(data_36_df_mice_out.train,i) 
}

data_36_df_imp.test <- vector("list",5)    
for (i in 1:5){
  data_36_df_imp.test[[i]] <- mice::complete(data_36_df_mice_out.test,i) 
}

# save(data_36_df_mice_out.train, file = "mice_train_36.RData")
# save(data_36_df_mice_out.test, file = "mice_test_36.RData")
# save(data_36_df_imp.train, file = "traindata_36.RData")
# save(data_36_df_imp.test, file = "testdata_36.RData")

# train-test split
set.seed(2550)
ignore_44 <- sample(c(TRUE, FALSE), size = nrow(data_44), replace = TRUE, prob = c(0.3, 0.7))

data_44_df_mice_out <- mice(data_44, ignore = ignore_44, m=5, pri=F, seed=2550)

data_44_df_mice_out.train <- filter(data_44_df_mice_out, !ignore_44)
data_44_df_mice_out.test <- filter(data_44_df_mice_out, ignore_44)

# Store each imputed data set
data_44_df_imp.train <- vector("list",5)    
for (i in 1:5){
  data_44_df_imp.train[[i]] <- mice::complete(data_44_df_mice_out.train,i) 
}

data_44_df_imp.test <- vector("list",5)    
for (i in 1:5){
  data_44_df_imp.test[[i]] <- mice::complete(data_44_df_mice_out.test,i) 
}

# save(data_44_df_mice_out.train, file = "mice_train_44.RData")
# save(data_44_df_mice_out.test, file = "mice_test_44.RData")
# save(data_44_df_imp.train, file = "traindata_44.RData")
# save(data_44_df_imp.test, file = "testdata_44.RData")

