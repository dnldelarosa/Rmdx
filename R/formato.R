#' Get the currently knitting format
#'
#' @return A character string representing the current knitting document format. The 'html' value if interactive session.
formato <- function() {
  ifelse(
    is.null(knitr::opts_knit$get("rmarkdown.pandoc.to")[[1]]),
    "html",
    knitr::opts_knit$get("rmarkdown.pandoc.to")[[1]]
  )
}
