# Hawaii Biogeochemistry Homework ----
# Created by: Mac Hein
# Created on: 2023-02-16

# Load Libraries ----

library(tidyverse)
library(here)

# Load Data ----

ChemData<-read_csv(here("Week_04","data", "chemicaldata_maunalua.csv"))

View(ChemData)
glimpse(ChemData)

# Data Analysis ----

# Remove the NAs

# Separate the Tide_time column into appropriate columns for analysis

# Filter out a subset of data (your choice)



ChemData_clean <- ChemData %>%
  filter(complete.cases(.)) %>% # filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide","Time"), # separate it into two columns Tide and time
           sep = "_") %>% # separate by _
  filter(Zone == "Ambient")

View(ChemData_clean)

# Use either pivot_longer or pivot_wider at least once

ChemData_long <-ChemData_clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, # The cols you want to pivot.
                                           # This says select the temp to
                                           # percent SGD cols
               names_to = "Variables", # the names of the new cols with all the
                                       # column names
               values_to = "Values") # names of the new column with all the
                                     # values

View(ChemData_long)

# Calculate some summary statistics (can be anything) and export the csv file
# into the output folder

ChemData_long %>%
  group_by(Variables, Site) %>% # group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean
            Param_vars = var(Values, na.rm = TRUE)) %>% # get variance
  write_csv(here("Week_04","output","homework_summary.csv")) # export as a
                                                             # csv to the right
                                                             # folder

# Make any kind of plot (it cannot be a boxplot) and export it into the output
# folder

ChemData_long %>%
  group_by(Variables, Site, Season) %>% # group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean
            Param_vars = var(Values, na.rm = TRUE)) %>% # get variance
  write_csv(here("Week_04","output","homework_summary.csv")) %>% # export as a
                                                                 # csv to the
                                                                 # right folder
  ggplot(aes(fill = Variables, x = Season, y = Param_means))+ 
  geom_bar(position="dodge", stat="identity")+ 
  facet_wrap(Site~Variables, scales = "free") +
  scale_fill_viridis_d(option = "mako") +
  labs(y = "Mean Values", title = "Summary statistics of variables by site and season") +
  theme_bw() +
  theme(legend.position="none")

View(ChemData_long)

ggsave(here("Week_04","output","Biogeochemistry_homework.png"), width = 10, height = 10)

# Make sure you comment your code and your data, outputs, and script are in the
# appropriate folders


