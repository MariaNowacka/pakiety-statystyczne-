library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(nycflights13)
view(penguins)
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = bill_depth_mm)) +
  geom_smooth()
  
view(flights)

by_dest <- group_by(flights, dest)
delay <- summarize(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm =TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))
delay <- filter(delay, count > 20, dest != "HNL")
view(delay)
flights |> 
  group_by(month) |>
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  )

flights |> 
  filter(arr_delay > 120)|>
  filter(dest %in% c("IAH", "HOU")) |>
  filter(month %in% c(7, 8, 9)) |> view()
  filter(dep_delay <= 0) |> 

