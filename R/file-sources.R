#' Which files call "source"?
#'
#' @param file file path
#'
#' @return dataframe of which files use source
#' @export
#'
#' @examples
#' \dontrun{
#' library(purrr)
#' r_source_files <- list.files(path = "R/",
#'                              full.names = TRUE,
#'                              pattern = ".R$")
#'
#' r_source_files
#'
#' which_code_needs_what <- map_dfr(r_source_files, file_sources)
#' which_code_needs_what
#' }
file_sources <- function(file){
  cf <- readr::read_lines(file)

  cf_no_source <- cf[stringr::str_detect(cf, "source\\(")] %>%
    stringr::str_remove_all("source\\(|\\)") %>%
    stringr::str_remove_all('\"')

  tibble::tibble(
    this_file = stringr::str_remove(file, '/'),
    needs = cf_no_source
  )

}
