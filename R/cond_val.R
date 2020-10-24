#' Logical value to determine conditional options
#'
#' @param exclude_r_in List of logical values of formats to exclude R chuncks.
#'  This values default to params. May contain:
#'   \itemize{
#'     \item \code{html}
#'     \item \code{latex}
#'     \item \code{docx}
#'   }
#'
#' @return TRUE if \code{\link{formato}} in \code{exclude_r_in}, FALSE otherwise.
#'
#'@export
#'
#' @examples
#' \dontrun{
#' ```
#' knitr::opts_chunk$set(
#' echo = cond_val()
#' )
#' ```
#' }
#'
cond_val <- function(exclude_r_in) {
  if(!exclude_r_in$docx & formato() == 'docx'){
    FALSE
  } else if(!exclude_r_in$latex & formato() == 'latex'){
    FALSE
  }  else if(!exclude_r_in$html & formato() == 'html'){
    FALSE
  } else {
    TRUE
  }
}
