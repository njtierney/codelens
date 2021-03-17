# is it possible to parse the data/files so we can understand the order it runs?
library(vctrs)
library(readr)
library(tibble)
library(fs)
library(purrr)
library(dplyr)

n_lines <- function(path){
  
  n_line <- vec_size(read_lines(path))
  
  tibble(
    path = path,
    n_lines = n_line
  )
}

n_lines_df <- function(path){
  map_dfr(path, n_lines) %>% 
    
}

n_lines("R/functions.R")

files <- list.files(path = "R/",
                    full.names = TRUE)

n_lines_df(dir_ls(path = "R/"))
