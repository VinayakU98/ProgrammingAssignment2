
## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
# Set the working directory to a specific path
setwd('C:/Users/rubind1/Documents/Coursera-R')

# Define a function that creates a cached matrix and allows for caching the inverse
makeCacheMatrix <- function(x = matrix(sample(1:100, 9), 3, 3)) {
  s <- NULL  # Initialize the inverse matrix as null
  set <- function(y) {  # Define a function to set the matrix 'x'
    x <<- y
    s <<- NULL  # Invalidate the cached inverse when 'x' changes
  }
  get <- function() x  # Define a function to get the matrix 'x'
  setsolve <- function(solve) s <<- solve  # Define a function to set the cached inverse
  getsolve <- function() s  # Define a function to get the cached inverse
  list(
    set = set,
    get = get,
    setsolve = setsolve,
    getsolve = getsolve
  )
}

# Define a function that calculates and caches the inverse of a matrix
cacheSolve <- function(x, ...) {
  s <- x$getsolve()  # Attempt to retrieve the cached inverse
  if (!is.null(s)) {
    message("Getting the cached inverse matrix")  # Display a message indicating that the cached inverse is used
    return(s)
  }
  data <- x$get()  # Get the matrix 'x'
  s <- solve(data, ...)  # Calculate the inverse of 'data'
  x$setsolve(s)  # Cache the calculated inverse
  s
}
