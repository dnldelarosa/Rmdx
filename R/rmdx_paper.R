#' Rmdx journal document (paper) format
#'
#' \lifecycle{experimental}
#'
#' This format is highly based in \code{\link[rticles]{arxiv_article}}.
#'
#' @param ... arguments to be passed to \code{\link[rmarkdown]{pdf_document}}
#'
#' @return An R Markdown output format object to be passed to \code{\link[rmarkdown]{render}}
#' @export
#'
#' @examples
#' \dontrun{
#' ---
#' ...
#' output: Rmdx::rmdx_paper
#' ---
#' }
rmdx_paper = function(...) {
  pkg_resource <-  function(...) {system.file(..., package = "Rmdx")}
  template <-  pkg_resource("resources/pdf/template.tex")
  fmt <- rmarkdown::pdf_document(..., template = template)
  fmt$inherits <- "pdf_document"
  fmt
}
