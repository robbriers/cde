library(cde)
context("testing plotting")

test_that("plotting WBID data results in error", {
  # retrieve data for column "Aardvark"
  testframe<-get_rnag("GB112071065700", "WBID")
  expect_error(plot(testframe))
})

 test_that("invalid scheme returns an error", {
   # specify scheme as "Aardvark"
   expect_error(plot(get_status("Avon Warwickshire", "MC"),scheme="Aardvark"))
 })
 
 test_that("plotting status returns a vector of given length", {
   # plot for Avon Warwickshire MC chemical status
   testframe<-get_status("Avon Warwickshire", "MC", level="Chemical")
   # check that the vector has a length of 8
   expect_true(length(plot(testframe))== 8)
 })

 test_that("plotting objectives returns a vector of given length", {
   # plot for Avon Warwickshire MC chemical status
   testframe<-get_objectives("Avon Warwickshire", "MC", level="Chemical")
   # check that the vector has a length of 8
   expect_true(length(plot(testframe))== 3)
 })
 
 test_that("plotting rnag returns a list", {
   # plot for Avon Warwickshire MC chemical status
   testframe<-get_rnag("Avon Warwickshire", "MC")
   # check that the vector has a length of 8
   expect_true(is.list(plot(testframe)))
 })
 
 test_that("plotting pa returns a list", {
   # plot for Avon Warwickshire MC chemical status
   testframe<-get_pa("Thames", "RBD")
   # check that the vector has a length of 8
   expect_true(is.list(plot(testframe)))
 })
 
 test_that("printing returns a null", {
   # plot for Avon Warwickshire MC chemical status
   testframe<-get_pa("Thames", "RBD")
   # check that the vector has a length of 8
   expect_true(is.null(print(testframe)))
 })
 