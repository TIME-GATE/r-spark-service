library('Rglpk')

obj <- c(2, 3, 3.24, 0.5, 1.2, 2)

mat <- matrix(c(
      0.1, 0.24, 1.68, 0.68, 
      7.6, 4.1, 0.1, 0.2,
      0.2, 0.4, 0.8, 0.1,
      2.9, 1.1, 4.1, 10.1,
      4.4, 11.31, 0.1, 5.9,
      3.3, 0.1, 0.9, 1.1
    ), nrow = 4)

dir <- c("<=", "<=", "<=", "<=")

rhs <- c(12.3, 140, 140, 150)

bounds <- list(
  lower = list(ind = c(1L, 4L), val = c(1, 2.6)),
  upper = list(ind = c(3L), val = c(44.8))
)

types <- c("I", "I", "C", "C", "C", "C")

max <- TRUE

Rglpk_solve_LP(obj, mat, dir, rhs, bounds = bounds, types = types, max = max)