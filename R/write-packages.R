#' Writes a packages.R file based on dependencies
#'
#' @param dir directory to search through. Default is "R/"
#' @param file file to write to - default is "packages.R"
#'
#' @return nothing, it writes a file
#' @export
#'
#' @examples
#' \dontrun{
#' write_packages()
#' }
write_packages <- function(dir = "R/",
                           file = "packages.R"){

  deps <- script_libs(fs::dir_ls(dir))
  unique_libs <- sort(unique(unlist(deps$library)))
  unique_libs

  libs_to_write <- c(
    glue::glue("library({unique_libs})"),
    "library(conflicted)"
    )

  readr::write_lines(x = libs_to_write,
                     file = file)
  cli::cli_li("R packages found from {dir}, and written to {file}")
}
