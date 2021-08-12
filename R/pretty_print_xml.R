pretty_print_xml <- function(path){
  parse(file = path,
        keep.source = TRUE) %>%
    xmlparsedata::xml_parse_data(pretty = TRUE) %>%
    cat()
}
