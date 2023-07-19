library(tidyverse)
library(extrafont)

# tables (gt) -------------------------------------------------------------

library(gt)

.gt_finalise <- function(.gt, ...) {
  
  .gt <- .gt |> 
    cols_align(
      align = "center",
      columns = everything()
    ) |> 
    fmt_number(columns = is.numeric, decimals = 4)
  
  .gt
}

# plots -------------------------------------------------------------------

custom_theme <- theme_bw(base_size = 11) + 
  theme(
    plot.title = ggtext::element_markdown(size = 24),
    legend.position = "bottom",
    legend.background = element_blank(),
    plot.title.position = "plot",
    plot.caption = ggtext::element_markdown(size = 16, hjust = 0),
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

update_geom_defaults("point", list(shape = 21, color = "black", size = 1.4))
update_geom_defaults("line", list(size = 1., color = .co("blue")))

`-.gg` <<- function(e1, e2) e2(e1)

.gg_finalise <- function(p = ggplot2::last_plot())  {
  
  p
}