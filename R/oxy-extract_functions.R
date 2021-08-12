#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param path PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[purrr]{map}}
#'  \code{\link[vctrs]{vec_slice}}
#' @rdname extract_functions
#' @export 
#' @importFrom purrr map
#' @importFrom vctrs vec_slice
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
