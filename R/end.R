#' Terminate an autobenchR run.
#'
#' Calling [autobenchR::end()] will terminate an \pkg{autobenchR} session by
#' printing total runtime and session info (if `session.info = TRUE`). Note that
#' [autobenchR::begin()] must be called again in order to execute further
#' benchmarks.
#'
#' @return `TRUE`, invisibly.
#'
#' @author Benjamin Jean-Marie Tremblay
#' @export
end <- function() {

  missing.settings <- paste0("Could not find benchmark settings, make sure to",
                             " call autobenchR::begin()")
  run.settings <- .autobenchR_env$begin
  if (run.settings$invalid) stop(missing.settings)

  total.toc <- toc(quiet = TRUE)
  if (is.null(total.toc)) stop("Could not find `toc` counter")
  cat.toc <- total.toc$toc - total.toc$tic
  if (cat.toc > 3600) {
    cat.toc <- round(cat.toc / 3600, 1)
    cat.toc <- paste0(cat.toc, " hours")
  } else if (cat.toc > 60) {
    cat.toc <- round(cat.toc / 60, 1)
    cat.toc <- paste0(cat.toc, " minutes")
  } else {
    cat.toc <- paste0(round(cat.toc, 1), " seconds")
  }
  total.toc <- paste("Total runtime:", cat.toc)

  v <- !run.settings$quiet
  out.format <- run.settings$format
  if (v) {
    cat("\nAll benchmarks completed.", total.toc, sep = "\n")
  }

  run.settings$invalid <- TRUE
  .autobenchR_env$begin <- run.settings

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
