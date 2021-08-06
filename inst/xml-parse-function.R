library(xmlparsedata)

p <- parse(text = readLines("inst/test-fun.R"), keep.source = TRUE)

library(xml2)

xml <- read_xml(xml_parse_data(p, pretty = TRUE))

xml_function <- function(xml){
  xp_fun <- paste0(
    "//expr",
    "[FUNCTION]"
  )
  xml_find_all(xml, xp_fun)
}

xml_line1 <- function(xml){
  readr::parse_number(xml %>% xml_attr("line1"))
}

xml_line2 <- function(xml){
  readr::parse_number(xml %>% xml_attr("line2"))
}

# extract_function_lines <-
fun_line1 <- xml_function(xml) %>% xml_line1()
fun_line2 <- xml_function(xml) %>% xml_line2()

tibble::tibble(start = fun_line1,
               end = fun_line2) %>%
  tibble::rowid_to_column(var = "fun")

xml_function_start_end <- function(path){

  xml <- read_xml(xml_parse_data(p, pretty = TRUE))

  # extract_function_lines <-
  fun_line1 <- xml_function(xml) %>% xml_line1()
  fun_line2 <- xml_function(xml) %>% xml_line2()

  tibble::tibble(start = fun_line1,
                 end = fun_line2) %>%
    tibble::rowid_to_column(var = "fun")

}

fun_start_end_pos <- xml_function_start_end("inst/test-fun.R")

fun_start_end_pos

test_fun_code <- readLines("inst/test-fun.R")

t(fun_start_end_pos)[,1][-1]

test_fun_code[fun_start_end_pos$start[1]:fun_start_end_pos$end[1]]
test_fun_code[fun_start_end_pos$start[2]:fun_start_end_pos$end[2]]

"//expr",
"line1",
"\\expr",
"line2"
