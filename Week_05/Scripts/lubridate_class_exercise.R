# Lubridate In-Class Exercise ----
# Made By: Mac Hein
# Made On: 2023-02-23

# Load Libraries ----

library(tidyverse)
library(here)
library(lubridate)
library(devtools)
library(CatterPlots)

# Load Data ----

CondData <- read_csv(here("Week_05","Data", "CondData.csv"))
glimpse(CondData)

DepthData <- read_csv(here("Week_05", "Data", "DepthData.csv"))
glimpse(DepthData)

# Data Analysis ----

now() #what time is it now?

now(tzone = "EST") # what time is it on the east coast

now(tzone = "GMT") # what time in GMT

today()

today(tzone = "GMT")

am(now()) # is it morning?

pm(now()) # is it after noon?

leap_year(now()) # is it a leap year?

# 2023-02-23:

ymd("2023-02-23")

# 02/23/2023:

mdy("02/23/2023")

# February 23 2023

mdy("February 23 2023")

# 23/02/2023

dmy("23/02/2023")

# 2023-02-23 2:30:00 PM

ymd_hms("2023-02-23 2:30:00 PM")

# 02/23/2023 14:30:00

mdy_hms("02/23/2023 14:30:00")

# February 23 2023 2:30 PM

mdy_hm("February 23 2023 2:30 PM")

# make a character string

datetimes <- c("02/23/2023 22:22:20",
               "02/24/2023 11:21:10",
               "02/25/2023 8:01:52")

# convert to datetimes

datetimes <- mdy_hms(datetimes)

month(datetimes)
month(datetimes, label = TRUE)
month(datetimes, label = TRUE, abbr = FALSE) #Spell it out

day(datetimes) # extract day

wday(datetimes, label = TRUE) # extract day of week

hour(datetimes)
minute(datetimes)
second(datetimes)

datetimes + hours(4) # this adds 4 hours
datetimes + days(2) # this adds 2 days

round_date(datetimes, "minute") # round to nearest minute
round_date(datetimes, "5 mins") # round to nearest 5 minute

# Think, pair, share

CondData_mutated <- CondData %>%
  mutate(Date = mdy_hm(Date))

# Today's totally awesome R package

x <- c(1:10) # make up some data
y <- c(1:10)

catplot(xs=x, ys=y, cat=3, catcolor='blue')

