# Exercise: Day1_session01_getting_to_know_r_exercise_1_know_r

# SETUP -------------------------------------------------------------------

# Practice loading libraries
# Load the following libraries: tidyverse, gagglr

library("tidyverse")
library("gagglr")



# STRINGS & NUMERICS ------------------------------------------------------

# Practice creating strings and numbers in objects

# type your name, to assign a value to `your_name` variable
your_name <- c("Gina")

# set your number
your_number <- 26

#see the result of your number times 2
your_number*2



# DATAFRAMES --------------------------------------------------------------

# Create a new data frame
# column X should take values: "E", "F", "G"
# and column y should values: 3, 2, 1

df <- data.frame(x = c("E", "F", "G"), y = c(3, 2, 1))

# Practice accessing columns in the data frame
df$x


# FUNCTIONS -------------------------------------------------------

# This creates a greeting function
greeting <- function(your_name){
  paste("Hello,", your_name,"!")
}

#use the greeting function above to greet someone in the room (eg. have the greeting use their name)
greeting("Debbie")


#use the pipe %>%  to use your_name followed by the greeting
your_name %>% greeting()


# Print your name and number to the console
paste(your_name,your_number,collapse = " ")  