require(gdata)
#Question 1
data1 = read.xls("Assignment_3_Data.xlsx",sheet="Data1" ,header=TRUE)
head(data1)
#(a)
#(i)
plot(factor(data1$W),data1$Y,main="W against Y ")
plot(factor(data1$W),data1$X1,main="W against X1")
plot(factor(data1$W),data1$X2,main="W against X2")
plot(factor(data1$W),data1$X3,main="W against X3 ")

#(ii)
fitY_W<-aov(Y~factor(W),data=data1)
summary(fitY_W)
layout(matrix(1:4,2,2))
plot(fitY_W,main="Summary plot for aov(Y,W)")

fitX1_W<-aov(X1~factor(W),data=data1)
summary(fitX1_W)
layout(matrix(1:4,2,2))
plot(fitX1_W,main="Summary plot for aov(Y,X1)")

fitX2_W<-aov(X2~factor(W),data=data1)
summary(fitX2_W)
layout(matrix(1:4,2,2))
plot(fitX2_W,main="Summary plot for aov(Y,X2)")

fitX3_W<-aov(X3~factor(W),data=data1)
summary(fitX3_W)
layout(matrix(1:4,2,2))
plot(fitX3_W,main="Summary plot for aov(Y,X3)")

# and plotmeans
library(gplots)
plotmeans(data1$Y~factor(data1$W),xlab= "Y",ylab="levels of W ")
plotmeans(data1$X1~factor(data1$W),xlab= "X1",ylab="levels of W ")
plotmeans(data1$X2~factor(data1$W),xlab= "X2",ylab="levels of W ")
plotmeans(data1$X3~factor(data1$W),xlab= "X3",ylab="levels of W ")

#(iii)
#we reject the null hypothesis that there are not signficant mean differences between groups the levels of 
# the categorical variable W
# Some alternatives (atleast for homegeneity of variances) are the bartlett.test and fligner.test
bartlett.test(Y~factor(W),data=data1)
bartlett.test(X1~factor(W),data=data1)
bartlett.test(X2~factor(W),data=data1)
bartlett.test(X3~factor(W),data=data1)
fligner.test(Y~factor(W),data=data1)
fligner.test(X1~factor(W),data=data1)
fligner.test(X2~factor(W),data=data1)
fligner.test(X3~factor(W),data=data1)

# (iv)
# An alternative is the LSD test 
library(agricolae)

DFE <- fitY_W$df.residual
MSE_Y_W <-deviance(fitY_W)/DFE
MSE_X1_W<-deviance(fitX1_W)/DFE
MSE_X2_W<-deviance(fitX2_W)/DFE
MSE_X3_W<-deviance(fitX3_W)/DFE

print(LSD.test(data1$Y,factor(data1$W),DFerror=DFE,MSerror=MSE_Y_W,p.adj="bonferroni"))
print(LSD.test(data1$X1,factor(data1$W),DFerror=DFE,MSerror=MSE_X1_W,p.adj="bonferroni"))
print(LSD.test(data1$X2,factor(data1$W),DFerror=DFE,MSerror=MSE_X2_W,p.adj="bonferroni"))
print(LSD.test(data1$X3,factor(data1$W),DFerror=DFE,MSerror=MSE_X3_W,p.adj="bonferroni"))

# (b)
kruskal.test(Y~factor(W),data=data1)
kruskal.test(X1~factor(W),data=data1)
kruskal.test(X2~factor(W),data=data1)
kruskal.test(X3~factor(W),data=data1)

# (c)
library(gclus)
# get columns Y X1 X2 X3 of our data
dta<-data1[c(1,2,3,4)]
dta.r<-abs(cor(dta))
dta.col<-dmat.color(dta.r)
dta.o<-order.single(dta.r)
cpairs(dta,dta.o,panel.colors=dta.col,gap=.5,main="Correlation matrix")
