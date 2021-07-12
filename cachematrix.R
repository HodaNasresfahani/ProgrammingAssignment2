getwd()
[1] "C:/Users/hodan/OneDrive/Documents/jj"

setwd("C:/Users/hodan/OneDrive/Desktop/Coursera/specdata")
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
> source("MakeCacheMatrix.R")
pmatrix <- makeCacheMatrix(matrix(1:16, nrow = 4, ncol = 4))

pmatrix$get()
     [,1] [,2] [,3] [,4]
[1,]    1    5    9   13
[2,]    2    6   10   14
[3,]    3    7   11   15
[4,]    4    8   12   16

pmatrix$getInverse
NULL
cacheSolve(pmatrix)
[,1] [,2]
[1,] -2 1.5
[2,] 1 -0.5
cacheSolve(pmatrix)
getting cached data
[,1] [,2]
[1,] -2 1.5
[2,] 1 -0.5
pmatrix$getInverse()
[,1] [,2]
[1,] -2 1.5
[2,] 1 -0.5
