# Exercise: Day2_session04_summarizing_exercise_5_summarize.R


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

  # Determine which partners conducted the most index tests in 2023
  # use filter(), summarize(), and arrange()
  
  df_index %>% 
    filter(fiscal_year=="2060") %>%  #what do you filter by?
    group_by(fiscal_year, prime_partner_name) %>% # what else should we group by?
    summarise(cumulative = sum(cumulative, na.rm = TRUE)) %>% #what var do we summmarize on?
    ungroup() %>% 
    arrange(desc(cumulative))#what var do we sort by?