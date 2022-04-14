
# Correlation and regression fundamentals with tidy data principles -------


library(tidymodels)

data(Orange)

Orange <- as_tibble(Orange)
Orange

cor(Orange$age, Orange$circumference)

library(ggplot2)
ggplot(Orange, aes(age, circumference, color = Tree)) + geom_line()

Orange %>% group_by(Tree) %>%
  summarise(correlation = cor(age, circumference))

ct <- cor.test(Orange$age, Orange$circumference)
ct 

tidy(ct)

#nest-map-unnest framework for multiple tests or fitting multiple models
nested <- Orange %>% nest(data = c(age, circumference))

nested %>% 
  mutate(test = map(data, ~ cor.test(.x$age, .x$circumference)),
         tidied = map(test, tidy)) %>%
  unnest(cols = tidied) %>% 
  select(-data, -test)

#applying same process for regression models
lm_fit <- lm(age ~ circumference, data = Orange)
summary(lm_fit)
tidy(lm_fit)

Orange %>%
  nest(data = c(-Tree)) %>%
  mutate(test = map(data, ~ lm(age ~ circumference, data = .x)),
         tidied = map(test, tidy)) %>%
  unnest(cols = tidied) %>% 
  select(-data, -test)

# K-means clustering with tidy data principles ----------------------------
iris <- iris |> as_tibble()
iris 
