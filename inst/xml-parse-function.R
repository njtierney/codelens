library(xmlparsedata)
library(xml2)
library(readr)
library(tibble)

xml_function <- function(xml){
  xp_fun <- paste0(
    "//expr",
    "[FUNCTION]"
  )
  xml2::xml_find_all(xml, xp_fun)
}

xml_line1 <- function(xml){
  xml %>% xml2::xml_attr("line1") %>% readr::parse_number()
}

xml_line2 <- function(xml){
  xml %>% xml2::xml_attr("line2") %>% readr::parse_number()
}

parse_as_xml <- function(text){
  parse(text = text, keep.source = TRUE) %>%
    xmlparsedata::xml_parse_data(pretty = TRUE)  %>%
    xml2::read_xml()
}

xml_function_start_end <- function(xml){

  # extract_function_lines <-
  fun_line1 <- xml_function(xml) %>% xml_line1()
  fun_line2 <- xml_function(xml) %>% xml_line2()

  tibble::tibble(start = fun_line1,
                 end = fun_line2)
}

split_mat <- function(x){
  split(x, rep(1:ncol(x), each = nrow(x)))
}
seq_expand <- function(vec){
  seq(vec[1],  vec[2])
}

xml_symbol <- function(xml){
  xp_symbol <- paste0(
    "//expr",
    "[SYMBOL]"
  )
  xml2::xml_find_all(xml, xp_symbol)
}

sym_start <- function(xml){
  xml_symbol(xml) %>% xml2::xml_attr("col1") %>% readr::parse_number()
}

sym_end <- function(xml){
  xml_symbol(xml) %>% xml2::xml_attr("col2") %>% readr::parse_number()
}

fun_name <- function(fun_text){
  xml <- parse_as_xml(fun_text)
  substr(fun_text[1], sym_start(xml), sym_end(xml))
}

extract_functions <- function(path) {
  fun_code_text <- readLines(path)
  xml <- parse_as_xml(fun_code_text)
  fun_start_end_pos <- xml_function_start_end(xml)
  mat <- t(fun_start_end_pos)
  fun_pos <- unname(split_mat(mat))
  fun_pos_seq <- lapply(fun_pos, seq_expand)
  extracted_funs <- purrr::map(fun_pos_seq,
                               ~vctrs::vec_slice(x = fun_code_text, i = .x))
  fun_names <- purrr::map(extracted_funs, fun_name)
  names(extracted_funs) <- fun_names
  extracted_funs
}

write_functions <- function(extracted_functions, path = NULL){
  file_names <- names(extracted_functions)
  file_paths <- glue::glue('{path}{file_names}.R')
  purrr::walk2(
    .x = extracted_functions,
    .y = file_paths,
    .f = readr::write_lines
  )
}

function_names <- function(path) names(extract_functions(path))

pretty_print_xml <- function(path){
  parse(file = path,
        keep.source = TRUE) %>%
    xmlparsedata::xml_parse_data(pretty = TRUE) %>%
    cat()
}

xml_function_use <- function(xml){
  xp_function_use <- paste0(
    "//expr",
    "[SYMBOL_FUNCTION_CALL]"
  )
  xml2::xml_find_all(xml, xp_function_use)
}

xml_thing_start_end <- function(xml, thing){

  # extract_function_lines <-
  fun_line1 <- thing(xml) %>% xml_line1()
  fun_line2 <- thing(xml) %>% xml_line2()

  tibble::tibble(start = fun_line1,
                 end = fun_line2)
}

function_used <- function(path) {
  fun_code_text <- readLines(path)
  xml <- parse_as_xml(fun_code_text)
  fun_start_end_pos <- xml_thing_start_end(xml, xml_function_use)
  mat <- t(fun_start_end_pos)
  fun_pos <- unname(split_mat(mat))
  fun_pos_seq <- lapply(fun_pos, seq_expand)
  extracted_funs <- purrr::map_chr(fun_pos_seq,
                               ~vctrs::vec_slice(x = fun_code_text, i = .x))
  fun_start_end_pos %>%
    dplyr::mutate(fun = extracted_funs,
                  path = path) %>%
    dplyr::rename(start_line = start) %>%
    dplyr::select(-end)
}


extract_functions("inst/test-fun.R")
function_names("inst/test-fun.R")
function_used("inst/test-fun.R")

pretty_print_xml("inst/test-fun.R")

extract_functions("inst/test-fun.R") %>%
  write_functions(path = "R/")

# and now I can use this to ... write the functions out?!
extract_functions("inst/xml-parse-function.R")

extract_functions("inst/xml-parse-function.R") %>%
  write_functions(path = "R/")
# Need to test against nested functions
