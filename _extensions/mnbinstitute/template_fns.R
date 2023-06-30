library(tidyverse)
library(extrafont)

# tables (gt) -------------------------------------------------------------

library(gt)

.gt_finalise <- function(.gt, ...) {
  
  .gt
}

# plots -------------------------------------------------------------------

custom_theme <- theme_minimal(base_family = "IBM Plex Sans", base_size = 18) + 
  theme(
    title = element_text(size = 20, face = "bold"),
    strip.text = element_text(size = 20, family = "IBM Plex Sans Medium", face = NULL),
    strip.background = element_rect(fill = "#90d1d5"),
    legend.position = "bottom",
    legend.background = element_blank(),
    plot.caption = element_text(size = 16, face = "italic", hjust = 0),
    plot.caption.position = "plot",
  )

theme_set(custom_theme)

# suggested colors for mnb

.co_pal <- tribble(
  ~ hex_code, ~ name,
  "#18223e", "blue",
  "#6fa0be", "blue2", 
  "#f8c567", "yellow",
  "#b2242a", "red",
  "#7aa140", "green",
  "#da3232", "red2",
  "#e57b2b", "orange",
  "#787975", "grey", 
  "#b9e1eb", "blue3"
) |> 
  pull(hex_code, name = name)

.co <- \(x) set_names(.co_pal[x], NULL)

update_geom_defaults("point", list(shape = 21, color = "black", size = 4))
update_geom_defaults("line", list(size = 4, color = .co("blue")))

`-.gg` <<- function(e1, e2) e2(e1)

.gg_finalise <- function(plot_name = ggplot2::last_plot())  {
  plot_name
}

