# Practicing joins with data from Becker and Silbiger (2020) ----
# Created by: Mac Hein ----
# Created on: 2023-02-21 ----

# Load Libraries ----

library(tidyverse)
library(here)
library(cowsay)

# Load data ----

# Environmental data from each site

EnviroData<-read_csv(here("Week_05","Data", "site.characteristics.data.csv"))

#Thermal performance data

TPCData<-read_csv(here("Week_05","Data","Topt_data.csv"))
glimpse(EnviroData)
glimpse(TPCData)

# also use View()

# Data Analysis ----

EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured,
              values_from = values)

View(EnviroData_wide)

EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured, # pivot the data wider
              values_from = values) %>%
  arrange(site.letter) # arrange the dataframe by site

View(EnviroData_wide)

FullData_left<- left_join(TPCData, EnviroData_wide)

head(FullData_left)

FullData_left<- left_join(TPCData, EnviroData_wide) %>%
  relocate(where(is.numeric), .after = where(is.character)) # relocate all the numeric data after the character data

head(FullData_left)

# Think, Pair, Share

View(EnviroData)

Envirodata_long <- EnviroData %>%
  pivot_longer(cols = values,
               names_to = "Variables",
               values_to = "Values") %>%
  arrange(site.letter)

View(Envirodata_long)

View(TPCData)

TPCData_long <- TPCData %>%
  pivot_longer(cols = E:Topt,
               names_to = "Variables",
               values_to = "Values")

View(TPCData_long)

# Make 1 tibble

T1 <- tibble(Site.ID = c("A", "B", "C", "D"), 
             Temperature = c(14.1, 16.7, 15.3, 12.8))
T1

# make another tibble

T2 <- tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2

# left join vs right join

left_join(T1, T2)

right_join(T1, T2)

# inner join vs full join

inner_join(T1, T2)

full_join(T1, T2)

# semi join vs anti join

semi_join(T1, T2)

anti_join(T1, T2)

# my tibbles

MyT1 <- tibble(growth_medium = c("W", "X", "Y", "Z"),
               NaClM = c(2.0, 1.5, 1.0, 0.5))
MyT1

MyT2 <- tibble(growth_medium = c("V", "W", "Y", "Z"),
               KClM = c(3.0, 2.5, 2.0, 1.5))
MyT2

left_join(MyT1, MyT2)

right_join(MyT1, MyT2)

inner_join(MyT1, MyT2)

full_join(MyT1, MyT2)

semi_join(MyT1, MyT2)

anti_join(MyT1, MyT2)

# Today's totally awesome R package: {cowsay} ----

say("hello", by = "endlesshorse")
