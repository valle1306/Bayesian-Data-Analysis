# Binomial distributions ----


hist(rbinom(n = 10000, size = 6, prob = .2))

# Beta distributions ----
library(bayesrules)
library(ggplot2)

plot_beta(1, 1)  # an "non-informative" prior
dbeta(x = 0.3, shape1 = 1, shape2 = 1) # density of Beta(1,1) at x = 0.3
pbeta(q = 0.3, shape1 = 1, shape2 = 1) # cumulative probability below x = 0.3
qbeta(p = 0.5, shape1 = 1, shape2 = 1) # 50% quantile (median)
rbeta(n = 1, shape1 = 1, shape2 = 1)  # one random draw
summarize_beta(1, 1)

plot_beta(5, 1)  # a "very optimistic" prior
dbeta(x = 0.75, shape1 = 5, shape2 = 1) # density of Beta(5,1) at x = 0.3
pbeta(q = 0.75, shape1 = 5, shape2 = 1) # cumulative probability below x = 0.3
summarize_beta(5, 1)

plot_beta(3, 7)  # an "pessimistic" prior
dbeta(x = 0.3, shape1 = 3, shape2 = 7) # density of Beta(3,7) at x = 0.3
pbeta(q = 0.3, shape1 = 3, shape2 = 7) # cumulative probability below x = 0.3
summarize_beta(3, 7)

  # how do you describe this prior?


# Laplace and female births ----plot_beta(0.5, 0.5)

female_births = 241945 # observations
total_births = 493472
male_births = total_births - female_births
a.prior = 1 # prior parameters
b.prior = 1
a.posterior = a.prior + female_births # posterior parameters
b.posterior = b.prior + male_births 

plot_beta(a.posterior, b.posterior) + xlim(0.47, 0.5) # changes the x axis scales
summarize_beta(a.posterior, b.posterior) # posterior summary
pbeta(q = 0.5, shape1 = a.posterior, b.posterior) # posterior prob of theta < 0.5


# Use the commands dbinom() and pbinom() to replicate the numerical calculations int 
# Kasparov example discussed in class

#If Kasparov's chance of beating Deep Blue were 80%, then:
#Probability he'd win all six games
dbinom(x=6, size=6, prob = .8)
# probablity he'd lose all six games 
dbinom(x=0, size=6, prob=.8)

#If Kasparov's chance of beating DeepBlue were 50%, then
# Probability he'd win all six games is
dbinom(x=6, size=6, prob=.5)
# Probability he'd win five games
dbinom(x=5, size=6, prob=.5)
# Probability he'd win at least five games
pbinom(5, size = 6, prob = .5, lower.tail= FALSE)

#Use the analytical definition of the mean for discrete random variables discussed 
#in class to verify that the mean of a bin(3,0.4) variable is indeed equal to 3*0.4
# TRUE because n*pi

#Calculate the mean and the variance of a beta(2,5) variable and a beta(20,50) variable. 
# Graph them using the plot_beta() command

#beta(2,5)
mean1 = 2/(2+5)
variance1 = (2*5)/((2+5)^2*(2+5+1))
plot_beta(2,5) #pessimistic prior
summarize_beta(2, 5)

#beta(20,50)
summarize_beta(20,50)
plot_beta(20,50)

#Exercise 3.1
#a "I think I have a 40% chance of getting the job, but I'm pretty unsure" Chances are from 20% to 60%
plot_beta(11,16)

#Exercise 3.9
summarize_beta(8,2)
summarize_beta(1,20)
#plot the prior for both 
plot_beta(8,2)
plot_beta(1,20)

#Quiz
#all pancakes are good
dbinom(x=8, size=8, prob =.75)
pbinom(6, size = 8, prob = .75, lower.tail= FALSE)
#five good pancakes
dbinom(x=5, size=8, prob =.4)
dbinom(x=5, size=8, prob =.75)
dbinom(x=5, size=8, prob =.9)
0.124*0.1+.208*.4+.033*.5
#posterior probability decent pan
.208*.4/.112 #decent pan
.033*0.5/.112 #fancy pan
.124*.1/.112 #rusted pan


summarize_beta(7,9)
