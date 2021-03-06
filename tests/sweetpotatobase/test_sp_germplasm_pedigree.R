context("sp germplasm_pedigree")

con <- ba_db()$testserver

test_that("Germplasm_pedigree results are present", {

  skip("Implemented - but takes too long: more than 25sec!")

  res <- ba_germplasm_pedigree(con = con, germplasmDbId = "103412")
  expect_that(nrow(res) == 1, is_true())
  expect_that(ncol(res) >= 7, is_true())

})

test_that("out formats work", {

  skip("Implemented - but takes too long: more than 25sec!")

  res <- ba_germplasm_pedigree(con = con, germplasmDbId = "103412", rclass = "json")
  expect_that("json" %in% class(res), is_true())

  res <- ba_germplasm_pedigree(con = con, germplasmDbId = "103412", rclass = "list")
  expect_that("list" %in% class(res), is_true())

  res <- ba_germplasm_pedigree(con = con, germplasmDbId = "103412", rclass = "data.frame")
  expect_that("data.frame" %in% class(res), is_true())

})

