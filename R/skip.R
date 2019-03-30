#' Skip the next set of benchmarks.
#'
#' @return `NULL`, invisibly.
#'
#' @author Benjamin Jean-Marie Tremblay
#' @export
skip <- function() {

  missing.settings <- paste0("Could not find benchmark settings, make sure to",
                             " call autobench::begin() first")
  run.settings <- tryCatch(get(".autobench_info", envir = baseenv()),
                           error = function(e) stop(missing.settings))
  if (run.settings$invalid) stop(missing.settings)
  skip <- tryCatch(get(".autobench_skip", envir = baseenv()),
                   error = function(e) stop(missing.settings))

  assign(".autobench_skip", list(skip = TRUE), envir = baseenv())

  invisible(NULL)

}
