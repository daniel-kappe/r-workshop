install.packages(c("tidyverse", "nycflights13"))
library(nycflights13)
library(tidyverse)

View(flights)
?flights

# Filter
flights |> 
  filter(
    origin == "JFK" & (month != 7) & day == 1
  )

flights |> 
  filter(
    origin == "JFK" & (month %in% c(1, 3, 5, 7, 8, 10, 12)) & day == 1
  )

# Arrange
flights |> 
  arrange(month, day, desc(dep_delay))

# Distinct
flights |> 
  distinct(origin, dest)

flights |> 
  distinct(day, .keep_all = TRUE)

flights |> 
  count(origin, dest, sort = TRUE)

## Welcher Flug war hatte die größte Zeitersparnis im Vergleich zur eigentlich Dauer
flights |> 
  arrange(arr_delay - dep_delay) -> shorter_flights
View(shorter_flights)

flights |> 
  arrange(distance / air_time)

# Mutate
flights |> 
  mutate(
    gain = arr_delay - dep_delay,
    speed = distance / air_time * 60
  ) |> 
  View()

flights |> 
  mutate(
    gain = arr_delay - dep_delay,
    speed = distance / air_time * 60,
    .before = 1
  ) |> 
  View()

flights |> 
  mutate(
    gain = arr_delay - dep_delay,
    speed = distance / air_time * 60,
    .after = day
  ) |> 
  View()

# Select
flights |> 
  select(1:4)

flights |> 
  select(!year:day)

flights |> 
  select(starts_with("dep_") | starts_with("arr_"))

# Rename
flights |> 
  rename(abflug = dep_time)

# Group_by
flights |> 
  group_by(year, month, day) |> 
  summarise(
    avg_dep_delay = mean(dep_delay, na.rm = TRUE),
    number_of_flights = n()
  )

flights |> 
  group_by(year, month, day) |> 
  summarise(
    avg_dep_delay = mean(dep_delay, na.rm = TRUE),
    number_of_flights = n(),
    .groups = "keep"
  ) |> 
  ungroup()

# Slices
flights |> 
  slice_head(n=2)

## Welcher Zielflughafen hatte im Mittel die am stärksten verspäteten Flüge?
flights |> 
  group_by(dest) |> 
  summarise(
    avg_arr_delay = mean(arr_delay, na.rm = TRUE)
  ) |> 
  arrange(desc(avg_arr_delay))

## Zu welcher Stunde sind die Flüge im Mittel am stärksten Verspätet?
flights |> 
  group_by(hour, origin) |> 
  summarise(
    avg_dep_delay = mean(dep_delay, na.rm = TRUE),
    n = n()
  ) |> 
  ggplot(
    mapping = aes(x = hour, y = avg_dep_delay, fill=origin)
  ) +
  geom_col(position = "dodge")

?geom_bar
