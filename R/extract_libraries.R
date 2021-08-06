#' Extract the libraries used in a set of scripts
#'
#' @param path path to file
#'
#' @return dataframe of libraries used
#' @name script_libs
#' @export
#'
#' @examples
#' \dontrun{
#' script_libs("R/functions.R")
#' script_libs("R/counterfactuals.R")
#' script_libs_df(dir_ls(path = "R/"))
#' }
script_libs <- function(path){

  q_dep <- purrr::quietly(renv::dependencies)
  libs <- q_dep(path = path)
  print(libs)

  tibble::tibble(
    path = path,
    library = list(libs$result$Package)
  )
}

#' @export
#' @rdname script_libs
script_libs_df <- function(path){
  purrr::map_dfr(path, script_libs)
}


