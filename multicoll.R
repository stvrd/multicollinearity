#  Understand the impact of multicollinearity on linear regression

library(tidyverse)
library(MASS)
library(rgl)

# Generate random correlated data:
s <- matrix(c(1,0.95,.92,0.95,1,0.9,.92,.90,1),3)
x <- mvrnorm(n = 100,mu = c(10,10,10),Sigma = s)
x <- as.data.frame(x)
names(x) <-  c("X1","X2","Y")
cov(x)
# plot3d(x)

# Create linear regressions:
# m1 <- lm(Y~X1,data = x)
# m2 <- lm(Y~X2,data = x)
m3 <- lm(Y~X2+X1,data = x)
# plot(x$X1,x$Y) ; abline(m1)
# plot(x$X2,x$Y) ; abline(m2)

# Create and plot regression plane in 3d space:
library(reshape2)
lims <- round(range(c(x$X1, x$X2)))
lims <- c(6,14)
xs <- seq(lims[1],lims[2],by = 2)
x2 <- expand.grid(X1 = xs, X2 = xs)
x2$Y <- predict(m3, x2)
x2 <- dcast(x2,X1~X2,value.var = "Y")[-1]
# plot3d(x$X1,x$X2,x$Y)
surface3d(xs,xs, as.matrix(x2), alpha=0.1)
summary(m3)

# Run this script multiple times and observe how the regression plane and the coefficients vary.
# If X1 and X2 are strongly correlated, X2 becomes non significant, even tough it is strongly correlated to Y as well.
# If the correlation between dependent variables is too strong, we run into numeric issues for least squares.
