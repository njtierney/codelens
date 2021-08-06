#' Use conflicted and set up a basic use of it
#'
#' @param file file to write to, default is "conflicts.R"
#'
#' @return nothing, it writes a file
#' @export
#'
#' @examples
#' \dontrun{
#' use_conflicted
#' }
use_conflicted <- function(file = "conflicts.R"){
  conflicted_lines <- c(
  'library(conflicted)',
  'conflict_prefer("filter", "dplyr")',
  'conflict_prefer("select", "dplyr")',
  'conflict_prefer("pluck", "purrr")',
  'conflict_prefer("map", "purrr")',
  'conflict_prefer("pull", "dplyr")'
  )
  readr::write_lines(
    x = conflicted_lines,
    file = file
  )

  cli::cli_li(
    c(
      "{file} created!",
      "Some common templates have been provided",
      "Use {.code conflict_prefer('pull', 'dplyr')} to ensure the {.fun pull}\\
      function is always from the {.pkg dplyr} package"
      )
  )
}
