# Exercise: Day1_session01_getting_to_know_r_exercise_1_know_r

# SETUP -------------------------------------------------------------------

# Practice loading libraries
# Load the following libraries: tidyverse, gagglr, scales

library()


# STRINGS & NUMERICS ------------------------------------------------------

# Practice creating strings and numbers in objects

# type your name, to assign a value to `your_name` variable
your_name <- c("")

# set your number
your_number <- 26
your_number*2


# Print your name and number to the console
print(your_number*2)  


# DATAFRAMES --------------------------------------------------------------

# Create a new data frame
# column X should take values: "E", "F", "G"
# and column y should values: 3, 2, 1

df <- data.frame(x = c("E", "F", "G"), y = c(3, 2, 1))

# Practice accessing columns in the data frame
df$x


# FUNCTIONS -------------------------------------------------------

# Create a greeting function
# follow the instructions from the slide
greeting <- function(your_name){
  paste("Hello,", your_name, "!")
}


greeting("")

your_name %>% greeting()