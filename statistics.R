print("Set seed to 10005")
set.seed(10005)

#Binomial
#100
print("Poisson with 100 RS and its histogram")
print("Named p1")
p1<-rpois(100,1)
hist(p1,main=paste("100 random samples of Poisson"),breaks=seq(0,10,1))

#10000
print("Poisson with 10000 RS and its histogram")
print("Named p2")
p2<-rpois(10000,1)
hist(p2,main=paste("10000 random samples of Poisson"),breaks=seq(0,17+.5,1))

#Gamma
#100
print("Gamma with 100 RS and its histogram")
print("Named g1")
g1<-rgamma(100,5,4)
hist(g1,main=paste("100 random samples of Gamma"),breaks=seq(0-.5,10+.5,1))

#10000
print("Gamma with 10000 RS and its histogram")
print("Named g2")
g2<-rgamma(10000,5,4)
hist(g2,main=paste("10000 random samples of Gamma"),breaks=seq(0-.5,10+.5,1))

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
