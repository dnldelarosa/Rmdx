#' Rmdx HTML document format
#'
#' \lifecycle{maturing}
#'
#'  This format is based in \code{\link[bookdown]{html_document2}}.
#'
#' @param toc logical See \code{\link[rmarkdown]{html_document}}
#' @param number_sections logical See \code{\link[rmarkdown]{html_document}}
#' @param highlight character See \code{\link[rmarkdown]{html_document}}
#' @param footer_copy character much be 'left' or 'right'
#' @param footer_name character author name to be included in footer
#' @param ... arguments to be passed to \code{\link[bookdown]{html_document2}}
#'
#' @details
#'
#' \itemize{
#'   \item{Added attractive header}
#'   \item{Added indentation to title levels}
#'   \item{Added footer credits}
#' }
#'
#'
#' @return An R Markdown output format object to be passed to \code{\link[rmarkdown]{render}}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' ---
#' ...
#' output: Rmdx::rmdx_html
#' ---
#' }
rmdx_html = function(
  toc = TRUE,
  number_sections = TRUE,
  highlight = 'espresso',
  footer_name = 'Daniel E. de la Rosa',
  footer_copy = 'left',
  ...) {
  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "Rmdx")
  }

  css = pkg_resource("resources/html/custom.css")
  tempFooter <- function(fName = footer_name, fCopy = footer_copy) {
    writeLines(paste0(
      '<div class="footer">',
                  paste0("Copy", fCopy),
                  ' <span class=',
                   paste0("copy", fCopy),'>
                    &copy;
                  </span>
                  ', format(Sys.Date(), '%Y'),' - ',
      fName,
      '   w/   <a target="_blank" href="https://drdsdaniel.github.io/Rmdx/">Rmdx</a> </div>'
    ), con = tf <- tempfile(fileext = '.html'))
    tf
  }

  # call the base html_document function
  bookdown::html_document2(
    toc = toc,
    number_sections = number_sections,
    css = css,
    highlight = highlight,
    includes = rmarkdown::includes(after_body = tempFooter()),
    ...
  )
}
