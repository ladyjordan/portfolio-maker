# Tech Portfolio Optimizer
A <- read.csv("datasets/appl.csv")
B <- read.csv("datasets/fb.csv")
C <- read.csv("datasets/nvda.csv")
D <- read.csv("datasets/googl.csv")

# Historical stock prices of NASDAQ	listed - Apple Inc., Facebook Inc., Nvidia and Alphabet Inc. (weekly frequency)
p <- structure(c(A$Close, B$Close, C$Close, D$Close), .Dim = c(52, 4), .Dimnames = list(NULL, c("APPLE", "FACEBOOK", "NVIDIA", "GOOGLE")))
# Difference of prices to returns 
r <- 100*diff(log(p))
# expected returns
colMeans(r)
# correlation matrix 
cor(r)
# covariance matrix 
S <- cov(r)
S

# portfolio variance for expected portfolio of 20%,20%,30%,30%
w <- c(.2, .2, .3, .3)
t(w) %*% S %*% w

# Portfolio optimisation function
library(tseries)
optimised <- portfolio.optim(r)       
# weights 
optimised$pw 
# expected return using weights                          
optimised$pm    
 # standard deviation of optimised portfolio                        
optimised$ps                           