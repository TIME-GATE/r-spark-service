library('lpSolveAPI', character.only=TRUE)

lprec <- make.lp(0, 6)
set.objfn(lprec, c(2, 3, 3.24, 0.5, 1.2, 2))

add.constraint(lprec, c(0.1, 7.26, 0.2, 2.9, 4.4, 3.3), ">=", 12.3)
add.constraint(lprec, c(0.24, 4.1, 0.4, 1.1, 11.31, 0.1), ">=", 140)
add.constraint(lprec, c(1.68, 0.1, 0.8, 4.1, 0.1, 0.9), "<=", 140)
add.constraint(lprec, c(0.68, 0.2, 0.1, 10.1, 5.9, 1.1), "<=", 150)

set.bounds(lprec, lower = c(2.6, 1), columns = c(1, 4))
set.bounds(lprec, upper = 44.8, columns = 3)

RowNames <- c("ROW_1", "ROW_2", "ROW_3","ROW_4")
ColNames <- c("COL_1", "COL_2", "COL_3", "COL_4","COL_5","COL_6")

dimnames(lprec) <- list(RowNames, ColNames)

solve(lprec)

get.objective(lprec)

get.variables(lprec)

get.constraints(lprec)

get.solutioncount(lprec)