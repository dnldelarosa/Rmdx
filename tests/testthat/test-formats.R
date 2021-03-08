context("formats")

test_that("formats successfully produce a document", {
  local_edition(3)
  testFormat <- function(output_format) {
    output_file <- I(tempfile())
    on.exit(unlink(output_file), add = TRUE)
    rmarkdown::render(test_path("test-formats.Rmd"),
           output_format = output_format,
           output_file = output_file,
           quiet = TRUE)
    expect_snapshot_file(output_file)
  }

  testFormat(rmdx_html())
  #testFormat(rmdx_docx())
  #testFormat(rmdx_pdf())
})
