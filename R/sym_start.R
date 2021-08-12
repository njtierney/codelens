#' Get where symbol ends in the data
#'
#' @param xml xml parse data
#'
#' @return symbol start position
#' @note internal
sym_start <- function(xml){
  xml_symbol(xml) %>%
    xml2::xml_attr("col1") %>%
    readr::parse_number()
}
