#' Find which files call a given function
#'
#' @param file file path
#' @param fun function name like "source" or "library"
#'
#' @return dataframe where functions are called
#' @export
file_find_fun <- function(file, fun){

  cf <- readr::read_lines(file)

  cf_no_fun <- cf[stringr::str_detect(cf, paste0(fun, "\\("))] %>%
    stringr::str_remove_all(paste0(fun, "\\(","|","\\)")) %>%
    stringr::str_remove_all('\"')

  tibble::tibble(
    this_file = stringr::str_remove(file, '/'),
    needs = cf_no_fun
  )

}
