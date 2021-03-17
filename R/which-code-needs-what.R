library(readr)
library(stringr)
library(stringi)
library(purrr)

file_sources <- function(file){
  cf <- read_lines(file)
  
  cf_no_source <- cf[str_detect(cf, "source\\(")] %>% 
    str_remove_all("source\\(|\\)") %>% 
    str_remove_all('\"')
  
  tibble::tibble(
    this_file = str_remove(file, '/'),
    needs = cf_no_source
  )
  
}

r_source_files <- list.files(path = "R/", 
                             full.names = TRUE,
                             pattern = ".R$")

r_source_files

which_code_needs_what <- map_dfr(r_source_files, file_sources)
which_code_needs_what
