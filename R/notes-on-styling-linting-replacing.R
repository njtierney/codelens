# customer linter / styler / replacer

# update saveRDS / writeRDS to `write_rds` and `read_rds`

# convert
# `[[`( 
# to
# pluck(

# identify other lines of code to replace / be aware of
# e.g., 
# apply - map
# mapply - map?
# ifelse - if_else
# cbind - bind_cols
# do.call - map / bind_rows
# paste0 - glue
# ggsave

# replace r/p/dnorm and friends with `dist_` functions
  # how to do multivariate normal?
  # can truncated functions be replaced with dist_?
# replace tryCatch with safely