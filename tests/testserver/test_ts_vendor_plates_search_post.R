context("ts vendor_plates_search_post")

con <- ba_db()$testserver

test_that("Vendor plates search are present", {

  res <- ba_vendor_plates_search_post(con = con)
  expect_that("list" %in% class(res), is_true())

  res <- ba_vendor_plates_search_post(con = con, rclass = "json")
  expect_that("json" %in% class(res), is_true())

})

