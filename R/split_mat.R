split_mat <- function(x){
  split(x, rep(1:ncol(x), each = nrow(x)))
}
