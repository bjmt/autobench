#' autobench: Automated code benchmarking
#'
#' @docType package
#' @name autobench-pkg
#'
#' @importFrom knitr kable
#' @importFrom sessioninfo session_info
#' @importFrom profmem readRprofmem
#' @importFrom tictoc tic toc
#' @importFrom utils packageDescription capture.output Rprofmem
#' @importFrom methods is
NULL

.autobench_env <- new.env(parent = emptyenv())

.onLoad <- function(libname, pkgname) {

  .autobench_env$begin <- list(file = NULL, quiet = NULL, counter = NULL,
                               max.reps = NULL, min.time = NULL, check = NULL,
                               unit = NULL, stop.on.fail = NULL, format = NULL,
                               session.info = NULL, invalid = TRUE)

  .autobench_env$update <- list(max.reps = NULL, min.time = NULL, unit = NULL,
                                check = NULL, min.reps = NULL, tool = NULL,
                                stop.on.fail = NULL, permanent = FALSE)

  .autobench_env$skip <- c(skip = FALSE)

}
