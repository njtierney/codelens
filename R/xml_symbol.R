xml_symbol <- function(xml){
  xp_symbol <- paste0(
    "//expr",
    "[SYMBOL]"
  )
  xml2::xml_find_all(xml, xp_symbol)
}
