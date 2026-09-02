calculate_age <- function(birth_year, 
                          current_year = 2026) {
  current_year - birth_year
}

calculate_age(birth_year = 1984)


library(testthat)


# Unit testing #######
test_that("calculate_age calculates age correctly", {
  expect_equal(calculate_age(2000, 2026), 26)
  expect_equal(calculate_age(1990, 2026), 36)
})

#Test weird/boundary cases too
test_that("calculate_age handles boundary cases", {
  expect_equal(calculate_age(2026, 2026), 0)
  expect_equal(calculate_age(2025, 2026), 1)
})

# And potentially invalid input:

test_that("calculate_age rejects invalid years", {
  expect_error(
    calculate_age("hello", 2026)
  )
})

# Data transformation testing

create_features <- function(df) {
  df |>
    dplyr::mutate(
      mpg_hp = mpg*hp
    )
}


test_that("create_features is calculated correctly", {
  
  input <- tibble::tibble(
    mpg = c(100, 200),
    hp = c(10, 10)
  )
  
  result <- create_features(input)
  
  expect_equal(
    result$mpg_hp,
    c(1000, 2000)
  )
})



create_features(mtcars)

# Test your assumptions about the data
test_that("mtcars data has required columns", {
  
  data <- mtcars
  
  expect_true("mpg" %in% names(data))
  expect_true("hp" %in% names(data))
})


# Data quality tests

test_that("hp is within valid range", {
  
  expect_true(
    all(mtcars$hp > 0 & mtcars$hp <= 335, na.rm = TRUE)
  )
})

# Testing machine-learning models/Model performance tests

run_pipeline <- function(variables) {
  result <- tibble::tibble(success = TRUE,
                           predictions = 1)
  
  result
}


#Smoke Test
test_that("pipeline can run successfully", {
  
  result <- run_pipeline()
  
  expect_true(result$success)
})


# Regression tests for the whole pipeline
test_that("pipeline does not introduce missing predictions", {
  
  result <- run_pipeline(test_data)
  
  expect_false(
    any(is.na(result$predictions))
  )
})



# snapshotting a ggplot 

library(testthat)
library(ggplot2)
library(vdiffr)

make_plot <- function() {
  ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point()
}


test_that("car plot looks correct", {
  expect_doppelganger(
    "car scatter plot",
    make_plot()
  )
})


  

