#' Initialise an autobench run.
#'
#' @param file Results file.
#' @param name Name of autobench run.
#' @param quiet Suppress run status.
#' @param tool Benchmarking package used by autobench. One of "bench",
#'    "microbenchmark", and "rbenchmark".
#' @param min.reps Only applies if tool = "bench". Minimum number of times to
#'    run each expression.
#' @param max.reps If tool = "bench", the maximum number of times to run each
#'    expression. If tool = "microbenchmark" or tool = "rbenchmark", the
#'    exact number of times to run each expression.
#' @param min.time Only applies if tool = "bench". Minimum time in seconds to
#'    each expression (unless expression has already been run max.reps times).
#' @param check Make sure all expressions in a run return equal values.
#' @param unit Only applies if tool = "microbenchmark" or tool = "rbenchmark".
#'    Units to show in benchmarking results tables.
#'    See [microbenchmark::microbenchmark()] for acceptable units when
#'    tool = "microbenchmark". When tool = "rbenchmark", acceptable units are
#'    "ns" (nanoseconds), "us" (microseconds), "ms" (milliseconds),
#'    "s" (seconds), and "min" (minutes). The default, unit = "t", when
#'    run with tool = "microbenchmark" will automatically pick a unit; and
#'    when run with tool = "rbenchmark", seconds are used.
#' @param stop.on.fail Whether to give an error if one of the expressions gives
#'    an error.
#'
#' @return NULL
#'
#' @author Benjamin Jean-Marie Tremblay
#' @export
begin <- function(file, name, quiet = FALSE, tool = "rbenchmark", min.reps = 1,
                  max.reps = 100, min.time = 0.5, check = FALSE,
                  unit = "t", stop.on.fail = FALSE) {

  if (missing(file)) stop("Please provide a name for the results file")

  autobench.settings <- list(file = file, quiet = quiet, counter = 0,
                             max.reps = max.reps, unit = unit,
                             check = check, tool = tool, min.reps = min.reps,
                             stop.on.fail = stop.on.fail, min.time = min.time)

  assign(".autobench_info", autobench.settings, envir = baseenv())

  updated.settings <- list(max.reps = NULL, min.time = NULL,
                           unit = NULL, stop.on.fail = NULL, check = NULL,
                           min.reps = NULL, permanent = TRUE)

  assign(".autobench_updated", updated.settings, envir = baseenv())

  assign(".autobench_skip", list(skip = FALSE), envir = baseenv())

  out <- c(paste0("autobench v", packageDescription("autobench")$Version),
           as.character(Sys.time()), "",
           "Initial benchmark settings",
           paste("  * max.reps:", max.reps),
           paste("  * min.reps:", min.reps),
           paste("  * min.time:", min.time, "seconds"),
           paste("  * check:", check),
           paste("  * tool:", tool),
           paste("  * stop.on.fail:", stop.on.fail))

  if (!missing(name)) out <- c(name, out)

  cat(out, sep = "\n", file = file)

  if (!quiet) cat("Starting benchmarks")

  tic()
  invisible(NULL)

}
