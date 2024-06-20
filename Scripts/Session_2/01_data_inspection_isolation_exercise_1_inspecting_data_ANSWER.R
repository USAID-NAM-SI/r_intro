# Exercise: Day2_session03_data_inspection_isolation_exercise_1_inspecting_data

# Project Setup & Data Prep -----------------------------------------------
library(tidyverse)
library(gagglr)

# Create a path to data
msd_path <- subnat_path <- list.files("Data", pattern = "PSNU", full.names = T)

# Load the data
df_msd <- read_psd(msd_path)


# INVESTIGATING -----------------------------------------------------------

# Print the data frame to the screen
df_msd

# For the examples below, insert the correct dataframe in the function  

# head() -Returns the first or last parts of a vector, matrix, table, data frame or function.
head(df_msd)
tail(df_msd)


# names() - Functions to get or set the names of an object.
names(df_msd)



# View() - Invoke a spreadsheet-style data viewer on a matrix-like R object.
view(df_msd)


# str() - Compactly display the internal structure of an R object
str(df_msd)


# glimpse() - glimpse() is like a transposed version of print(): columns run down the page, and data runs across. 
glimpse(df_msd)


# Summary - What does this do? How to use it?
summary(df_msd)

# UNIQUENESS --------------------------------------------------------------

# Check for unique observations using distinct, unique or count
# country, snu1, indicator
unique(df_msd$country)

df_msd %>% 
  distinct(country,snu1)

df_msd %>% 
  count(snu1) %>% 
  prinf()

#How many unique snu1s are there?
length(unique(df_msd$snu1))

#How many unique indicators are there?
length(unique(df_msd$indicator))

#What is different about the three functions (unique, distinct, and count)?


