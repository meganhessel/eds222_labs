# whats the difference between... 

rnorm()
  # Look at difference of generated RANDOM numbers 

dnorm()
  # Shape of prob DENSITY function (Smooth, pretty curve) 
  # What is the density assocaited with parameters 

pnorm()
  # Cumulative probability / Area number the curve to the left of the parameter # 

qnorm()
  # you give area, the function will give you the x value the area is assocated with 

# ----------------------------------

# rnorm() generates a bunch of random numbers 
a_bunch_of_random_numbers <- rnorm(100, mean = 0, sd = 1)
hist(a_bunch_of_random_numbers)


# dnorm() tells you shape of PDF 
x <- seq(-4, 4, length.out = 100)
density_x <- dnorm(x, mean = 0, sd = 1)
tibble(x, density_x ) %>% 
  ggplot(aes(x, density_x )) + 
  geom_line() + 
  theme_classic()


# pnorm() 
# prob of getting a number less than -0.6 ? 
pnorm(-0.6, mean = 0, sd = 1)
  # Assocaited p-values with pnorm() applied to the null distribtuion 
  # Look at: geom_area later 

# qnorm()
# What x value correspons to 2.5% area under the curve 
qnorm(0.025, mean = 0, sd =1 )


