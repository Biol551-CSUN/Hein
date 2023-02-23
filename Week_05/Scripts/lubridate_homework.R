# Lubridate Homework ----
# Made By: Mac Hein
# Made On: 2023-02-23

# Load Libraries ----

library(tidyverse)
library(here)
library(lubridate)

# Load Data ----

CondData <- read_csv(here("Week_05","Data", "CondData.csv"))

View(CondData)

DepthData <- read_csv(here("Week_05", "Data", "DepthData.csv"))

View(DepthData)

# Data Analysis ----

CondData %>%
  mutate(date = mdy_hms(date)) %>%
  round_date(date, "10 seconds")

View(CondData)

DepthData %>%
  mutate(date = mdy_hms(date)) %>%
  round_date(date, "10 seconds")

View(DepthData)


