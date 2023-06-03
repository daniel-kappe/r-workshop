install.packages(c("palmerpenguins", "tidyverse"))
library(tidyverse)
library(palmerpenguins)
?palmerpenguins

penguins
glimpse(penguins)
View(penguins)

ggplot(penguins)

penguins |> 
  ggplot(
    mapping = aes(
      x = flipper_length_mm,
      y = body_mass_g,
      color = species
      )
  ) +
  geom_point() +
  geom_smooth(color = 'black') +
  labs(
    title = "Pinguine am Südpol",
    subtitle = "Studie von Alison Hill",
    x = "Flügellänge / mm",
    y = "Körpergewicht / g",
    color = "Spezies"
  )

penguins |> 
  ggplot(
    mapping = aes(
      x = body_mass_g,
      fill = flipper_length_mm < 200
    )
  ) +
  geom_histogram() +
  facet_wrap(
    ~species
  )


?mpg
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_smooth() +
  geom_jitter(width = 0.1, height = 0)

?geom_jitter

ggplot(data = mpg, mapping = aes(x = drv, fill = class)) +
  geom_bar(position = "stack")

ggplot(data = mpg, mapping = aes(x = drv, fill = class)) +
  geom_bar(position = "identity")

ggplot(data = mpg, mapping = aes(x = drv, fill = class)) +
  geom_bar(position = "fill")

ggplot(data = mpg, mapping = aes(x = drv, fill = class)) +
  geom_bar(position = "dodge")

?geom_bar
