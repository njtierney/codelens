sym_end <- function(xml){
  xml_symbol(xml) %>% xml2::xml_attr("col2") %>% readr::parse_number()
}
