write_functions <- function(extracted_functions, path = NULL){
  file_names <- names(extracted_functions)
  file_paths <- glue::glue('{path}{file_names}.R')
  purrr::walk2(
    .x = extracted_functions,
    .y = file_paths,
    .f = readr::write_lines
  )
}
