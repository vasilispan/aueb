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


x<-c(data1$Y,data1$X1,data1$X2,data1$X3)

