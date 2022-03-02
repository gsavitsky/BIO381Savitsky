library(dplyr)
library(datasets)
data(iris)
summary(iris)

##1.
str(iris)
###150 obs. of  5 variables

##2.
iris1 <-  filter(iris, Species %in% c("virginica", "versicolor") & Sepal.Length > 6 & Sepal.Width > 2.5)
str(iris4)
##3.
iris2 <- select(iris1, Species, Sepal.Length, Sepal.Width)

##4.
iris3 <- arrange(iris2, by=desc(Sepal.Length))

head(iris3, 6)

##5. 
iris4 <- mutate(iris3, Sepal.Area=Sepal.Length*Sepal.Width)

##6.  
iris5 <- summarize(iris4, meanLength = mean(Sepal.Length), meanWidth = mean(Sepal.Width), TotalN = n())

iris6

##7.
iris_species <- group_by(iris4, Species)

iris6 <- summarize(iris_species, meanLength = mean(Sepal.Length), meanWidth = mean(Sepal.Width), TotalN = n())

print(iris6)

##8.
iris7 <- iris %>%
  filter(Species %in% c("virginica", 
                              "versicolor") & 
           Sepal.Length > 6 & Sepal.Width > 2.5) %>%
  select(Species, Sepal.Length, Sepal.Width) %>%
  arrange(by=desc(Sepal.Length)) %>%
  mutate(Sepal.Area=Sepal.Length*Sepal.Width)%>%
  group_by(Species)%>%
  summarize(meanLength = mean(Sepal.Length), meanWidth = mean(Sepal.Width), TotalN = n())

##9.

wideIRIS <- iris %>% 
  pivot_longer(
    cols=Sepal.Length:Petal.Width,
    names_to = "Measure",
    values_to = "Value")


wideIRIS
