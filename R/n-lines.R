#' The number of lines in code
#'
#' @param path path to file
#'
#' @return number of lines of code
#' @export
#' @name n_lines
#'
#' @examples
#' \dontrun{
#' n_lines("R/functions.R")
#' files <- list.files(path = "R/",
#'                     full.names = TRUE)
#' n_lines_df(dir_ls(path = "R/"))
#' }
n_lines <- function(path){
  n_line <- vctrs::vec_size(readr::read_lines(path))

  tibble::tibble(
    path = path,
    n_lines = n_line
  )
}

#' @export
#' @rdname n_lines
n_lines_df <- function(path){
  purrr::map_dfr(path, n_lines)
}
