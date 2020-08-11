# This code allows you to calculate and evaluate the various moments and centralized moments of different Probability Distributions.
# Its purpose is to aid in the computation and understanding of these concepts so that students can form a better understanding of these concepts.

#####################################################################################################################
### These are the list of parameters for all of the distributions set them to the values
### you wish to examine in the MGF_evaluator function as desired.
### These are the default values for all parameters.

# For the Uniform Distribution
#a <- 0 # The lower bound for the uniform distribution.
#b <- 1 # The upper bound for the uniform distribution.

# For the Normal Distribution
#mu = 0 # Mean for the Normal Distribution.
#sigma = 1 # Standard Deviation for the Normal Distribution.

# For the Bernoulli, Geometric, Negative Binomial and Binomial Distribution
#p = 0.5 # The success probabiltiy for a Bernoulli, Geometric, Negative Binomial and Binomial Distribution.
#n = 10 # The number of trials for a Binomial Distribution.
#r = 5 # The number of successes for the Negative Binomial Distribution. 

# For the Chi-square, Gamma, Exponential and Poisson Distributions.
#k = 2 # Degrees of freedom for the Chi-Square Distribution.
#lambda = 5 # for the Poisson, Exponential and Gamma Distribution.
#alpha = 1 # for the Gamma Distribution.
#####################################################################################################################

# Define a function mgf that returns the moment generating function of each of the 9 distributions
mgf <- function(distribution){
  if (distribution == "Bernoulli"){
    return("1-p+p*exp(t)")
  }
  if (distribution == "Geometric"){
    return("((p*exp(t))/(1-(1-p)*exp(t)))")
  }
  if (distribution == "Negative Binomial"){
    return("((p*exp(t))/(1-(1-p)*exp(t)))^r")
  }
  if (distribution == "Binomial"){
    return("(1-p+p*exp(t))^n")
  }
  else if (distribution == "Normal"){
    return("exp(mu*t + 0.5*sigma^2*t^2)")
  }
  else if (distribution == "Exponential"){
    return("lambda/(lambda-t)")
  }
  else if (distribution == "Gamma"){
    return("(lambda/(lambda-t))^alpha")
  }
  else if (distribution == "Poisson"){
    return("exp(lambda*(exp(t)-1))")
  }
  else if (distribution == "Chi-Square"){
    return("(1-2t)^(-k/2)")
  }
  #else if (distribution == "Uniform"){
  #  return("((exp(b*t)-exp(a*t))/(t*(b-a)))")
  #}
  
  
# Define a function cgf that returns the cumulant generating function of the distribution
}
cgf <- function(distribution){
  if (distribution == "Bernoulli"){
    return("log(1-p+p*exp(t))")
  }
  if (distribution == "Binomial"){
    return("log((1-p+p*exp(t))^n)")
  }
  if (distribution == "Geometric"){
    return("log((p*exp(t))/(1-(1-p)*exp(t)))")
  }
  if (distribution == "Negative Binomial"){
    return("r*log((p*exp(t))/(1-(1-p)*exp(t)))")
  }
  else if (distribution == "Normal"){
    return("mu*t + 0.5*sigma^2*t^2")
  }
  else if (distribution == "Exponential"){
    return("log(lambda/(lambda-t))")
  }
  else if (distribution == "Gamma"){
    return("log((lambda/(lambda-t))^alpha)")
  }
  else if (distribution == "Poisson"){
    return("lambda*(exp(t)-1)")
  }
  else if (distribution == "Chi-Square"){
    return("log((1-2t)^(-k/2))")
  }
  #else if (distribution == "Uniform"){
  #  return("log((exp(b*t)-exp(a*t))/(t*(b-a)))")
  #}
}

# This function evaluates the nth order derivative of each mgf and cgf for the selected
# probability distribution. It provdes the formula as well as the result for each.

MGF_evaluator <- function(distribution,t = 0, order_of_moment =1,mu =0,sigma =1,n = 10,p = 0.5,r = 5,lambda = 5,alpha = 1,k = 2){
  
  # Use if statements to create the appropriate suffix for the order of the moment.
  if(order_of_moment == 1){
    suffix = "st"
  }
  else if(order_of_moment == 2){
    suffix = "nd"
  }
  else if(order_of_moment == 3){
    suffix = "rd"
  }
  else{
    suffix = "th"
  }
  # Print out the MGF of the selected probability distribution
  cat("The Moment Generating Function for the ",distribution,"distribution is: \n")
  print(mgf(distribution))
  
  # Parse the MGFs to make them into expression format so that their derivatives can be
  # calculated.
  mgf_for_derivative <- parse(text = mgf(distribution))
  cgf_for_derivative <- parse(text = cgf(distribution))
  
  # take the first derivative of the MGF
  if (order_of_moment == 1){
    d <- D(mgf_for_derivative,"t")
    ln_d <- D(cgf_for_derivative,"t")
  }
  # If the order of the moment that you are interested in is not 1
  else{
    d <- D(mgf_for_derivative,"t")
    ln_d <- D(cgf_for_derivative,"t")
    for (i in 1:(order_of_moment-1)){
      d <- D(d,"t")
      ln_d <- D(ln_d,"t")
    }

  }

  # Print the moment generating function and the cumulant generating function
  cat("The formula for the ",order_of_moment,suffix, "moment is: \n")
  print(d)
  cat("The value of the ",order_of_moment,suffix," moment is: \n")
  print(eval(d))
  cat("The formula of the",order_of_moment,suffix, "centralized moment is: \n")
  print(ln_d)
  cat("The ",order_of_moment, " th centralized moment's value is: \n")
  print(eval(ln_d))
}


####################################################################################################################
#Usage Examples:

MGF_evaluator(distribution = "Binomial",order_of_moment = 3)
MGF_evaluator(distribution = "Normal",t = 0,order_of_moment = 4)
MGF_evaluator(distribution = "Poisson",t = 0,order_of_moment = 2)
MGF_evaluator(distribution = "Exponential",t = 0,order_of_moment = 2)
MGF_evaluator(distribution = "Gamma",t = 0,order_of_moment = 2)
#MGF_evaluator(distribution = "Uniform",t = 0,order_of_moment = 1)
MGF_evaluator(distribution = "Geometric",t = 0,order_of_moment = 1)
MGF_evaluator("Negative Binomial", t = 0, order_of_moment = 2)
####################################################################################################################