# Exercise: Day2_session07=8_joining_and_appending_exercise_1_joining


# SETUP -------------------------------------------------------------------

  # Library
  # install.packages("readxl")
  library(readxl)
  library(tidyverse)
  library(gagglr)
  
  # Load data
  df_msd_training <- return_latest("Data", "TRAINING_Datasets_PSNU_IM") %>%
    read_psd()
  
  
  df_msd_tst <- df_msd_training %>% 
    filter(indicator == "HTS_TST", fiscal_year == 2060,
           standardizeddisaggregate == "Total Numerator") %>% 
    summarize(across(c(targets, cumulative), \(x) sum(x, na.rm = TRUE)),
              .by = c(mech_code, mech_name, indicator))

  
  # Load in the partner data
  df_local <- read_excel("Data/Minoria_local_partners.xlsx") 


# EXERCISE ----------------------------------------------------------------

  # Instructions
  # Investigate the columns of each data set.
  # What columns might you try merging on?
  
  
  # How can we compare the columns in each data set?
  names(df_local)  
  names(df_msd_tst)  

  # What columns provide common overlap? 
  intersect(names(df_local), names(df_msd_tst))

  # Try joining the two data sets together
  df_lj<-left_join(df_msd_tst,df_local)
  
  
 