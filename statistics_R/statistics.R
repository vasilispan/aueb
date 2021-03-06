print("Set seed to 10005")
set.seed(10005)

print("Provide a graphical representation (visualization) of your data")
print("Poisson with 100 RS and its histogram")
print("Named p1")
par(mfrow=c(1,2))
p1<-rpois(100,5)
hist(p1,freq=F, col="lightblue", xlab="x1", main="Histogram with Poisson d with 100 RS") 
lines(density(p1),col="red")

print("Poisson with 10000 RS and its histogram")
print("Named p2")
par(mfrow=c(1,2))
p2<-rpois(10000,5)
hist(p2,freq=F, col="lightblue", xlab="x1", main="Histogram with Poisson d with 10000 RS") 
lines(density(p1),col="red")

print("Now for Poisson True with λ=10")
print("Named ptrue")
par(mfrow=c(1,2))
ptrue<-rpois(100,10)
hist(ptrue,freq=F, col="lightblue", xlab="x1", main="Histogram of true Poisson") 
lines(density(ptrue),col="red")

print("Gamma with 100 RS and its histogram")
print("Named g1")
par(mfrow=c(1,2))
g1<-rgamma(100,5,4)
hist(g1,freq=F,  col="lightblue", xlab="x1", main="Histogram with Gamma d with 100 RS") 
lines(density(g1),col="red")

print("Gamma with 10000 RS and its histogram")
print("Named g2")
par(mfrow=c(1,2))
g2<-rgamma(10000,5,4)
hist(g2,freq=F, col="lightblue", xlab="x1", main="Histogram with Gamma d with 10000 RS") 
lines(density(g2),col="red")

print("Now for Gamma with a=b=1")
print("Named gtrue")
par(mfrow=c(1,2))
gtrue<-rgamma(100,1,1)
hist(gtrue,freq=F, col="lightblue", xlab="x1", main="Histogram with Gamma d with 10000 RS") 
lines(density(gtrue),col="red")

print("Get an estimate of the: mean; sd; median; IQR. What are the theoretic values of these statistics when the true distribution is used?")
print("Get statistics mean,median,sd,IQR for the above random samples")
print("Statistics for Poisson with 100 RS")
mean(p1)
median(p1)
sd(p1)
IQR(p1)

print("Statistics for Poisson with 10000 RS")
mean(p2)
median(p2)
sd(p2)
IQR(p2)

print("Statistics for True Poisson")
mean(ptrue)
median(ptrue)
sd(ptrue)
IQR(ptrue)

print("Statistics for Gamma with 100 RS")
mean(g1)
median(g1)
sd(g1)
IQR(g1)

print("Statistics for Gamma with 10000 RS")
mean(g2)
median(g2)
sd(g2)
IQR(g2)


print("The true distribution is the normal, thus generate random numbers and calculate mean,media,sd,IQR")
n1<-rbinom(100,15,.8)
mean(n1)
median(n1)
sd(n1)
IQR(n1)

print("What is the proportion of the sample data in the region:
[min(mean; median); max(mean; median)]
What is the theoretic proportion of this region when the true distribution is used?")
print("Function to calculate ratio of reduced vectors")

proportions <- function(x){
  min<-min(mean(x),median(x))
  max<-max(mean(x),median(x))
  props<-x[x>=min & x<=max]
  ratio<-(length(props)/length(x))*100
  sprintf("Ratio over original sample %s is %s %% " ,deparse(substitute(x)),ratio)
}

print("For Poisson p1: " )
proportions(p1)

print("For Poisson p2: " )
proportions(p2)

print("For Poisson True: ")
proportions(ptrue)

print("For Gamma g1: " )
proportions(g1)

print("For Gamma g2: " )
proportions(g2)

print("For Gamma True: ")
proportions(gtrue)

print("What is the quantile of the sample data that are at or below the lowest 1%? What
is the respective theoretic quantile when the true distribution is used?
What is the quantile of the sample data that are at or above the upper 1%? What
is the respective theoretic quantile when the true distribution is used?")
print("For Poisson p1")
qqnorm(p1)
qqline(p1,col="red",lty=1,lwd=2)
abline(0,1,col="blue")

print("For Poisson p2")
qqnorm(p2)
qqline(p2,col="red",lty=1,lwd=2)
abline(0,1,col="blue")

print("For Gamma g1")
qqnorm(g1)
qqline(g1,col="red",lty=1,lwd=2)
abline(0,1,col="blue")

print("For Gamma g2")
qqnorm(g2)
qqline(g2,col="red",lty=1,lwd=2)
abline(0,1,col="blue")

print("Comment on the discrepancies between theoretic and sample evaluated statistics
in questions (b)-(e).")
print("Answer: Of course in this exercise we are not paying respect to the optimal parameters which define the characteristics of \n
a distribution, such as the λ regarding Poisson's case, and α,β regarding Gamma. The data does not follow the trend of True \n
distributions because of such adjustments")

print("Under the assumption of squared error loss function use each of the data set to
provide your best prediction of a single future observable.")
print("Answer: best prediction is E[X]")
