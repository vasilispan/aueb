print("Set seed to 10005")
set.seed(10005)

print("Provide a graphical representation (visualization) of your data")
print("Poisson with 100 RS and its histogram")
print("Named p1")
par(mfrow=c(1,2))
p1<-rpois(100,1)
x1n<-seq(-4,4,0.01)
dx1n<-dnorm(x1n)
hist(p1,freq=F, ylim=c(0, max(dx1n)), col="lightblue", xlab="x1", main="Histogram with Poisson d with 100 RS") 
lines(x1n, dx1n,col="red",lty=2,lwd=2)

print("Poisson with 10000 RS and its histogram")
print("Named p2")
par(mfrow=c(1,2))
p2<-rpois(10000,1)
x1n<-seq(-4,4,0.01)
dx1n<-dnorm(x1n)
hist(p2,freq=F, ylim=c(0, max(dx1n)), col="lightblue", xlab="x1", main="Histogram with Poisson d with 10000 RS") 
lines(x1n, dx1n,col="red",lty=2,lwd=2)

print("Gamma with 100 RS and its histogram")
print("Named g1")
par(mfrow=c(1,2))
g1<-rgamma(100,5,4)
x1n<-seq(-4,4,0.01)
dx1n<-dnorm(x1n)
hist(g1,freq=F, ylim=c(0, max(dx1n)), col="lightblue", xlab="x1", main="Histogram with Gamma d with 100 RS") 
lines(x1n, dx1n,col="red",lty=2,lwd=2)

print("Gamma with 10000 RS and its histogram")
print("Named g2")
par(mfrow=c(1,2))
g2<-rgamma(10000,5,4)
x1n<-seq(-4,4,0.01)
dx1n<-dnorm(x1n)
hist(g2,freq=F, ylim=c(0, max(dx1n)), col="lightblue", xlab="x1", main="Histogram with Gamma d with 10000 RS") 
lines(x1n, dx1n,col="red",lty=2,lwd=2)

print("Get statistics mean,median,sd,IQR for the above random samples")
print("Statistics for Poisson with 100 RS")
mean(p1)
median(p1)
sd(p1)
IQR(p1)

print("Get an estimate of the: mean; sd; median; IQR. What are the theoretic values of these statistics when the true distribution is used?")
print("Statistics for Poisson with 10000 RS")
mean(p2)
median(p2)
sd(p2)
IQR(p2)

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

print("For Poisson p1: " )
p1min<-min(mean(p1),median(p1))
p1max<-max(mean(p1),median(p1))
print("get proportion :")
dfp1<-p1[p1>=p1min & p1<=p1max]

print("For Poisson p2: " )
p2min<-min(mean(p2),median(p2))
p2max<-max(mean(p2),median(p2))
print("get proportion :")
dfp2<-p2[p2>=p2min & p2<=p2max]

print("For Gamma g1: " )
g1min<-min(mean(g1),median(g1))
g1max<-max(mean(g1),median(g1))
print("get proportion :")
dfg1<-g1[g1>=g1min & g1<=p1max]

print("For Gamma g2: " )
g2min<-min(mean(g2),median(g2))
g2max<-max(mean(g2),median(g2))
print("get proportion :")
dfg2<-g2[g2>=g2min & g2<=g2max]


print("For True (Normal) n1: " )
n1min<-min(mean(n1),median(n1))
n1max<-max(mean(n1),median(n1))
print("get proportion :")
dfn1<-n1[n1>=n1min & n1<=n1max]
