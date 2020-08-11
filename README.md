# Moment_Generating_Functions
This R script contains code for the Moment Generating Functions of Various Distributions as well as the Cumulant Generating Functions.

This code allows you to calculate and evaluate the various moments and centralized moments of different Probability Distributions.
Its purpose is to aid in the computation and understanding of these concepts so that students can form a better understanding of these concepts.

#####################################################################################################################
### These are the list of parameters for all of the distributions set them to the values
### you wish to examine in the MGF_evaluator function as desired.
### These are the default values for all parameters.

# For the Uniform Distribution
a <- 0 The lower bound for the uniform distribution.
b <- 1 The upper bound for the uniform distribution.

# For the Normal Distribution
mu = 0 Mean for the Normal Distribution.
sigma = 1 Standard Deviation for the Normal Distribution.

# For the Bernoulli, Geometric, Negative Binomial and Binomial Distribution
p = 0.5 The success probabiltiy for a Bernoulli, Geometric, Negative Binomial and Binomial Distribution.
n = 10 The number of trials for a Binomial Distribution.
r = 5 The number of successes for the Negative Binomial Distribution.

# For the Chi-square, Gamma, Exponential and Poisson Distributions.
k = 2 Degrees of freedom for the Chi-Square Distribution.
lambda = 5 for the Poisson, Exponential and Gamma Distribution.
alpha = 1 for the Gamma Distribution.
#####################################################################################################################

#Moment Generating Function
a function mgf that returns the moment generating function of each of the 9 distributions

#Cumulant Generating Function
 a function cgf that returns the cumulant generating function of the distribution


#MGF Evaluator
This function evaluates the nth order derivative of the mgf and cgf for the selected distribution.
It provdes the formula as well as the result for each starting with the moment generating function, then the nth moment's formula, the value of the nth moment, the nth centralized moment and finally the value of the nth centralized moment.

####################################################################################################################
#Usage Examples:

##MGF_evaluator(distribution = "Binomial",order_of_moment = 3)
##MGF_evaluator(distribution = "Normal",t = 0,order_of_moment = 4)
##MGF_evaluator(distribution = "Poisson",t = 0,order_of_moment = 2)
##MGF_evaluator(distribution = "Exponential",t = 0,order_of_moment = 2)
##MGF_evaluator(distribution = "Gamma",t = 0,order_of_moment = 2)
##MGF_evaluator(distribution = "Uniform",t = 0,order_of_moment = 1)
##MGF_evaluator(distribution = "Geometric",t = 0,order_of_moment = 1)
##MGF_evaluator("Negative Binomial", t = 0, order_of_moment = 2)
####################################################################################################################
