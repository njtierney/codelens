xml_function <- function(xml){
  xp_fun <- paste0(
    "//expr",
    "[FUNCTION]"
  )
  xml2::xml_find_all(xml, xp_fun)
}
