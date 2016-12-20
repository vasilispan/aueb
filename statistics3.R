print("---- Msc in Data Science  ---- ")
print("Probability and Statistics for Data Analysis   --- Assignment 3")
print("--- Author: Chrysanthos Lianos ---")
require(gdata)
print("Question 1")
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

# and some qqplots 
qqnorm(fitY_W$residuals,main = "QQnorm for Y~W")
qqline(fitY_W$residuals,col="red",lty=1,lwd=2)

qqnorm(fitX1_W$residuals,main = "QQnorm for X1~W")
qqline(fitX1_W$residuals,col="red",lty=1,lwd=2)

qqnorm(fitX2_W$residuals,main = "QQnorm for X2~W")
qqline(fitX2_W$residuals,col="red",lty=1,lwd=2)

qqnorm(fitX3_W$residuals,main = "QQnorm for X3~W")
qqline(fitX3_W$residuals,col="red",lty=1,lwd=2)

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

# another alternative is pairwise.t.test
pairwise.t.test(data1$Y,factor(data1$W),p.adjust.method="bonferroni")
pairwise.t.test(data1$X1,factor(data1$W),p.adjust.method="bonferroni")
pairwise.t.test(data1$X2,factor(data1$W),p.adjust.method="bonferroni")
pairwise.t.test(data1$X3,factor(data1$W),p.adjust.method="bonferroni")


# (b)
kruskal.test(Y~factor(W),data=data1)
kruskal.test(X1~factor(W),data=data1)
kruskal.test(X2~factor(W),data=data1)
kruskal.test(X3~factor(W),data=data1)

# (c)
library(gclus)
pairs(data1[c(1,2,3,4)])

# (d)
dta<-data1[c(1,2,3,4)]
dta.r<-abs(cor(dta))
dta.col<-dmat.color(dta.r)
dta.o<-order.single(dta.r)
cpairs(dta,dta.o,panel.colors=dta.col,gap=.5,main="Correlation matrix")

# (e)
# Individually
regression_fit_Y_X1<-lm(Y ~ X1,data=data1)
plot(regression_fit_Y_X1)
regression_fit_Y_X2<-lm(Y ~ X2,data=data1)
plot(regression_fit_Y_X2)
# in the above we can clearly see influential points
# to corrent:we must rerun the same of Y versus X2 without these points
regression_fit_Y_X3<-lm(Y ~ X3,data=data1)
plot(regression_fit_Y_X3)


# (g)

#fitall<-lm(formula = Y~ X1+X2+X3,data=data1)
#summary(fitall)
#anova(fitall)
#fit1<-lm(formula = Y~X1+X2,data=data1)
#anova(fitall,fit1)
#fit2<-lm(formula = Y~X1+X3,data=data1)
#anova(fitall,fit2)
#fit3<-lm(formula = Y~X2+X3,data=data1)
#anova(fitall,fit3)

# stepwise regression method
fitnull<-lm(Y ~ 1,data=data1)
stepSR<-step(fitnull, scope=list(lower = ~ 1, upper = ~ X1 + X2 +X3),direction="both", data=data1)
stepSR$anova

# all subsets
library(alr3)
library(leaps)

leaps<-regsubsets(Y ~ X1 + X2 + X3, data=data1,nbest=1)
summary(leaps)

anova(stepSR,leaps)
#(h)
print("best model is the stepwise regression")
# (i)
coefficients(stepSR)
confint(stepSR,level=0.95)
predict(stepSR,data.frame(X1=3.1,X2=3.75,X3=1.2),interval="confidence")
predict(stepSR,data.frame(X1=3.1,X2=3.75,X3=1.2),interval="prediction")

print("Question 2")
data2 = read.xls("Assignment_3_Data.xlsx",sheet="Data2" ,header=TRUE)
head(data2)

# (a)

boxplot(Y~W*Z,main = "Y versus interaction of W and Z",xlab="Combinations of W and Z",ylab="Y",col=2:4,data=data2)

# (b)

interaction.plot(data2$W,data2$Z,data2$Y,type="b",col=c(1:3),leg.bty="0",
	lwd=2,pch=c(18,24,22),trace.label="Factor Z",xlab="factor W" ,
	ylab="Mean of Y", main = "Interaction plot of mean Y per levels of factors W and Z",data=data2)

# (c)
fit<-aov(Y~W*Z,data=data2)
fit
summary(fit)
layout(matrix(1:4,2,2))
plot(fit)

print("The model does not fit the assumptions. To begin with, the 'Residuals vs Fitted' plot has a pattern to it
	, so it is not heteroscedastic by nature")
# Now with the interaction term
fit<-aov(Y~Y*W*Z,data=data2)
plot(fit)
print("As previously shown, again the model does not satisfy the assumptions")

print("Question 3")
# (a)
data3 = read.xls("Assignment_3_Data.xlsx",sheet="Data3" ,header=TRUE)
head(data3)
library(ggplot2)
library(RColorBrewer)
mycolors<-brewer.pal(4,"Set1")
names(mycolors) < levels(data3$D)
colScale<-scale_colour_manual(name="D",values=mycolors)
myplot<-ggplot(data3,aes(Y,T,colour=D),main="Plot of Y versus T") + geom_point()
myplot

# (b)
newfit<-lm(Y~T*factor(D),data=data3)
summary(newfit)

# (c)
print("Model does not satisfy assumptions, as there is clearly a pattern in the 'Residuals vs Fitted' plot
	and the others")
