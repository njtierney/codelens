#' Extract function name from xml
#'
#' For use inside other functions
#'
#' @param fun_text list of extracted functions
#'
#' @return names of functions
#' @note internal
fun_name <- function(fun_text){
  xml <- parse_as_xml(fun_text)
  substr(fun_text[1], sym_start(xml), sym_end(xml))
}
