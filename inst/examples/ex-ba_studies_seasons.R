if (interactive()) {
  library(brapi)

  con <- ba_db()$testserver

  ba_studies_seasons(con)
}
