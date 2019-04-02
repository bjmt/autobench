#' Insert notes in an autobench run.
#'
#' @param ... User notes. The individual elements
#'    will have two newline characters separating them.
#' @param name Name of note section.
#'
#' @return `NULL`, insivibly.
#'
#' @author Benjamin Jean-Marie Tremblay
#' @export
note <- function(..., name = "Note") {

  missing.settings <- paste0("Could not find benchmark settings, make sure to",
                             " call autobench::begin()")
  run.settings <- .autobench_env$begin
  if (run.settings$invalid) stop(missing.settings)

  file <- run.settings$file
  out.format <- run.settings$format

  if (out.format == "md") name <- paste0("\n## ", name)
  else name <- paste0("\n>>> ", name)

  cat(name, ..., sep = "\n\n", file = file, append = TRUE)

  invisible(NULL)

}
