#' @title Return functions used and which line in a given file
#' @param path file path
#' @return data frame of start line, function name, and path
#' @examples
#' \dontrun{
#' function_used("inst/test-fun.R")
#' }
#' @export
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
