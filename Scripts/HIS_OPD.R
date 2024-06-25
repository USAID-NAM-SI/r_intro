
#load packages
library(tidyverse)
library(gagglr)


#read in the file

backend<-return_latest("Data","DataSet") %>% 
  read_csv()


# Service Point column

library(dplyr)
library(stringr)

df_test <- backend %>% 
  mutate(level_5 = str_remove(level_5, ".*-")) %>% 
  mutate(dataelementname=str_replace_all(dataelementname,"Year*","years"),
         dataelementname=str_replace_all(dataelementname,"Month*","months"),
         categoryoptioncomboname=str_replace_all(categoryoptioncomboname,"Year*","years"),
         categoryoptioncomboname=str_replace_all(categoryoptioncomboname,"Month*","months")) %>% 
  mutate(age = case_when(
    dataelementgroupname == "Family Planning / ANC / PNC Report" & 
      str_detect(dataelementname, "years") ~ str_extract(dataelementname, "(?<=-).+"),
    dataelementgroupname == "Z_Mother Baby Follow Up Care Summary Form Ver 2012" & 
      str_detect(dataelementname, "months") ~ str_extract(dataelementname, "(\\d+\\s+months)"),
    dataelementgroupname == "Z_Mother Baby Follow Up Care Summary Form Ver 2012" & 
      str_detect(dataelementname, "weeks") ~ str_extract(dataelementname, "(\\d+\\s+weeks)"),
    dataelementgroupname == "MBFU_Mother Baby Follow Up Monthly Summary" & 
      str_detect(dataelementname, "months") ~ str_extract(dataelementname, "(\\d+\\s+months)"),
    dataelementgroupname == "MBFU_Mother Baby Follow Up Monthly Summary" & 
      str_detect(dataelementname, "weeks") ~ str_extract(dataelementname, "(\\d+\\s+weeks)"),
    dataelementgroupname == "NACS_Nutrition Assessment Counselling and Support" & 
      str_detect(dataelementname, "months") ~ str_extract(dataelementname, "(\\d+\\s+months)"),
    dataelementgroupname == "NACS_Nutrition Assessment Counselling and Support" & 
      str_detect(dataelementname, "years") ~ str_extract(dataelementname, "(\\d+\\s+years)"),
    str_detect(categoryoptioncomboname, "years") ~ str_extract(categoryoptioncomboname, "\\d+\\s*-\\s*\\d+\\s*years"),
    str_detect(categoryoptioncomboname, "years") ~ str_extract(categoryoptioncomboname, "\\d+\\+\\s*years"),
    str_detect(categoryoptioncomboname, "month") ~ str_extract(categoryoptioncomboname, "<\\s*\\d+\\s*month"),
    str_detect(categoryoptioncomboname, "years") ~ str_extract(categoryoptioncomboname, "\\d+\\s*month\\s*-\\s*\\d+\\s*years"),
    TRUE ~ ""))
    
    
    #test last part - 50+ years and 1 month - 4 years is not pulling through in the age column in code above 
    vmmc<-df_test %>% 
      filter(dataelementname=="VMMC - Circumcision Procedures done") %>% 
      distinct(categoryoptioncomboname,age)
    
         
         
         
         
  #UNUSED CODE - COMMENTING OUT IN CASE NEEDED LATER
  # disaggregate=str_extract(dataelementname, "(?<=-).+"))
  # separate(dataelementname,c("dataelement", "disaggregate"),
  #          sep="-")




#export to CSV
filename_csv<-paste(Sys.Date(),"OPD_Jan2023.csv",sep ="_")

write.csv(df_subset,file.path("Dataout",filename_csv), na="")
