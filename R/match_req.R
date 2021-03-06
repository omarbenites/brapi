# intended for required scalar characters like required dbIds
match_req <- function(...) {
  args <- list(...)
  non_empty <- function(s) {nchar(s) > 0}
  if (!lapply(args, non_empty) %>% unlist %>% all()) {
    stop("All parameters must have at least a length of one.")
  }
  args[[1]][1]
}
