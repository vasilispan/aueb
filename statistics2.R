print("-----------  Student Name:    Chrysanthos Lianos -----------)
print("=====================================")
print("=====================================")
print("Exercise 7")
print("=====================================")
print("=====================================")
require(gdata)
df = read.xls("Assignment_2_Data.xlsx" ,sheet ="Lottery_Data",header=TRUE)

apply_statistics = function(df){
	result <- apply(X = df,MARGIN=1, FUN= chisq.test)
	str(chisq.test(df[1, ]))
	print("Plot Histogram of dataframe")
	plot(unlist(lapply(result, "[", "p.value"), use.names = FALSE),main = ("Histogram of dataframe",df)
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
	print("Apply chisq.test per column. We again reject the null hypothesis")
	apply(df,2,chisq.test)
}
print("apply statistics on full dataframe")
apply_statistics(df)
print("Choose extreme numbers away from the mean of 1:30")
	
print("New dataframe with first 100 rows only")
apply_statistics(df[1:100,])
apply_statistics(df[1:1000,])	      
		
print("Even with smaller sample sizes of N=100 or N=1000, we cannot safely determine favorable numbers, apart from the edges of the
vector c(1:30)")
	     
print("=====================================")
print("=====================================")
print("Exercise 8")
print("=====================================")
print("=====================================")
	      
print("Student Name Chrysanthos Lianos corresponds to 8th column in X,Y,W,Z sheets")
X = read.xls("Assignment_2_Data.xlsx" ,sheet ="X",header=TRUE)
X= X[8]
Y = read.xls("Assignment_2_Data.xlsx" ,sheet ="Y",header=TRUE)
Y= Y[8]
W = read.xls("Assignment_2_Data.xlsx" ,sheet ="W",header=TRUE)
W= W[8]
Z = read.xls("Assignment_2_Data.xlsx" ,sheet ="Z",header=TRUE)
Z= Z[8]


print("Permanently unlist to use without errors ") 
W<-unlist(W)
X<-unlist(X)	 
Y<-unlist(Y)
Z<-unlist(Z)	     
	     
plot(density(W))	      
abline(v=mean(W),col="red")		  
plot(density(X))
abline(v=mean(X),col="red")		  
plot(density(Y))
abline(v=mean(Y),col="red")		  
plot(density(Z))		  
abline(v=mean(Z),col="red")

#install library fitdistrplus
require(fitdistrplus)
#   X and W are discrete, Y and Z are continuous	      
#fit X to poisson distribution and get an estimate using MLE
fitdist(X,dpois,method="mle")

#W to Poisson and get an esimate using MLE
fitdist(W,dpois,method="mle")
