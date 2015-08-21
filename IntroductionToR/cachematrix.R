## Put comments here that give an overall description of what your
## functions do

## Overall Description:
## ---------------------------------------------------------------------
## makeCacheMatrix gets a matrix and returns a list of functions to
## get and set the matrix data as well as to get and set the inverse of
## that matrix.
## cacheSolve returns the inverse of a matrix, that was constructed by
## makeCacheMatrix (that is a list of the 4 functions returned 
## by makeCacheMatrix)
## overall pretty much the same as the mean example except calculating
## the inverse instead of the mean ;)


## makeCacheMatrix:
## ---------------------------------------------------------------------
## takes a matrix and returns a list that holds 4 functions:
## 1.) set: takes a new matrix as an argument and overrides the old matrix (and resets the inverse)
## 2.) get: returns the matrix currently associated with the list of functions
## 3.) setinv: sets the inverse of the currently held matrix
## 4.) getinv: returns the current inverse

makeCacheMatrix <- function(mat = matrix()) {
    matInv <- NULL
    set <- function(matNew) {
        mat <<- matNew
        matInv <<- NULL
    }
    get <- function() mat
    setinv <- function(matInvNew) matInv <<- matInvNew
    getinv <- function() matInv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## cacheSolve:
## ---------------------------------------------------------------------
## takes a matrix-object that has been created by makeCacheMatrix
## (that is actually a list of 4 functions) and checks whether or not
## an inverse has already been calculated for that matrix. If so, the 
## inverse is returned. Otherwise the inverse is calculated (using 
## solve), set in the matrix through setinv and then returned.

cacheSolve <- function(mat, ...) {
        ## Return a matrix that is the inverse of 'x'
    matI <- mat$getinv()
    if(!is.null(matI)) {
        message("getting cached data")
        return(matI)
    }
    data <- mat$get()
    matI <- solve(data, ...)
    mat$setinv(matI)
    matI
}
