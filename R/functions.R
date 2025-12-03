  #' Create descriptive stats for each metabolite. Put it in a neat table
  #'
  #' @param data
  #'
  #' @returns
  #' A data.frame/tibble
create_table_descriptive_stats <- function(data) {
  descriptive_table <- data |>
    dplyr::group_by(metabolite) |>
    dplyr::summarise(dplyr::across(value, list(mean = mean, sd = sd))) |>
    dplyr::mutate(dplyr::across(tidyselect::where(is.numeric), \(x) round(x, digits = 1))) |>
    dplyr::mutate(MeanSD = glue::glue("{value_mean} ({value_sd})")) |>
    dplyr::select(Metabolite = metabolite, `Mean SD` = MeanSD)
  return(descriptive_table)
}

  #' Visualises metabolite value distributions
  #'
  #' @param data
  #'
  #' @returns A plot object
create_plot_distributions <- function(data) {

  data |>
    ggplot2::ggplot(
      ggplot2::aes(x = value)
    ) +
    ggplot2::geom_histogram() +
    ggplot2::facet_wrap(ggplot2::vars(metabolite), scales = "free") +
    ggplot2::theme_minimal()
}


#' Clean up data mitigating redudancy
#'
#' @param data The lipidomics dataframe
#'
#' @returns a data.frame
clean <- function(data) {
  data |>
    dplyr::group_by(dplyr::pick(-value)) |> # We group by all the columns except value because then we can keep all the columns
    dplyr::summarise(value = mean(value), .groups = "keep") |>
    dplyr::ungroup()
}
