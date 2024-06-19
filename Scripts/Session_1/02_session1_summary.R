# AUTHOR:   G. Sarfaty & D. Collison | USAID
# PURPOSE:  Namibia R Training | Session 1 Summary
# LICENSE:  MIT
# DATE:     2024-06-18
# UPDATED: 

# DEPENDENCIES ------------------------------------------------------------

#EXERCISE Q1: load tidyverse and gophr packages
library("tidyverse")
library("gophr")



# IMPORT DATA -------------------------------------------------------------

#EXERCISE Q2: You will be using list.files. Write a line of code below to pull 
#up the help for list files
?list.files


#EXERCISE Q3: Use list.files to create a new object called msd_path that 
# points to the PSNU_IM dataset in the Data folder.
msd_path<-list.files("Data",pattern="PSNU",full.names = T)

#EXERCISE Q4: Use read_psd from the gophr package to read in the PSNUxIM data,
# and assign it as an object called df_msd
df_msd<-read_psd(msd_path)

#EXERCISE Q5: Access the indicator column of the df_msd data frame
df_msd$indicator

# MUNGE -------------------------------------------------------------------

#NO EXERCISE YET: We are going to start inspecting, isolating, and manipulating
# data next!
'