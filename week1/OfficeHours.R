library(tidyverse)

# 1. define the possible outcomes 
# binomal(1, 0.5) -> 0,1 

bin_pmf <- tibble(x = c(0,1)) 

# 2. Choose our parameters 
n <- 1
p <- 0.5 

# 3, Calc PMF/PDF 
bin_pmf <- mutate(bin_pmf, 
                  pmf = dbinom(x, size = n, prob = p))

ggplot(bin_pmf, aes(x, pmf)) + 
  geom_point(size = 3) + 
  theme_classic()

# ------------------------------------------------------------------------- 
# 1. define the possible outcomes 
# binomal(10, 0.4) -> 0,1 

normal_pdf <- tibble(x = seq(-1,3, length.out = 100))


# 2. Choose our parameters 
mu <- 0  #mean 
sigma <- 0.4  #standard deviation 

# 3, Calc PMF/PDF 
# added a column to the tibble 
normal_pdf <- mutate(normal_pdf, 
                  pdf = dnorm(x, mean = mu, sd = sigma))


ggplot(normal_pdf, aes(x, pdf)) + 
  geom_point(linewidth = 2) + 
  theme_classic()


# ------------------------------- 
------------------------- 
  # 1. define the possible outcomes 
  # binomal(10, 0.4) -> 0,1 
  
normal_pmf <- tibble(x = 0:10) #creates a dataframe 
# could also say tibble(x = seq(0,10, by = 1))


# 2. Choose our parameters 
n <- 10
p <- 0.4 

# 3, Calc PMF/PDF 
# added a column to the tibble 
bin_pmf <- mutate(bin_pmf, 
                  pmf = dbinom(x, size = n, prob = p))


ggplot(bin_pmf, aes(x, pmf)) + 
  geom_point(size = 3) + 
  theme_classic()


# ------------------------------------------------------------------------- 

# 1. define the possible outcomes 
# Beta(2,7)

beta_pdf <- tibble(x = seq(0, 1, length.out = 100) )


# 2. Choose our parameters 
a <- 2
b <- 7 

# 3, Calc PMF/PDF 
# added a column to the tibble 
beta_pdf <- mutate(beta_pdf, 
                  pdf = dbeta(x, shape1 = a, shape2 = b))


ggplot(beta_pdf, aes(x, pdf)) + 
  geom_point() + 
  theme_classic()

