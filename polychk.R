library("FRESA.CAD")

x <- c(1:100)+runif(100)
z <- c(1:100)+runif(100)
k <- c(1:100)+runif(100)
y <- c(1:100)
ndf <- as.data.frame(model.matrix(y~poly(x + z + k , 2)))
colnames(ndf) <- c("y","p1","p2")
ndf$y <- y
fc <- lm(y~.,ndf)
print(summary(fc))

bval <- bootstrapValidation_Res(model.formula="y~p1+p2",Outcome="y",data=ndf)
