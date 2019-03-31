#' Initialise an autobench run.
#'
#' Generates the settings used by instances of [autobench::run()]. This
#' function must be called before any other, and again after [autobench::end()]
#' is called in order to run further benchmarks.
#'
#' @param file Print results to this file. The default (`file = stdout()`)
#'    prints results to the terminal.
#' @param name Name of \pkg{autobench} session.
#' @param quiet Suppress run status. By default, is set to `TRUE` if `file` is a
#'    terminal connection and `FALSE` otherwise.
#' @param tool Benchmarking package used by autobench. One of "bench",
#'    "microbenchmark", and "rbenchmark".
#' @param min.reps Only applies if `tool = "bench"`. Minimum number of times to
#'    run each expression.
#' @param max.reps If `tool = "bench"`, the maximum number of times to run each
#'    expression. If `tool = "microbenchmark"` or `tool = "rbenchmark"`, the
#'    exact number of times to run each expression.
#' @param min.time Only applies if `tool = "bench"`. Minimum time in seconds to
#'    each expression (unless expression has already been run `max.reps` times).
#' @param check Make sure all expressions in a run return equal values. Only
#'    valid if `tool = "bench"` or `tool = "microbenchmark"`.
#' @param unit Only applies if `tool = "microbenchmark"` or `tool = "rbenchmark"`.
#'    Units to show in benchmarking results tables.
#'    See [microbenchmark::microbenchmark()] for acceptable units when
#'    `tool = "microbenchmark"`. When `tool = "rbenchmark"`, acceptable units are
#'    "ns" (nanoseconds), "us" (microseconds), "ms" (milliseconds),
#'    "s" (seconds), and "min" (minutes). The default, `unit = "t"`, when
#'    run with `tool = "microbenchmark"` will automatically pick a unit; and
#'    when run with tool = "rbenchmark", seconds are used.
#' @param stop.on.fail Whether to give an error if one of the expressions gives
#'    an error, or continue.
#' @param format Format of output results. One of "txt" (text) and "md" (markdown).
#'    Defaults to "txt" if `file` is a terminal connection.
#' @param session.info Print session info after [autobench::end()] is
#'    called. By default will only be set to `TRUE` if `file` is not a
#'    terminal connection.
#'
#' @return `NULL`, invisibly.
#'
#' @author Benjamin Jean-Marie Tremblay
#' @export
begin <- function(file = stdout(), name = NULL,
                  quiet = ifelse(isatty(file), TRUE, FALSE),
                  tool = "rbenchmark", min.reps = 1, max.reps = 100,
                  min.time = 0.5, check = FALSE, unit = "t",
                  stop.on.fail = FALSE,
                  format = ifelse(isatty(file), "txt", "md"),
                  session.info = ifelse(isatty(file), FALSE, TRUE)) {

  tool <- match.arg(tool, c("bench", "microbenchmark", "rbenchmark"))
  format <- match.arg(format, c("txt", "md"))

  autobench.settings <- list(file = file, quiet = quiet, counter = 0,
                             max.reps = max.reps, unit = unit, format = format,
                             check = check, tool = tool, min.reps = min.reps,
                             stop.on.fail = stop.on.fail, min.time = min.time,
                             session.info = session.info, invalid = FALSE)

  assign(".autobench_info", autobench.settings, envir = baseenv())

  updated.settings <- list(max.reps = NULL, min.time = NULL,
                           unit = NULL, stop.on.fail = NULL, check = NULL,
                           min.reps = NULL, permanent = TRUE)

  assign(".autobench_updated", updated.settings, envir = baseenv())

  assign(".autobench_skip", list(skip = FALSE), envir = baseenv())

  out <- c(paste0("autobench v", packageDescription("autobench")$Version),
           as.character(Sys.time()), "",
           paste0(ifelse(format == "md", "## ", ""), "Initial benchmark settings"),
           paste("  * tool:", tool),
           paste("  * max.reps:", max.reps),
           paste("  * min.reps:", min.reps),
           paste("  * min.time:", min.time, "seconds"),
           paste("  * check:", check),
           paste("  * stop.on.fail:", stop.on.fail))

  if (!is.null(name)) {
    if (format == "md") {
      name <- paste("#", name)
      out[1] <- paste0("\n", out[1])
      out[2] <- paste0("\n", out[2])
    }
    out <- c(name, out)
  } else {
    if (format == "md") {
      out[1] <- paste("#", out[1])
      out[2] <- paste0("\n", out[2])
    }
  }

  cat(out, sep = "\n", file = file)

  if (!quiet) cat("Starting benchmarks")

  tic()
  invisible(NULL)

}
