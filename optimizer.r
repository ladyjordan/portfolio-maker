# Portfolio Optimizer
A <- read.csv("datasets/appl.csv")
B <- read.csv("datasets/fb.csv")
C <- read.csv("datasets/nvda.csv")
D <- read.csv("datasets/googl.csv")

# Historical stock prices of NASDAQ	listed comapanies(weekly frequency)
p <- structure(c(A$Close, B$Close, C$Close, D$Close), .Dim = c(52, 4), .Dimnames = list(NULL, c("APPLE", "FACEBOOK", "NVIDIA", "GOOGLE")))
# Difference of prices to returns 
r <- 100*diff(log(p))
# Historical expected returns
colMeans(r)
# Historical correlation matrix 
cor(r)
# Historical covariance matrix 
S <- cov(r)
S

# Historical portfolio variance for stated portfolio of 20%,20%,30%,30%
w <- c(.2, .2, .3, .3)
t(w) %*% S %*% w

# Portfolio optimisation function
library(tseries)
optimised <- portfolio.optim(r)       
# weights 
optimised$pw 
# Expected return using weights                          
optimised$pm    
 # Standard deviation of optimised portfolio                        
optimised$ps                           