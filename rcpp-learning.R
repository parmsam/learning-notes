# Load libraries
library(Rcpp)
library(microbenchmark)

# Define the function sum_loop
sum_loop <- function(x) {
  result <- 0
  for(i in x){result = i + result}
  result
}

# Check for equality 
all.equal(sum_loop(x), sum(x))

# Compare the performance
microbenchmark(sum_loop = sum_loop(x), R_sum = sum(x))

# Evaluate Rcpp 
evalCpp("40+2")
evalCpp("17/2")

# Casting 
evalCpp("(double)17/2")
evalCpp("(int)7.25")
evalCpp("(int)7.95")

#assignment 
x <- evalCpp('2+2')

# Evaluate 2 + 2 in R
y <- 2+2

# Storage modes of x and y
storage.mode(x)
storage.mode(y)
