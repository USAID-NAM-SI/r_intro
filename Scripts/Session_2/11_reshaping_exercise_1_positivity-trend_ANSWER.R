# Day2_session08=9_reshaping_exercise_1_positivity-trend.R

# SETUP -------------------------------------------------------------------

  # Library
  library(tidyverse)
  library(gagglr)
  
  # Load data
  df_msd <- return_latest("Data", "PSNU") %>%
    read_psd()
  
  # Filter & summarize dataset to just Index for Eugene and Year
  df_semi <- df_msd %>% 
    filter(indicator %in% c("HTS_TST", "HTS_TST_POS"),
           standardizeddisaggregate == "Modality/Age/Sex/Result",
           modality == "Index",
           psnu %in% c("Peoria")) %>% 
    group_by(fiscal_year, psnu, indicator) %>% 
    summarize(across(c(starts_with("qtr")), \(x) sum(x, na.rm = TRUE)),
              .groups = "drop") %>% 
    arrange(indicator)
  


# EXERCISE ----------------------------------------------------------------

  # Calculate the positivity trend in Eugene. 
  # Reshape the dataset long so you get each quarter as its own row as we've 
  # done in the slides.
    
  ?pivot_longer
  
  df_long <- df_semi %>% 
     pivot_longer(starts_with("qtr"),
                  "...")
  
  df_long <- df_semi %>% 
    pivot_longer(starts_with("qtr"),
                 names_to = "quarter",
                 names_prefix = "qtr",
                 values_to = "value")
  
  # Reshape wide so you have your indicators as columns
  
  ?pivot_wider
  
  df_long2 <- df_long %>% 
    pivot_wider(names_from = indicator, 
                values_from = value)
  
  #Combine year and quarter into one column called period and clean up period
  
  ?unite 
  
  df_long_clean <- df_long2 %>% 
    unite(period, c("fiscal_year","quarter"), sep = "Q") %>%
    mutate(period = str_replace(period, "20", "FY"))
  
  #Calculate positivity
  df_long_clean %>% 
    mutate(positivity = HTS_TST/HTS_TST_POS)
  