#' Rmdx DOCX document format
#'
#' \lifecycle{experimental}
#'
#'  This format is based in \code{\link[officedown]{rdocx_document}}.
#'
#' @param toc logical See \code{\link[rmarkdown]{word_document}}
#'
#' @return An R Markdown output format object to be passed to \code{\link[rmarkdown]{render}}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' ``` yaml
#' ---
#' ...
#' output: Rmdx::rmdx_docx
#' ---
#' ```
#' }
rmdx_docx = function(toc = TRUE) {
  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "Rmdx")
  }

  base_docx = pkg_resource("resources/docx/base.docx")

  # call the base html_document function
  officedown::rdocx_document(
    toc = toc,
    highlight = 'pygments',
    reference_docx = base_docx
  )
}
