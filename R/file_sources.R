#' Find where `library()` is called
#'
#' @param file file path
#'
#' @return dataframe of places where "library()" is called
#' @export
file_library <- function(file){

  file_find_fun(file, "library")

}
