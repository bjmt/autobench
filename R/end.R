#' Terminate an autobench run.
#'
#' Calling [autobench::end()] will terminate an \pkg{autobench} session by
#' printing total runtime and session info (if `session.info = TRUE`). Note that
#' [autobench::begin()] must be called again in order to execute further
#' benchmarks.
#'
#' @return `TRUE`, invisibly.
#'
#' @author Benjamin Jean-Marie Tremblay
#' @export
end <- function() {

  total.toc <- toc(quiet = TRUE)
  cat.toc <- total.toc$toc - total.toc$tic
  if (cat.toc > 60) {
    cat.toc <- round(cat.toc / 60, 2)
    cat.toc <- paste0(cat.toc, " minutes")
  } else {
    cat.toc <- paste0(round(cat.toc, 1), " seconds")
  }
  total.toc <- paste("Total runtime:", cat.toc)

  missing.settings <- paste0("Could not find benchmark settings, make sure to",
                             " call autobench::begin()")
  run.settings <- tryCatch(get(".autobench_info", envir = baseenv()),
                           error = function(e) stop(missing.settings))
  if (run.settings$invalid) stop(missing.settings)
  v <- !run.settings$quiet
  out.format <- run.settings$format
  if (v) {
    cat("\nAll benchmarks completed.", total.toc, sep = "\n")
  }

  run.settings$invalid <- TRUE
  assign(".autobench_info", run.settings, envir = baseenv())

  if (run.settings$session.info) {
    old.width <- getOption("width")
    options(width = 100)
    sess.info <- c("", as.character(session_info()))
    options(width = old.width)
    if (out.format == "md") sess.info <- c("", "```", sess.info[-1], "```")
  } else {
    sess.info <- ""
  }

  if (out.format == "md") {
    total.toc <- paste0("* ", total.toc)
    msg <- "## All benchmarks complete"
  } else {
    msg <- ">>> All benchmarks complete."
  }

  cat("", msg, "", total.toc,
      sess.info, sep = "\n", file = run.settings$file, append = TRUE)

  invisible(TRUE)

}
