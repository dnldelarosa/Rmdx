#' Title
#'
#' @param df a data.frame
#' @param caption A caption for returning table
#'
#' @return A kableExtra table for 'latex' \code{\link{formato}},
#'  a DT table for 'html' \code{\link{formato}} and
#'  a flextable table for 'docx' \code{\link{formato}}.
#'
#' @export
#'
#' @importFrom magrittr %>%
#'
cond_table <- function(df, caption = " "){
  if(formato() == 'latex'){
    knitr::kable(
      df,
      "latex",
      caption = caption,
      longtable = T,
      booktabs = T
    ) %>%
      kableExtra::kable_styling(
        latex_options = c("repeat_header")
      )
  } else if(formato() == 'html'){
    DT::datatable(df, caption = caption)
  } else {
    flextable::set_caption(
      flextable::flextable(df),
      caption = caption,
      autonum = officer::run_autonum(pre_label = 'Tabla ')
      )
  }
}
