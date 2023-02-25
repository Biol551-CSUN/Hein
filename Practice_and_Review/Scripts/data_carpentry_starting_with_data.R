# Data Carpentry - Starting with data ----
# Made By: Mac Hein
# Made On: 2023-02-25

# Load Libraries ----

library(tidyverse)
library(here)
library(lubridate)

# Load Data ----

surveys <- read_csv(here("Practice_and_Review", "Data", "portal_data_joined.csv"))

# Data Analysis ----

# first 50 rows of surveys data:
print(surveys, n = 50)

# first few lines of surveys data:
head(surveys)

# head() returns the extracted data, and can be used to make an object
surveys_sample <- head(surveys, 100)

# obtain data in RStudio's Data Viewer
view(surveys)

# observe the structure of the "surveys" dataframe
str(surveys)

# Inspecting data frames

# Size:
dim(surveys) # returns a vector with the number of rows in the first element, and the number of columns as the second element (the dimensions of the object)
nrow(surveys) # returns the number of rows
ncol(surveys) # returns the number of columns

# Content:
head(surveys) # shows the first 6 rows
tail(surveys) # shows the last 6 rows

# Names:
names(surveys) # returns the column names (synonym of colnames() for data.frame objects)
rownames(surveys) # returns the row names

#Summary:
str(surveys) # structure of the object and information about the class, length and content of each column
summary(surveys) # summary statistics for each column

# We can extract specific values by specifying row and column indices
# in the format data_frame[row_index, column_index]

# For instance, to extract the first row and column from surveys:
surveys[1, 1]

# First row, sixth column:
surveys[1, 6]   

# We can also use shortcuts to select a number of rows or columns at once
# To select all columns, leave the column index blank
# For instance, to select all columns for the first row:
surveys[1, ]

# The same shortcut works for rows --
# To select the first column across all rows:
surveys[, 1]

# An even shorter way to select first column across all rows:
surveys[1] # No comma! 

# To select multiple rows or columns, use vectors!
# To select the first three rows of the 5th and 6th column
surveys[c(1, 2, 3), c(5, 6)] 

# We can use the : operator to create those vectors for us:
surveys[1:3, 5:6] 

# This is equivalent to head_surveys <- head(surveys)
head_surveys <- surveys[1:6, ]

# As we've seen, when working with tibbles 
# subsetting with single square brackets ("[]") always returns a data frame.
# If you want a vector, use double square brackets ("[[]]")

# For instance, to get the first column as a vector:
surveys[[1]]

# To get the first value in our data frame:
surveys[[1, 1]]

# : is a special function that creates numeric vectors of integers in
# increasing or decreasing order, test 1:10 and 10:1 for instance.

# You can also exclude certain indices of a data frame using the “-” sign:
surveys[, -1]                 # The whole data frame, except the first column
surveys[-(7:nrow(surveys)), ] # Equivalent to head(surveys)

# As before, using single brackets returns a data frame:
surveys["species_id"]
surveys[, "species_id"]

# Double brackets returns a vector:
surveys[["species_id"]]

# We can also use the $ operator with column names instead of double brackets
# This returns a vector:
surveys$species_id

# Challenge

# 1. Create a data.frame (surveys_200) containing only the data in row 200 of
#    the surveys dataset.

surveys_200 <- surveys[200, ]
surveys_200

# 2. Notice how nrow() gave you the number of rows in a data.frame?
#    - Use that number to pull out just that last row from the surveys dataset.
#    - Compare that with what you see as the last row using tail() to make sure
#      it’s meeting expectations.
#    - Pull out that last row using nrow() instead of the row number.
#    - Create a new data frame (surveys_last) from that last row.

# Saving `n_rows` to improve readability and reduce duplication
n_rows <- nrow(surveys)
n_rows

surveys_last <- surveys[n_rows, ]
surveys_last

# 3. Use nrow() to extract the row that is in the middle of the data frame.
#    Store the content of this row in an object named surveys_middle.

surveys_middle <- surveys[n_rows / 2, ]
surveys_middle

# 4. Combine nrow() with the - notation above to reproduce the behavior of
#    head(surveys), keeping just the first through 6th rows of the surveys
#    dataset.

surveys_head <- surveys[-(7:n_rows), ]
surveys_head

# Factors

# Coerce the sex column to the factor data type
surveys$sex <- factor(surveys$sex)

summary(surveys$sex)

sex <- factor(c("male", "female", "female", "male"))

# check the levels of the sex factor and the number of levels of the sex factor
levels(sex)
nlevels(sex)

sex # current order

sex <- factor(sex, levels = c("male", "female"))
sex # after re-ordering

# Challenge

# 1. Change the columns taxa and genus in the surveys data frame into a factor.
# 2. Using the functions you learned before, can you find out…
#    - How many rabbits were observed?
#    - How many different genera are in the genus column?

surveys$taxa <- factor(surveys$taxa)
surveys$genus <- factor(surveys$genus)
summary(surveys)
nlevels(surveys$genus)

## * how many genera: There are 26 unique genera in the `genus` column.
## * how many rabbts: There are 75 rabbits in the `taxa` column.

# Converting factors

# Convert a factor to a character vector: as.character(x)
as.character(sex)

# as.numeric(): returns the index values of the factor, not its levels

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct]    # The recommended way.

## bar plot of the number of females and males captured during the experiment:
plot(surveys$sex)

sex <- surveys$sex
levels(sex)

sex <- addNA(sex)
levels(sex)

head(sex)

levels(sex)[3] <- "undetermined"
levels(sex)

head(sex)

# Challenge
# - Rename “F” and “M” to “female” and “male” respectively.
# - Now that we have renamed the factor level to “undetermined”, can you
#   recreate the barplot such that “undetermined” is first (before “female”)?

levels(sex)[1:2] <- c("female", "male")
sex <- factor(sex, levels = c("undetermined", "female", "male"))
plot(sex)

# Challenge

# 1. We have seen how data frames are created when using read_csv(),
#    but they can also be created by hand with the data.frame() function.
#    There are a few mistakes in this hand-crafted data.frame.
#    Can you spot and fix them? Don’t hesitate to experiment!

animal_data <- data.frame(
  animal = c(dog, cat, sea_cucumber, sea_urchin),
  feel = c("furry", "furry", "squishy", "spiny"),
  weight = c(45, 8, 1.1, 0.8)
)

# 2. Can you predict the class for each of the columns in the following example?
#    Check your guesses using str(country_climate):
#    - Are they what you expected? Why? Why not?
#    - What would you need to change to ensure that each column had the accurate
#      data type?

country_climate <- data.frame(
  country = c("Canada", "Panama", "South Africa", "Australia"),
  climate = c("cold", "hot", "temperate", "hot/temperate"),
  temperature = c(10, 30, 18, 15),
  northern_hemisphere = c(TRUE, TRUE, FALSE, FALSE),
  has_kangaroo = c(FALSE, FALSE, FALSE, TRUE)
)

# Formatting dates

str(surveys)

my_date <- ymd("2015-01-01")
str(my_date)

# sep indicates the character to use to separate each component
my_date <- ymd(paste("2015", "1", "1", sep = "-")) 
str(my_date)

paste(surveys$year, surveys$month, surveys$day, sep = "-")

ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

str(surveys) # notice the new column, with 'date' as the class

summary(surveys$date)

missing_dates <- surveys[is.na(surveys$date), c("year", "month", "day")]

head(missing_dates)

