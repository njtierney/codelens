sym_start <- function(xml){
  xml_symbol(xml) %>% xml2::xml_attr("col1") %>% readr::parse_number()
}
