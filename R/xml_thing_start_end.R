xml_thing_start_end <- function(xml, thing){

  # extract_function_lines <-
  fun_line1 <- thing(xml) %>% xml_line1()
  fun_line2 <- thing(xml) %>% xml_line2()

  tibble::tibble(start = fun_line1,
                 end = fun_line2)
}
