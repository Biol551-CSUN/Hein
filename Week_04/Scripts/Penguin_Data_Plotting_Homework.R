# Penguin Data Plotting Homework ----
# Created By: Mac Hein
# Created On: 2023-02-14

# Load Libraries ----

library(palmerpenguins)
library(tidyverse)
library(here)
library(ggdist)

# Load Data ----

glimpse(penguins)

# Data Analysis ----

# Calculate the mean and variance of body mass by species, island,
# and sex without any NAs

mean_and_var_bm <- penguins %>%
  drop_na(species, island, sex) %>%
  group_by(species, island, sex) %>%
  summarise(mean_body_mass_g = mean(body_mass_g, na.rm = TRUE),
            variance_body_mass_g = var(body_mass_g, na.rm = TRUE))

glimpse(mean_and_var_bm)

# Filter out (i.e. exclude) male penguins, then calculate the log body mass,
# then select only the columns for species, island, sex, and log body mass,
# then use these data to make any plot.
# Make sure the plot has clean and clear labels and follows best practices.
# Save the plot in the correct output folder.

penguins %>% # use penguin dataframe
  filter(sex != "male") %>% # exclude male penguins
  mutate(log_mass = log(body_mass_g)) %>% # calculate log biomass
  select(species, island, sex, log_mass) %>% # select the species, island, sex,
                                             # and log body mass columns
  ggplot(aes(x = species, y = log_mass, fill = species)) +
  #geom_boxplot() +
  ggdist::stat_dots(side = "both") +
  scale_fill_viridis_d(option = "mako") +
  labs(title = "Log body masses of female penguins by species",
       x = "Species", y = "Log Mass (g)", fill = "Species",
       caption = "Source: Palmer Station LTER / palmerpenguins package") +
  theme_bw()

ggsave(here("Week_04","output","penguin_log_mass_homework.png"))

