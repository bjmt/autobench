#' Change autobench settings during a run.
#'
#' Changes the benchmark settings partway through an \pkg{autobench} session.
#'
#' @param permanent Whether to only change the settings of the next immediate
#'    set of benchmarks, or all following benchmarks. Note that only one set
#'    of updated settings are stored, so calling [autobench::update()] again
#'    will overwrite these.
#'
#' @return `NULL`, invisibly.
#'
#' @inheritParams begin
#' @author Benjamin Jean-Marie Tremblay
#' @export
update <- function(max.reps = NULL, min.time = NULL, unit = NULL,
                   check = NULL, min.reps = NULL,
                   tool = NULL, stop.on.fail = NULL, permanent = FALSE) {

  # NOTE: When permanent = TRUE, should updated settings be moved to
  #       run.settings?

  if (!is.null(tool))
    tool <- match.arg(tool, c("bench", "microbenchmark", "rbenchmark"))

  missing.settings <- paste0("Could not find benchmark settings, make sure to",
                             " call autobench::begin() first")

  if (.autobench_env$begin$invalid) stop(missing.settings)

  updated.settings <- .autobench_env$update

  if (!is.null(max.reps)) updated.settings$max.reps <- max.reps
  if (!is.null(min.reps)) updated.settings$min.reps <- min.reps
  if (!is.null(min.time)) updated.settings$min.time <- min.time
  if (!is.null(unit)) updated.settings$unit <- unit
  if (!is.null(tool)) updated.settings$tool <- tool
  if (!is.null(check)) updated.settings$check <- check
  if (!is.null(stop.on.fail)) updated.settings$stop.on.fail <- stop.on.fail

  updated.settings$permanent <- permanent

  .autobench_env$update <- updated.settings

  invisible(NULL)

}
