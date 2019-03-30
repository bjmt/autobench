#' Skip the next set of benchmarks.
#'
#' @return NULL, invisibly.
#'
#' @author Benjamin Jean-Marie Tremblay
#' @export
skip <- function() {

  missing.settings <- paste0("Could not find benchmark settings, make sure to",
                             " call autobench::setup() first")
  skip <- tryCatch(get(".autobench_skip", envir = baseenv()),
                   error = function(e) stop(missing.settings))

  assign(".autobench_skip", list(skip = TRUE), envir = baseenv())

  invisible(NULL)

}
