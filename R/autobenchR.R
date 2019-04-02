#' autobenchR: Automated code benchmarking
#'
#' @docType package
#' @name autobenchR-pkg
#'
#' @importFrom knitr kable
#' @importFrom sessioninfo session_info
#' @importFrom profmem readRprofmem
#' @importFrom tictoc tic toc
#' @importFrom utils packageDescription capture.output Rprofmem
#' @importFrom methods is
NULL

.autobenchR_env <- new.env(parent = emptyenv())

.onLoad <- function(libname, pkgname) {

  .autobenchR_env$begin <- list(invalid = TRUE)

  .autobenchR_env$update <- list()

  .autobenchR_env$skip <- logical()

}

# 2.0.0 ideas:
#
# summarise() function: instead a summary of benchmarks + timings
#
# Don't execute begin() and run() functions as they come; instead save them
# into .autobenchR_env and evaluate them after end() is called. This would
# allow for summary type functions, knowing the total number of benchmarks, etc.
