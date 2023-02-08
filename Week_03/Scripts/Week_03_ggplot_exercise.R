# Week 3 ggplot exercise ####
# Learning to use ggplot
# Created by: MacKenzie Hein
# Created on: 2023-02-07

library(palmerpenguins)

glimpse(penguins)

ggplot(data=penguins)

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm))

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm))

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm)) +
  geom_point()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()+
  labs(title = "Bill depth and length")

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins")

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)")

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species")

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species",
       caption = "Source: Palmer Station LTER / palmerpenguins package")

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species",
       caption = "Source: Palmer Station LTER / palmerpenguins package")

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species",
       caption = "Source: Palmer Station LTER / palmerpenguins package")+
  scale_color_viridis_d()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species)) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species") +
  scale_color_viridis_d()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     shape = island
       )) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species") +
  scale_color_viridis_d()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     shape = species
       )) +
  geom_point()+
  scale_color_viridis_d()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     size = body_mass_g
       )) +
  geom_point()+
  scale_color_viridis_d()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     size = body_mass_g,
                     alpha = flipper_length_mm
       )) +
  geom_point()+
  scale_color_viridis_d()

# Mapping

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     size = body_mass_g,
                     alpha = flipper_length_mm
       )) +
  geom_point()

# Setting

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm)) +
  geom_point(size = 2, alpha = 0.5)

# Faceting

ggplot(penguins, 
       aes(x = bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(species~sex)

# make multiple plots groups by species on the y (rows) and and sex on the x (columns)

ggplot(penguins, 
       aes(x = bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(sex~species)

# make multiple plots groups by sex on the y (rows) and and species on the x (columns)

ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point() +
  facet_wrap(~ species)

ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point() +
  facet_wrap(~ species, ncol=2) # make it two columns

# Facet and color ####

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
       )) +
  geom_point()+
  scale_color_viridis_d()+
  facet_grid(species~sex)

# Facet and color, no legend ####

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
       )) +
  geom_point()+
  scale_color_viridis_d()+
  facet_grid(species~sex)+
  guides(color = FALSE)

