library(cde)
context("search_sites")

test_that("dimensions of search_site dataframe are as expected", {
  # search for sites containing "Avon" in their name
  test_search_avon<-search_sites("Avon", "name")
  # check that the dimensions are 516 rows, 17 cols
  expect_true(all(dim(test_search_avon)== c(103, 6)))
  
})

test_that("invalid site name returns an error", {
  # search for sites containing "Aardvark"
  expect_error(search_sites("Aardvark", "name"))
})

test_that("invalid column choice returns an error", {
  # search for "Avon in column "Aardvark"
  expect_error(search_sites("Avon", "Aardvark"))
})