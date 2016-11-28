require(gdata)
df = read.xls("Assignment_2_Data.xlsx" ,sheet ="Lottery_Data",header=TRUE)

result <- apply(X = df,MARGIN=1, FUN= chisq.test)

str(chisq.test(df[1, ]))

plot(unlist(lapply(result, "[", "p.value"), use.names = FALSE))

print(" P-Values are largely < 0.05 using Pearson's Chi-Squared test, so we do not reject the null hypothesis 
that there is equiprobability")

#Maybe generate a Normal sample of N=30 and compare to first column of lottery data
#plot all data
#first make a N=50000 vector

dfnew<-unlist(df,use.names=FALSE)
dfnew2<-sort(dfnew)
hist(dfnew2,probability=TRUE)
lines(density(dfnew), col="red")
