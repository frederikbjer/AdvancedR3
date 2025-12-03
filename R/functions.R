create_table_descriptive_stats <- function(data) {
  #' Create descriptive stats for each metabolite. Put it in a neat table
  #'
  #' @param data
  #'
  #' @returns
  #' A data.frame/tibble
  descriptive_table <- data |>
    dplyr::group_by(metabolite) |>
    dplyr::summarise(dplyr::across(value, list(mean = mean, sd = sd))) |>
    dplyr::mutate(dplyr::across(tidyselect::where(is.numeric), \(x) round(x, digits = 1))) |>
    dplyr::mutate(MeanSD = glue::glue("{value_mean} ({value_sd})")) |>
    dplyr::select(Metabolite = metabolite, `Mean SD` = MeanSD)
  return(descriptive_table)
}

create_plot_distributions <- function(data) {
  #' Visualises metabolite value distributions
  #'
  #' @param data
  #'
  #' @returns A plot object

  data |>
    ggplot2::ggplot(
      ggplot2::aes(x = value)
    ) +
    ggplot2::geom_histogram() +
    ggplot2::facet_wrap(ggplot2::vars(metabolite), scales = "free") +
    ggplot2::theme_minimal()
}
