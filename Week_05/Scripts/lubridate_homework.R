# Lubridate Homework ----
# Made By: Mac Hein
# Made On: 2023-02-23

# Load Libraries ----

library(tidyverse)
library(here)
library(lubridate)

# Load Data ----

#CondData <- read_csv(here("Week_05","Data", "CondData.csv"))

#View(CondData)

#DepthData <- read_csv(here("Week_05", "Data", "DepthData.csv"))

#View(DepthData)

# Data Analysis ----

# Rounding dates to the nearest 10 seconds

CondData_mutated <- CondData %>%
  mutate(date = mdy_hms(date),
         date = round_date(date, "10 seconds"))

#View(CondData_mutated)

DepthData_mutated <- DepthData %>%
  mutate(date = ymd_hms(date),
         date = round_date(date, "10 seconds"))

#View(DepthData_mutated)

# - Joining data with inner join to remove NAs
# - Grouping by timestamp
# - Summarizing mean values for date, depth, temperature, salinity,
#   and absolute pressure
# - Writing .csv file to data folder
# - Making a plot of the data

FullData_inner <- inner_join(CondData_mutated, DepthData_mutated)%>%
  mutate(timestamp = round_date(date, "1 minute"))%>%
  group_by(timestamp)%>%
  summarize(mean_date = mean(date, na.rm = TRUE),
            mean_depth = mean(Depth, na.rm = TRUE),
            mean_temperature = mean(Temperature, na.rm = TRUE),
            mean_salinity = mean(Salinity, na.rm = TRUE),
            mean_abs_pressure = mean(AbsPressure, na.rm = TRUE))%>%
  pivot_longer(cols = mean_depth:mean_abs_pressure, # Pivoted cols: mean_depth to mean_abs_pressure
               names_to = "Variables", # name of new col with all the column names
               values_to = "Values")%>% # name of new col with all the values
  write_csv(here("Week_05","Data","homework_fulldata.csv"))%>%
  ggplot(aes(fill = Variables, x = timestamp, y = Values)) +
  geom_line(linewidth = 0.1, alpha = 0.5) +
  geom_smooth() +
  facet_wrap(~Variables, scales = "free") +
  scale_fill_viridis_d(option = "mako")+
  theme_light() +
  labs(title = "Summary statistics for conductivity and depth data",
       x = "Time", y = "Value")

FullData_inner

ggsave(here("Week_05","output","lubridate_homework.png"), width = 10, height = 10)
