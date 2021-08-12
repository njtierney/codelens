parse_as_xml <- function(text){
  parse(text = text, keep.source = TRUE) %>%
    xmlparsedata::xml_parse_data(pretty = TRUE)  %>%
    xml2::read_xml()
}
