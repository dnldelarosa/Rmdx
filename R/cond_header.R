#' Conditional headers
#'
#' Insert headers conditionally in the document
#'
#' @param text character Text of header
#' @param hlevel num Level of header
#' @param cond_value An instance of \code{\link{cond_val}}
#'
#' @return character Conditional Markdown header of the given level
#' @export
#'
#' @examples
cond_header <- function(cond_value, text = ' ', hlevel = 1){
  if(cond_value) {
    paste0(rep('#', hlevel), ' ', text)
  }
}
