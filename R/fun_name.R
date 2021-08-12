fun_name <- function(fun_text){
  xml <- parse_as_xml(fun_text)
  substr(fun_text[1], sym_start(xml), sym_end(xml))
}
