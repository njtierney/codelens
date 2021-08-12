xml_line2 <- function(xml){
  xml %>% xml2::xml_attr("line2") %>% readr::parse_number()
}
