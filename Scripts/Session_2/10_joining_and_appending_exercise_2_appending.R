# Exercise: Day2_session08_joining_and_appending_exercise_2_appending


# SETUP -------------------------------------------------------------------

  # Library
  # install.packages("readxl")
  library(readxl)
  library(tidyverse)
  library(gagglr)
  
  # Load data
df_msd_training <- return_latest("Data", "TRAINING_Datasets_PSNU_IM") %>%
    read_psd()
  
  df_subnat_training <- return_latest("Data", "TRAINING_Datasets_NAT_SUBNAT") %>% 
    read_psd()


# Exercise ----------------------------------------------------------------

  # Instructions: Try row binding the df_subnat to the df_msd
  
  df_msd_subnat <- bind_rows("...", "...")

  # How many rows does the new data set have?
  # How many columns?