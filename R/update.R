#' Change autobench settings during a run.
#'
#' @param permanent Whether to only change the settings of the next immediate
#'    set of benchmarks, or all following benchmarks.
#'
#' @return NULL, invisibly.
#'
#' @inheritParams begin
#' @author Benjamin Jean-Marie Tremblay
#' @export
update <- function(max.reps = NULL, min.time = NULL, unit = NULL,
                   check = NULL, min.reps = NULL,
                   tool = NULL, stop.on.fail = NULL, permanent = FALSE) {

  missing.settings <- paste0("Could not find benchmark settings, make sure to",
                             " call autobench::begin() first")

  updated.settings <- tryCatch(get(".autobench_updated", envir = baseenv()),
                               error = function(e) stop(missing.settings))

  if (!is.null(max.reps)) updated.settings$max.reps <- max.reps
  if (!is.null(min.reps)) updated.settings$min.reps <- min.reps
  if (!is.null(min.time)) updated.settings$min.time <- min.time
  if (!is.null(unit)) updated.settings$unit <- unit
  if (!is.null(tool)) updated.settings$tool <- tool
  if (!is.null(check)) updated.settings$check <- check
  if (!is.null(stop.on.fail)) updated.settings$stop.on.fail <- stop.on.fail

  updated.settings$permanent <- permanent

  assign(".autobench_updated", updated.settings, envir = baseenv())

  invisible(NULL)

}
