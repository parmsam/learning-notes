# load libraries ----
library(Rcpp)
library(microbenchmark)

# define the function sum_loop ----
sum_loop <- function(x) {
  result <- 0
  for(i in x){result = i + result}
  result
}

# check for equality ----
all.equal(sum_loop(x), sum(x))

# compare the performance ----
microbenchmark(sum_loop = sum_loop(x), R_sum = sum(x))

# evaluate Rcpp ----
evalCpp("40+2")
evalCpp("17/2")

# casting ----
evalCpp("(double)17/2")
evalCpp("(int)7.25")
evalCpp("(int)7.95")

# assignment  ----
x <- evalCpp('2+2')
y <- 2+2

# storage modes ----
storage.mode(x)
storage.mode(y)

#declare functions ----
cppFunction("
  int fun(){
    int x= 37;
    return x;
  }
")
fun()

cppFunction('
double add(double x, double y){
  double z = x + y;
  return z;
}')
add(2,3)

cppFunction('
double subtract(double x, double y){
  Rprintf("some message here\\n");
  return x - y;
}')
subtract(2.5,3)
