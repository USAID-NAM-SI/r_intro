# Exercise: Day2_session04_summarizing_exercise_3_sorting


# SETUP -------------------------------------------------------------------

# Library
library(tidyverse)
library(gagglr)

# Load data
df_msd <- return_latest("Data", "PSNU_IM") %>%
  read_psd()

# Filter dataset to just HTS data
df_hts <- df_msd %>% 
  filter(indicator == "HTS_TST") 

# EXERCISE ----------------------------------------------------------------

# Practice by identifying all the partners conducting testing in 2060 and 
# sort them on a different variable

#Filter dataset to be for the focus year
df_hts_2023 <- df_hts %>% 
  filter(standardizeddisaggregate == "Modality/Age/Sex/Result",
         fiscal_year == "2060") 

# Add the partner variable as one of the parameters
df_hts_2023 %>% 
  count(indicator, fiscal_year, prime_partner_name, wt = cumulative, sort=TRUE)

# Test out using different function like count(), distinct(), and unique(), and arrange()
df_hts_2023 %>% 
  distinct(prime_partner_name,mech_code)

df_hts_2023 %>% 
  count(prime_partner_name) %>% 
  arrange(n)

unique(df_hts_2023$modality)