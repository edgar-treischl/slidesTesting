# That Arrange → Act → Assert structure is particularly useful to teach early. 
# It gives your data scientists a mental model for writing tests rather than 
# just giving them a list of expect_* functions

test_that("what am I testing?", {
  
  # Arrange
  input <- ...
  
  # Act
  result <- my_function(input)
  
  # Assert
  expect_equal(result, ...)
  
})



# ============================================================
# Introduction to testthat
# ============================================================

library(testthat)


# ------------------------------------------------------------
# 1. expect_equal()
# ------------------------------------------------------------
# Checks whether two values are equal.

test_that("expect_equal checks equality", {
  
  expect_equal(2 + 2, 4)
  
  expect_equal(
    c("apple", "banana"),
    c("apple", "banana")
  )
  
})


# ------------------------------------------------------------
# 2. expect_identical()
# ------------------------------------------------------------
# Similar to expect_equal(), but stricter.
# It checks that objects are exactly identical.

test_that("expect_identical checks exact identity", {
  
  expect_identical(
    c(1, 2, 3),
    c(1, 2, 3)
  )
  
})


# ------------------------------------------------------------
# 3. expect_true()
# ------------------------------------------------------------
# Checks that an expression evaluates to TRUE.

test_that("expect_true checks for TRUE", {
  
  x <- 10
  
  expect_true(x > 0)
  expect_true(x == 10)
  
})


# ------------------------------------------------------------
# 4. expect_false()
# ------------------------------------------------------------
# Checks that an expression evaluates to FALSE.

test_that("expect_false checks for FALSE", {
  
  x <- 10
  
  expect_false(x < 0)
  expect_false(x == 20)
  
})


# ------------------------------------------------------------
# 5. expect_null()
# ------------------------------------------------------------
# Checks that the result is NULL.

test_that("expect_null checks for NULL", {
  
  result <- NULL
  
  expect_null(result)
  
})


# ------------------------------------------------------------
# 6. expect_length()
# ------------------------------------------------------------
# Checks the length of an object.

test_that("expect_length checks length", {
  
  x <- c(10, 20, 30)
  
  expect_length(x, 3)
  
})


# ------------------------------------------------------------
# 7. expect_type()
# ------------------------------------------------------------
# Checks the underlying R type.

test_that("expect_type checks the type", {
  
  x <- c(1, 2, 3)
  
  expect_type(x, "double")
  
})


# ------------------------------------------------------------
# 8. expect_class()
# ------------------------------------------------------------
# Checks the class of an object.


test_that("expect_s3_class checks the class", {
  
  x <- factor(c("A", "B", "A"))
  
  expect_s3_class(x, "factor")
  
})



# ------------------------------------------------------------
# 9. expect_named()
# ------------------------------------------------------------
# Checks that an object has the expected names.

test_that("expect_named checks names", {
  
  x <- c(
    name = "Alice",
    age = "30"
  )
  
  expect_named(
    x,
    c("name", "age")
  )
  
})


# ------------------------------------------------------------
# 10. expect_error()
# ------------------------------------------------------------
# Checks that code produces an error.

divide <- function(x, y) {
  if (y == 0) {
    stop("Cannot divide by zero")
  }
  
  x / y
}


test_that("expect_error checks errors", {
  
  expect_error(
    divide(10, 0)
  )
  
})


# ------------------------------------------------------------
# 11. expect_warning()
# ------------------------------------------------------------
# Checks that code produces a warning.

calculate <- function(x) {
  
  if (x < 0) {
    warning("Negative value")
  }
  
  x^2
}


test_that("expect_warning checks warnings", {
  
  expect_warning(
    calculate(-5)
  )
  
})


# ------------------------------------------------------------
# 12. expect_message()
# ------------------------------------------------------------
# Checks that code produces a message.

say_hello <- function(name) {
  
  message("Hello ", name)
  
}


test_that("expect_message checks messages", {
  
  expect_message(
    say_hello("Alice")
  )
  
})


# ============================================================
# The basic idea
# ============================================================

# A test generally looks like this:
#
# test_that("description of what should work", {
#
#   expect_something(
#     actual_result,
#     expected_result
#   )
#
# })




# Example:

add <- function(x, y) {
  x + y
}

test_that("add adds two numbers", {
  
  result <- add(2, 3)
  
  expect_equal(result, 5)
  
})
