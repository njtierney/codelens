xml_function_start_end <- function(xml){

  # extract_function_lines <-
  fun_line1 <- xml_function(xml) %>% xml_line1()
  fun_line2 <- xml_function(xml) %>% xml_line2()

  tibble::tibble(start = fun_line1,
                 end = fun_line2)
}
