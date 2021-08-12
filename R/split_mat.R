#' Split a matrix into lists
#'
#' @param x matrix
#'
#' @return list of different matrices
#' @note interal
split_mat <- function(x){
  split(x, rep(1:ncol(x), each = nrow(x)))
}
