# R4DS Chapter 3 ####
# Practice exercises from Ch. 3 of the R4DS textbook
# Created by: MacKenzie Hein
# Created on: 2023-02-06

library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

