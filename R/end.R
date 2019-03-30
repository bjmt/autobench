#' Terminate an autobench run.
#'
#' @return TRUE
#'
#' @author Benjamin Jean-Marie Tremblay
#' @export
end <- function() {

  total.toc <- toc(quiet = TRUE)
  total.toc <- round((total.toc$toc - total.toc$tic) / 60, 2)
  total.toc <- paste("Total runtime:", total.toc, "minutes")

  missing.settings <- paste0("Could not find benchmark settings, make sure to",
                             " call autobench::begin()")
  run.settings <- tryCatch(get(".autobench_info", envir = baseenv()),
                           error = function(e) stop(missing.settings))
  v <- !run.settings$quiet
  if (v) {
    cat("\nAll benchmarks completed.", total.toc, sep = "\n")
  }

  if (run.settings$session.info) {
    old.width <- getOption("width")
    options(width = 100)
    sess.info <- c("", as.character(session_info()))
    options(width = old.width)
  } else {
    sess.info <- ""
  }

  cat("", ">>> All benchmarks complete.", "", total.toc,
      sess.info, sep = "\n", file = run.settings$file, append = TRUE)

  invisible(TRUE)

}
