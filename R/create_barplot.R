library(ggplot2)

create_barplot <- function(data, x, y, fill = NULL, orientation = c("vertical", "horizontal"), x_lab = NULL, y_lab = NULL) {
  orientation <- match.arg(orientation)

  colors <- unlist(my_company_colors()) # unlist to convert from list to vector

  # Base plot
  p <- ggplot(data, aes_string(x = x, y = y)) +
    geom_bar(stat = "identity", fill = colors["primary"]) + # apply the color directly
    theme_my_company() +
    theme(
      panel.grid.major = element_blank(), # remove major gridlines
      panel.grid.minor = element_blank(), # remove minor gridlines
      axis.title.x = element_blank(), # remove x axis title
      axis.title.y = element_blank()  # remove y axis title
    )

  # Optional fill aesthetic and color scale
  if (!is.null(fill)) {
    p <- p + scale_fill_manual(values = colors, aesthetics = fill)
  }

  # Optional manual axis labels
  if (!is.null(x_lab)) {
    p <- p + labs(x = x_lab)
  }

  if (!is.null(y_lab)) {
    p <- p + labs(y = y_lab)
  }

  # Optional plot orientation
  if (orientation == "horizontal") {
    p <- p + coord_flip()
  }

  return(p)
}
