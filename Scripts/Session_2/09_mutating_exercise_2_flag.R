# Exercise: Day2_session07_mutating_exercise_2_flag.R


# SETUP -------------------------------------------------------------------

  # Library
  library(tidyverse)
  library(gagglr)
  
  # Load data
  df_msd <- return_latest("Data", "PSNU_IM") %>%
    read_psd()
  
  # Filter dataset to just HTS data
  df_index_psnu <- df_msd %>% 
    filter(indicator == "HTS_TST_POS",
           modality %in% c("Index", "IndexMod"),
           fiscal_year == 2060) %>%
    group_by(fiscal_year, psnu) %>% 
    summarize(across(c(targets, cumulative), 
                     \(x) sum(x, na.rm = TRUE)),
              .groups = "drop") %>% 
    arrange(desc(targets)) 

# EXERCISE PART I ---------------------------------------------------------


  # Create a dummy variable based on whether the PSNU has low target achievement 
  # in Q4 for index testing.
  # Calculate achievement (cumulative / targets)
  # Calculate a boolean variable called low_achv to flag if the achievement is low, i.e. below 40% for Q2. 
  
  df_flag <- df_index_psnu %>% 
    mutate(achievement = "...",
           low_achv = "...")
  

# EXERCISE PART II --------------------------------------------------------

  # If a PSNU has a low achievement, apply a color to flag this as important for
  # our data visualization
  # Calculate achievement (cumulative / targets)
  # If the achievement is low, less than 95%, use an ifelse() statement 
  # to set the value to ‘purple’, otherwise gray for the variable 
  # achv_color   
  
  ?ifelse
  
  df_flag %>%  
    mutate(achv_color = ifelse("...", "...", "..."))
  

# EXERCISE PART III -------------------------------------------------------

  # Calculate a multi-step condition statement using case_when() 
  # If the achievement is low, i.e. below 100% for Q4, use case_when() statement 
  # to set the value to ‘purple’, NA for values that are not finite, otherwise 
  # gray 
  
  
  df_flag %>% 
    mutate(achv_color = case_when())
           
           
  