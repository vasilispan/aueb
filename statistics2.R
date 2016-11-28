require(gdata)
df = read.xls("Assignment_2_Data.xlsx" ,sheet ="Lottery_Data",header=TRUE)

result <- apply(X = df,MARGIN=1, FUN= chisq.test)

str(chisq.test(df[1, ]))

plot(unlist(lapply(result, "[", "p.value"), use.names = FALSE))
abline(h=0.05,col="red")
print("Large amount of P-Values are  < 0.05 using Pearson's Chi-Squared test, so we do reject the null hypothesis 
that there is equiprobability of data")

plot_columns = function(x){
	y<-sort(x)
	hist(y,probability=TRUE,col="blue",main = paste("Histogram of columns of lottery_data"))
	lines(density(y),col="red")
	cat ("Press [enter] to continue")
	line <- readline()
}

print("plot histograms of each column of the data")
apply(df,2,function(x) plot_columns(x))
print("Apply chisq.test per column. We again reject the null hypothesis  
apply(df,2,chisq.test)

	
