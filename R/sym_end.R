#' Get where symbol starts in the data
#'
#' @param xml xml parse data
#'
#' @return symbol end position
#' @note internal
sym_end <- function(xml){
  xml_symbol(xml) %>%
    xml2::xml_attr("col2") %>%
    readr::parse_number()
}
