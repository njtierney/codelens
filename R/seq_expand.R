#' Expand a vector to go from first to the second vector
#'
#' @param vec vector of length two
#'
#' @return sequence
#' @note internal
seq_expand <- function(vec){
  seq(vec[1],  vec[2])
}
