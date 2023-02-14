# Plotting Penguin Data ----
# Created by: Mac Hein
# Created on: 2023-02-14

# Load Libraries ----
library(palmerpenguins)
library(tidyverse)
library(here)
library(devtools) # load the development tools library

# Load Data ----
# The data is part of the package and is called penguins.
glimpse(penguins)

# Data Analysis ----
head(penguins)
filter(.data = penguins, sex == "female" )
filter(.data = penguins, year == "2008")
filter(.data = penguins, body_mass_g > 5000)

# These are equivalent, but the second is preferable.
#   Default treats "," as "and", but "&" is less ambiguous.
filter(.data = penguins, sex == "female", body_mass_g > 5000)
filter(.data = penguins, sex == "female" & body_mass_g > 5000)

# Measured in 2008 or 2009
filter(.data = penguins, year %in% c("2008", "2009"))
filter(.data = penguins, year == "2008" | year == "2009")

# Not from Dream
filter(.data = penguins, island != "Dream")

# Species is Adelie or Gentoo
filter(.data = penguins, species %in% c("Adelie", "Gentoo"))
filter(.data = penguins, species == "Adelie" | species == "Gentoo")

# Body mass is between 3000 and 5000 g
# Wrong
# filter(.data = penguins, 3000 < body_mass_g <5000)
# Right
filter(.data = penguins, body_mass_g <5000, body_mass_g >3000)

# From Dream or Biscoe
# Wrong
# filter(.data = penguins, island == "Dream", island == "Biscoe")
# Right
filter(.data = penguins, island %in% c("Dream","Biscoe"))

# Mutate body mass units to kilograms
data2 <- mutate(.data = penguins, body_mass_kg = body_mass_g/1000)
View(data2)

data2 <- mutate(.data = penguins, 
              body_mass_kg = body_mass_g/1000,
              bill_length_depth = bill_length_mm/bill_depth_mm)
# convert mass to kg 
# calculate the ratio of bill length to depth
View(data2)

# https://dplyr.tidyverse.org/reference/mutate_all.html
#   mutate_if(.tbl, .predicate, .funs, ...)
#   mutate_at(.tbl, .vars, .funs, ..., .cols = NULL)
#   mutate_all(.tbl, .funs, ...)

# Mutate with ifelse
data2 <- mutate(.data = penguins,
               after_2008 = ifelse(year > 2008, "After 2008", "Before 2008"))
View(data2)

data2 <- mutate(.data = penguins,
                length_and_mass = body_mass_g + flipper_length_mm,
                size = ifelse(body_mass_g > 4000, "Big", "Small"))
# Add flipper length and body mass together
# Body mass greater than 4000 is big, everything else is small
View(data2)

penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) #calculate log biomass

penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(species, island, sex, log_mass)

penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(Species = species, island, sex, log_mass)

penguins %>% # 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE))

penguins %>% # 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
            min_flipper = min(flipper_length_mm, na.rm=TRUE))

penguins %>%
  group_by(island) %>%
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            max_bill_length = max(bill_length_mm, na.rm=TRUE))

penguins %>%
  group_by(island, sex) %>%
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            max_bill_length = max(bill_length_mm, na.rm=TRUE))

penguins %>%
  drop_na(sex)

penguins %>%
  drop_na(sex) %>%
  group_by(island, sex) %>%
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE))

penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot()

devtools::install_github("jhollist/dadjoke")

dadjoke()

