require(gdata)
#Question 1
data1 = read.xls("Assignment_3_Data.xlsx",sheet="Data1" ,header=TRUE)
head(df)
#(a)
#(i)
plot(factor(data1$W),data1$Y)
plot(factor(data1$W),data1$X1)
plot(factor(data1$W),data1$X2)
plot(factor(data1$W),data1$X3)

#(ii)
fitY_W<-aov(Y~factor(W),data=data1)
summary(fitY_W)
layout(matrix(1:4,2,2))
plot(fitY_W)

fitX1_W<-aov(X1~factor(W),data=data1)
summary(fitX1_W)
layout(matrix(1:4,2,2))
plot(fitX1_W)

fitX2_W<-aov(X2~factor(W),data=data1)
summary(fitX2_W)
layout(matrix(1:4,2,2))
plot(fitX2_W)

fitX3_W<-aov(X3~factor(W),data=data1)
summary(fitX3_W)
layout(matrix(1:4,2,2))
plot(fitX3_W)

#(iii)
qqnorm(fitY_W$residuals,main = "QQnorm for Y~W")
qqline(fitY_W$residuals,col="red",lty=1,lwd=2)

qqnorm(fitX1_W$residuals,main = "QQnorm for X1~W")
qqline(fitX1_W$residuals,col="red",lty=1,lwd=2)

qqnorm(fitX2_W$residuals,main = "QQnorm for X2~W")
qqline(fitX2_W$residuals,col="red",lty=1,lwd=2)

qqnorm(fitX3_W$residuals,main = "QQnorm for X3~W")
qqline(fitX3_W$residuals,col="red",lty=1,lwd=2)
