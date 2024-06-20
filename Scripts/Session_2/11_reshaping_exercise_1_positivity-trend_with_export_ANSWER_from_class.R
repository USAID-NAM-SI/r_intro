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

  # Calculate the positivity trend in Peoria 
  # Reshape the dataset long so you get each quarter as its own row as we've 
  # done in the slides.
    
  ?pivot_longer
  
  df_long <- df_semi %>% 
    pivot_longer(starts_with("qtr"),
                 names_to = "quarter", #naming our new variable column
                 names_prefix = "qtr", #removing qtr from the name
                 values_to = "value") # the new column name where we are storing values
                  
  
  
  
  
  # Reshape wide so you have your indicators as columns
  
  ?pivot_wider
  
  df_wide<- df_long %>% 
    pivot_wider(names_from = indicator, 
                values_from = value)
  
  #Combine year and quarter into one column called period and clean up period
  
  ?unite 
  
  df_long_clean <- df_long %>% 
    unite(period, c("fiscal_year","quarter"), sep = "Q") %>%
    mutate(period = str_replace(period, "20", "FY"))
  
 # EXPORT ------------------------------------------------------
  
  #export to CSV
  filename_csv<-paste(Sys.Date(),"positivity_long.csv",sep ="_")
  
  write.csv(df_long_clean,file.path("Dataout",filename_csv), na="")
  
  #export to XLSX -- need the openxlsx packages
  #install.packages(openxlsx)
  library(openxlsx)
  
  filename_xlsx<-paste(Sys.Date(),"positivity_long.xlsx",sep ="_")
  
  write.xlsx(df_long_clean,file.path("Dataout",filename_xlsx), na="")
  
  
  
  
  