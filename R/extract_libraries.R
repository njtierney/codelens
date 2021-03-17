# extract_libraries

# is it possible to parse the data/files so we can understand the order it runs?
library(vctrs)
library(readr)
library(tibble)
library(tidyr)
library(fs)
library(purrr)
library(dplyr)
library(Rclean)

script_libs <- function(path){

  q_dep <- purrr::quietly(renv::dependencies)
  libs <- q_dep(path = path)
  print(libs)

  tibble(
    path = path,
    library = list(libs$result$Package)
  )
}

script_libs("R/functions.R")
script_libs("R/counterfactuals.R")

script_libs_df <- function(path){
  map_dfr(path, script_libs)
}

script_libs_df(dir_ls(path = "R/"))


