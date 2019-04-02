#' Skip the next set of benchmarks.
#'
#' @return `NULL`, invisibly.
#'
#' @author Benjamin Jean-Marie Tremblay
#' @export
skip <- function() {

  missing.settings <- paste0("Could not find benchmark settings, make sure to",
                             " call autobenchR::begin() first")

  if (.autobenchR_env$begin$invalid) stop(missing.settings)

  .autobenchR_env$skip <- c(skip = TRUE)

  invisible(NULL)

}
