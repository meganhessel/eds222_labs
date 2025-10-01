library(tidyverse)

# 1. define the possible outcomes 
foo <- tibble(
  x = seq(0,100, length.out = 100)
)

# 2. Choose our parameters 
mu <- 45 
sigma <- 16 

# 3. calucauled desnity 
foo <- mutate(food, density = dnorm(x, mean = mu, sd = sigma))

# 4. plot it 
ggplot(foo, aes(x = desnity))+ 
  geom_line()

# -------------------------------------------------------------------- 
# Poisson Distribution 
# Number of events in a fixed window 
foo <- tibble(
  x = seq(0,20, by = 1)
)
lamba <- 1

foo <- mutate(foo, density = dpois(x, lambda = lamba))

ggplot(foo, aes(x, mass))+ 
  geom_line()




# Geometeric Distribution
# number of trails/failures before you get a success 
?dgeom
dgeom1 <- dgeom(seq(1:10), prob = 0.5)   
plot(dgeom1) 


foo <- tibble(
  x = seq(0,10, by = 0.1)
)
shape <- 2
rate <- 1

foo <- mutate(foo, density = dgeom(x, shape = shape, rate = rate))

ggplot(foo, aes(x, density))+ 
  geom_line()


# Gamma Distribution 
# positive contionous variables 
foo <- tibble(
  x = seq(0,10, by = 0.1)
)
shape <- 2
rate <- 1

foo <- mutate(foo, density = dgamma(x, shape = shape, rate = rate))

ggplot(foo, aes(x, density))+ 
  geom_line()
