xml_function_use <- function(xml){
  xp_function_use <- paste0(
    "//expr",
    "[SYMBOL_FUNCTION_CALL]"
  )
  xml2::xml_find_all(xml, xp_function_use)
}
