 set.seed(5)

 #Binomial
b1 <-rbinom(100,10,0.05)
b2 <-rbinom (10000,10,0.05)

#Gamma

g1 <- rgamma(100, a=5, scale =4)
g2 <- rgamma(10000,a = 5, scale=4)
