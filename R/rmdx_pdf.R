#' Rmdx PDF document format
#'
#' \lifecycle{maturing}
#'
#' This format is based in \code{\link[bookdown]{pdf_document2}}.
#'
#' @param toc logical See \code{\link[rmarkdown]{pdf_document}}
#' @param latex_engine character See \code{\link[rmarkdown]{pdf_document}}
#' @param ... arguments to be passed to \code{\link[bookdown]{pdf_document2}}
#'
#' @return An R Markdown output format object to be passed to \code{\link[rmarkdown]{render}}
#' @export
#'
#' @examples
#' \dontrun{
#' ---
#' ...
#' output: Rmdx::rmdx_pdf
#' ---
#' }
rmdx_pdf = function(toc = TRUE, latex_engine = 'xelatex', ...) {
  bookdown::pdf_document2(
    toc = toc,
    latex_engine = latex_engine,
    ...
  )
}
