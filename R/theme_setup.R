library(ggplot2)

theme_my_company <- function() {
  theme_minimal(base_family = "Arial") +
    theme(
      plot.title = element_text(color = rgb(27/255, 87/255, 104/255), size = 14, face = "bold"),
      # Further theming options
    )
}
