# Exercise: Day2_session04_summarizing_exercise_6_summarize_qtr.R


# SETUP -------------------------------------------------------------------

  # Library
  library(tidyverse)
  library(gagglr)
  
  # Load data
  df_msd <- return_latest("Data", "PSNU_IM") %>%
    read_psd()
  
  # Filter dataset to just HTS Index data
  df_index <- df_msd %>% 
    filter(indicator == "HTS_TST",
           standardizeddisaggregate == "Modality/Age/Sex/Result",
           target_modality_2024 %in% c("Active Index")) 

# EXERCISE ----------------------------------------------------------------

  # What do each quarters’ index testing results look like in Peoria and Eugene 
  # PSNU in FY60?
  # what about cumulative?
  # Use filter() and summarize() with across()
  
  distinct(df_index,psnu)
  
  distinct(test,psnu)
  
  test<-df_index %>% 
    filter(psnu %in% c("Peoria","Eugene")) %>% #what PSNU to filter to? what else?
    group_by(psnu,fiscal_year) %>% #what vars to group by
    summarize(across(c(qtr1:cumulative), # what variable to sum on if we are looking at results? 
                     \(x) sum(x, na.rm = TRUE)), #\(x) is shorthand for function
              .groups = "drop")
  
  
  
  test2<-df_index %>% 
    filter(psnu %in% c("Peoria","Eugene")) %>% #what PSNU to filter to? what else?
    group_by(psnu,fiscal_year) %>% #what vars to group by
    summarize(across(starts_with("qtr"), # what variable to sum on if we are looking at results? 
                     \(x) sum(x, na.rm = TRUE)),
              .groups = "drop")

  