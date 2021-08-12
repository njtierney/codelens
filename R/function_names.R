#' Extract function names from a provided path
#'
#' @param path file path
#'
#' @return character vector of function names
#' @export
function_names <- function(path){
  names(extract_functions(path))
}
