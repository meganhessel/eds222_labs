library(tidyverse)

# 1. define the possible outcomes 
# binomal(1, 0.5) 

normal_pdf <- tibble(x = seq(-1,3, length.out = 100))


# 2. Choose our parameters 
mu <-   1  #mean 
sigma <- 0.5  #standard deviation 

# 3, Calc PMF/PDF 
# added a column to the tibble 
normal_pdf <- mutate(normal_pdf, 
                     pdf = dnorm(x, mean = mu, sd = sigma))


ggplot(normal_pdf, aes(x, pdf)) + 
  geom_point(linewidth = 2) + 
  theme_classic()



normal_pdf <- tibble(x = seq(-1,3, length.out = 100))


# 2. Choose our parameters 
mu <-   1  #mean 
sigma <- 1  #standard deviation 

# 3, Calc PMF/PDF 
# added a column to the tibble 
normal_pdf <- mutate(normal_pdf, 
                     pdf = dnorm(x, mean = mu, sd = sigma))


ggplot(normal_pdf, aes(x, pdf)) + 
  geom_point(linewidth = 2) + 
  theme_classic()