#' Parse an R file as parse data in XML
#'
#' @param file path
#'
#' @return xml
#' @export
parse_as_xml <- function(path){
  parse(text = path, keep.source = TRUE) %>%
    xmlparsedata::xml_parse_data(pretty = TRUE)  %>%
    xml2::read_xml()
}
