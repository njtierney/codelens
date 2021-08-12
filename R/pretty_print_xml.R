#' @title Nicely print out xml of R script
#' @description Handy for inspecting full XML path of an R script
#' @param path file path
#' @return XML printed nicely
#' @examples
#' \dontrun{
#' if(interactive()){
#' pretty_print_xml("inst/test-fun.R")
#'  }
#' }
#' @export
pretty_print_xml <- function(path){
  parse(file = path,
        keep.source = TRUE) %>%
    xmlparsedata::xml_parse_data(pretty = TRUE) %>%
    cat()
}
