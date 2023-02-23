# First Review Script ----
# Made By: Mac Hein
# Made On: 2023-02-21

# Load Libraries ----

library(tidyverse)
library(hexbin)
library(patchwork)
library(RSQLite)
library(here)
library(lubridate)

# Load Data ----

# Data Analysis ----

# Character

ex_cha <- "Hello, World!"

ex_num <- 3.14

ex_int <- 1

ex_log <- TRUE

ex_com <- 1+4i

ex_fac <- "Green"

# Dimensions of Data:
# - Number of complete observations, e.g. a sample or subject
# - Number of things measured per observation, e.g. color, salinity, mass

# Wide data: one observation per row, all the different variables are columns

# Sample_ID Color Salinity_M Mass_g
# 1         Blue  2.0        1.0
# 2         Green 1.5        2.5
# 3         Black 1.0        3.4
# 4         Red   0.5        4.6
# 5         White 0.2        5.1

# Long data: one unique measurement per row and all the info about that
# measurement in the same row

# Sample_ID Color Measurement_Type Value Units
# 1         Blue  Salinity         2.0   M
# 1         Blue  Mass             1.0   g
# 2         Green Salinity         1.5   M
# 2         Green Mass             2.5   g
# 3         Black Salinity         1.0   M
# 3         Black Mass             3.4   g
# 4         Red   Salinity         0.5   M
# 4         Red   Mass             4.6   g
# 5         White Salinity         0.2   M
# 5         White Mass             5.1   g

ex_sum <- sum(1, 1, 2, 3, 5)
ex_sum

ex_plot <- plot(1:3, 3:5)
ex_plot

# Asking for help:

# put ? in front of a function and R will tell you what it is, e.g. ?plot

# can use help.search() to look for a function that can perform a
# particular task, e.g. help.search("ANOVA")

# if you can't remember what a function is called, use apropos()
# e.g. apropos("nova")

# can also use Google

ex_eq <- 1 + 1
ex_eq

ex_eq_2 <- sqrt(2)
ex_eq_2

ex_eq_3 <- 5 * log(6)
ex_eq_3

ex_eq_4 <- 3 + 5
ex_eq_4

ex_eq_5 <- 12 / 7
ex_eq_5

# Can also type equations directly into the console

weight_kg <- 55
weight_kg

# Press [Alt] + [-] to write [ <- ] in a single keystroke

weight_kg <- 55    # doesn't print anything
(weight_kg <- 55)  # but putting parenthesis around the call prints the value of `weight_kg`
weight_kg          # and so does typing the name of the object

2.2 * weight_kg

weight_kg <- 57.5
2.2 * weight_kg

weight_lb <- 2.2 * weight_kg

weight_kg <- 100

# [Ctrl] + [Shift] + [C] to comment out highlighted text or current line

mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?

weight_kg <- sqrt(10)

round(3.14159)

# use args() to check which arguments a function takes

args(round)

round(3.14159, 2)

?round

round(3.14159, digits = 2)

round(digits = 2, x = 3.14159)

# Vector <- c()

weight_g <- c(50, 60, 65, 82)
weight_g

animals <- c("mouse", "rat", "dog")
animals

length(weight_g)
length(animals)

class(weight_g)
class(animals)

str(weight_g)
str(animals)

weight_g <- c(weight_g, 90) # add to the end of the vector
weight_g <- c(30, weight_g) # add to the beginning of the vector
weight_g

# Atomic vector types:
# - character
# - numeric/double
# - logical
# - integer
# - complex
# - raw

# use typeof() to check type of vector

# other types of data structures:
# - list
# - matrix
# - data.frame
# - factor
# - array

# logical → numeric → character ← logical

num_char <- c(1, 2, 3, "a")
num_char

num_logical <- c(1, 2, 3, TRUE)
num_logical

char_logical <- c("a", "b", "c", TRUE)
char_logical

tricky <- c(1, 2, 3, "4")
tricky

combined_logical <- c(num_logical, char_logical)
combined_logical

# subsetting vectors: extracting one or several values from a vector
# R indices start at 1

animals <- c("mouse", "rat", "dog", "cat")
animals[2]
animals[c(3, 2)]

more_animals <- animals[c(1, 2, 3, 2, 1, 4)]
more_animals

# conditional subsetting
# TRUE will select the element with the same index, FALSE will not

weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(TRUE, FALSE, FALSE, TRUE, TRUE)]

weight_g > 50    # will return logicals with TRUE for the indices that meet the
                 # condition

## so we can use this to select only the values above 50
weight_g[weight_g > 50]

weight_g[weight_g > 30 & weight_g < 50]

weight_g[weight_g <= 30 | weight_g == 55]

weight_g[weight_g >= 30 & weight_g == 21]

animals <- c("mouse", "rat", "dog", "cat", "cat")

# return both rat and cat
animals[animals == "cat" | animals == "rat"]

# return a logical vector that is TRUE for the elements within animals
# that are found in the character vector and FALSE for those that are not
animals %in% c("rat", "cat", "dog", "duck", "goat", "bird", "fish")

# use the logical vector created by %in% to return elements from animals
# that are found in the character vector
animals[animals %in% c("rat", "cat", "dog", "duck", "goat", "bird", "fish")]

# When using > or < on strings, R compares the strings in alphabetical order

# missing data is represented in vectors as NA

# can add the argument na.rm = TRUE to calculate results as if missing values
# were removed

heights <- c(2, 4, 4, NA, 6)
mean(heights)
max(heights)
mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

## Extract those elements which are not missing values.
heights[!is.na(heights)]

## Returns the object with incomplete cases removed.
#The returned object is an atomic vector of type `"numeric"` (or #`"double"`).
na.omit(heights)

## Extract those elements which are complete cases.
#The returned object is an atomic vector of type `"numeric"` (or #`"double"`).
heights[complete.cases(heights)]

heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72,
             65, 64, 70, 63, 65)
heights_no_na <- na.omit(heights)
heights_no_na
median(heights_no_na)
heights_above_67_in <- heights_no_na[heights_no_na > 67]
heights_above_67_in
length(heights_above_67_in)

download.file(url = "https://ndownloader.figshare.com/files/2292169",
              destfile = "Practice_and_Review/Data/portal_data_joined.csv")

surveys <- read_csv(here("Practice_and_Review","Data",
                         "portal_data_joined.csv"))
# print first 50 rows
print(surveys, n = 50)

# extract first few lines of data
head(surveys)

# open dataset in RStudio's Data Viewer
view(surveys)

# data frame: table where the columns are vectors with the same length
# each column vector contains a single type of data

# inspect structure of a data frame
str(surveys)
# data frame with 34786 rows and 13 columns

# inspecting data frames

# Size:
#   dim(surveys) - returns a vector with the number of rows in the first
#     element, and the number of columns as the second element
#     (the dimensions of the object)
#   nrow(surveys) - returns the number of rows
#   ncol(surveys) - returns the number of columns

# Content:
#   head(surveys) - shows the first 6 rows
#   tail(surveys) - shows the last 6 rows

# Names:
#   names(surveys) - returns the column names (synonym of colnames() for
#     data.frame objects)
#   rownames(surveys) - returns the row names

# Summary:
#   str(surveys) - structure of the object and information about the class,
#     length and content of each column
#   summary(surveys) - summary statistics for each column

# Note: most of these functions are “generic”, they can be used on other types
# of objects besides data.frame

# Indexing and subsetting data frames

# We can extract specific values by specifying row and column indices
# in the format: 
# data_frame[row_index, column_index]
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

## 1. Create a data.frame (surveys_200) containing only the data in row 200 of
#     the surveys dataset.
surveys_200 <- surveys[200, ]
## 2. Notice how nrow() gave you the number of rows in a data.frame?
# Use that number to pull out just that last row from the surveys dataset.
# Compare that with what you see as the last row using tail() to make sure it’s
# meeting expectations.
# Pull out that last row using nrow() instead of the row number.
# Create a new data frame (surveys_last) from that last row.
# Saving `n_rows` to improve readability and reduce duplication
n_rows <- nrow(surveys)
surveys_last <- surveys[n_rows, ]
## 3. Use nrow() to extract the row that is in the middle of the data frame.
#     Store the content of this row in an object named surveys_middle
surveys_middle <- surveys[n_rows / 2, ]
## 4. Combine nrow() with the - notation above to reproduce the behavior of
#     head(surveys), keeping just the first through 6th rows of the surveys
#     dataset.
surveys_head <- surveys[-(7:n_rows), ]

# Factors

surveys$sex <- factor(surveys$sex)

summary(surveys$sex)

sex <- factor(c("male", "female", "female", "male"))

levels(sex)
nlevels(sex)

sex # current order

sex <- factor(sex, levels = c("male", "female"))
sex # after re-ordering

surveys$taxa <- factor(surveys$taxa)
surveys$genus <- factor(surveys$genus)
summary(surveys)
nlevels(surveys$genus)

## * how many genera: There are 26 unique genera in the `genus` column.
## * how many rabbts: There are 75 rabbits in the `taxa` column.

as.character(sex)

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

levels(sex)[1:2] <- c("female", "male")
sex <- factor(sex, levels = c("undetermined", "female", "male"))
plot(sex)

animal_data <- data.frame(
  animal = c(dog, cat, sea_cucumber, sea_urchin),
  feel = c("furry", "furry", "squishy", "spiny"),
  weight = c(45, 8, 1.1, 0.8)
)

country_climate <- data.frame(
  country = c("Canada", "Panama", "South Africa", "Australia"),
  climate = c("cold", "hot", "temperate", "hot/temperate"),
  temperature = c(10, 30, 18, 15),
  northern_hemisphere = c(TRUE, TRUE, FALSE, FALSE),
  has_kangaroo = c(FALSE, FALSE, FALSE, TRUE)
)

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

my_numbers <- c(1, 1, 4, 1, 1, 4, 1)
my_numbers

# type install.packages("PackageName") into console to install PackageName
# don't need to add this to script

# absolute filepath example:
# my_data <- read_csv("usr/nsilbiger/My Documents/ComputerModeling/Spring 2021/Lab 1/data/some_data.csv”)

# relative filepath example:
# my_data<-read_csv(here("Week_00", "data","sb_temp.csv"))
# uses here::here()
# (the left of the :: is the package name and to the right is the function name. In this case, they are both here)

# View(Data) opens a new window to look at the entire dataframe

