library(xmlparsedata)
library(xml2)
library(readr)
library(tibble)

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
