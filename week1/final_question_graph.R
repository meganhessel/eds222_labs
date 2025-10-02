library(ggplot2)
library(tidyverse)

# Loading in the data 
diet_df <- read_csv(here::here("week1", "dietary-choices-uk.csv"))

#....................Vegetarains % per age group .......................

# Subseting data 
mean_diet <- diet_df[, c(1, 9)] %>% #Selecting 2 columns: 'Entity' & 'Perc of Veg'
  group_by(Entity) %>% 
  summarise(mean_veg = mean(`Percentage of vegetarians`, na.rm= TRUE)) %>% #Avg veg % per age bracket
  filter(!Entity == "All adults") #Delete "All Adults" age bracket 


ggplot(mean_diet, 
       aes(x=Entity, 
           y=mean_veg)) + 
  geom_col(fill = '#488f30')+ 
  labs(title = 'Avg Percentages of Vegetarians Across Age Groups in the UK', 
       x = 'Age Brackets', 
       y = 'Average Percentages of Vegetarians', 
       caption = "IMAGE 2: Data Source: YouGov (2025) – with minor processing by Our World in Data. “Percentage of flexitarians – YouGov” [dataset]. YouGov, “Dietary choices of Brits” [original data].") + 
  theme(plot.caption = element_text(hjust = 0, size = 6.5))

ggsave(here::here('week1', 'VegGraph.png'), height = 8, width = 8)



#............................blah blah...........................


# WRANGLING DATA 
diet_df_year <- diet_df %>% 
  mutate(year = year(diet_df$Day)) %>% #New column w/ year 
  group_by(year) %>% 
  summarise(across(everything(), mean, na.rm = TRUE)) %>% #Avg rows w/ same year
  select(!c(Entity, Code, Day)) #Deleting unnecessary columns 

print(diet_df_year)



# Transposing dataframe: Column names = the years

diet_t <- t(diet_df_year) #transposing df (into matrix)

colnames(diet_t) <- c('2019', '2020', '2021', '2022', '2023','2024', '2025') #Making years the col names

diet_t <- as.data.frame(diet_t[-c(1), ]) #Make dataframe & deleting the row of years
print(diet_t)


# pivoting (longer) the data 
diet_long <- pivot_longer(diet_df_year, 
                          cols = starts_with("Percentage"), 
                          names_to = 'Diets', 
                          values_to = 'Percentages'
)


# Graphing 

plot <- ggplot(diet_long, 
       aes(x = year, 
           y = Percentages, 
           fill = Diets)) + 
  geom_col() + 
  scale_fill_manual(values = c("#EA7580FF", "#F6A1A5FF", "#F8CD9CFF", "#1BB6AFFF", "#088BBEFF", "#172869FF")) + 
  scale_x_continuous(breaks = c(2019, 2020, 2021, 2022, 2023, 2024, 2025)) + 
  labs(title = "Proportion of Diet Categories Over Time in the UK", 
       x = "Years", 
       y = "Population Percenatges", 
       caption = "IMAGE 1: Data Source: YouGov (2025) – with minor processing by Our World in Data. “Percentage of flexitarians – YouGov” [dataset]. YouGov, “Dietary choices of Brits” [original data].") + 
  theme(plot.caption = element_text(hjust = 0), size = 5)


print(plot)

ggsave(here::here('week1', 'Prop_stacked_bar.png'), height = 7, width = 11)


