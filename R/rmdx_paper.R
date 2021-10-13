#' Rmdx journal document (paper) format
#'
#' \lifecycle{experimental}
#'
#' This format is highly based in \code{\link[rticles]{arxiv_article}}.
#' The main changes can be summarized as:
#'   1. An alternative abstract (\code{abstract_alt}) is included with its respective
#'   title (\code{aatitle}). Which can be used to write the abstract in another
#'   language.
#'   2. A short title (\code{short-title}) is included and placed at the top of
#'   the document pages.
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
