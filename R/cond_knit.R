#' Custom knit function
#'
#' @param inputFile File that pass to \code{\link[rmarkdown]{render}}
#' @param encoding Encoding system pass to \code{\link[rmarkdown]{render}}
#'
#' @return \code{\link[rmarkdown]{render}} instance
#' @export
#'
cond_knit <- function(inputFile, encoding) {
  rmarkdown::render(
    input         = inputFile,
    output_format = 'all',
    encoding      = encoding
  )
}
