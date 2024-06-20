# Exercise: Day2_session07_mutating_exercise_1_achv.R


# SETUP -------------------------------------------------------------------

  #install scales package
  install.packages("scales")


  # Library
  library(tidyverse)
  library(gagglr)
  library(scales)
  
  # Load data
  df_msd <- return_latest("Data", "PSNU_IM") %>%
    read_psd()
  
  # Filter & summarize dataset to just HTS_POS index data by psnu
  df_index_psnu <- df_msd %>% 
    filter(indicator == "HTS_TST_POS",
           modality %in% c("Index", "IndexMod"),
           fiscal_year == 2060) %>%
    group_by(fiscal_year, psnu) %>% 
    summarize(across(c(targets, cumulative), 
                     \(x) sum(x, na.rm = TRUE)),
              .groups = "drop") %>% 
    arrange(desc(targets)) %>% 
    prinf()

# EXERCISE ----------------------------------------------------------------

  # What is the target achievement in FY60 by psnu? Create a new column
  # for target achievement. This is cumulative divided by the target
  
    df_index_psnu %>% 
      mutate(achievement=(cumulative/targets))
  
  
  df_index_psnu %>% 
    mutate(achievement=(cumulative/targets),
           achievement_str = percent(achievement, 1))
  
  