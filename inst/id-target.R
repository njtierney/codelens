# using saveRDS
library(readr)
library(stringr)

sc <- readr::read_lines("R/counterfactuals.R")
sc_saveRDS <- str_subset(sc, "saveRDS")

sc_saveRDS %>% str_extract("\\((.*?)\\,") %>% str_remove_all("\\(|\\,")

str_subset(sc, "write_rds")
str_subset(sc, "ggsave")
str_subset(sc, "write_")
str_subset(sc, "write")
str_subset(sc, "save")
