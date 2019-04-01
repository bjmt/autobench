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

  .autobench_env$begin <- list(invalid = TRUE)

  .autobench_env$update <- list()

  .autobench_env$skip <- logical()

}
