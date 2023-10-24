superstore_data_mutate2 = superstore_data_mutate[superstore_data_mutate$Income < 600000, ] 
superstore_data_mutate2 = superstore_data_mutate2[superstore_data_mutate2$Age < 120, ] 

# Задание 1
library(plotly)
scat <- plot_ly(data = superstore_data_mutate2, x = ~Age, y = ~Income)
scat

# Задание 2
hm <- plot_ly(data = superstore_data2_join,x= ~Education, y=~Marital_Status,z = ~avg_income, type = "heatmap")
hm

# Задание 3

tree <- plot_ly(
  type="treemap",
  labels=c("Сотрудник 1", "Реклама 1", "Реклама 2",  "Сотрудник 2", "Реклама 3"),
  parents=c("tree", "Сотрудник 1", "Сотрудник 1", "tree", "Сотрудник 2")
)
tree

# Задание 4
install.packages('leaflet')
library(leaflet)
library(tidyverse)
leaflet() %>% addTiles() %>% addMarkers(lng =37.617633, lat =  55.755820) %>% addProviderTiles(providers$OpenStreetMap)


# Задание 5
install.packages('DT')
library(DT)
datatable(superstore_data_mutate)


# Задание 6
install.packages('rpivotTable')
library(rpivotTable)
rpivotTable(superstore_data_mutate,rows = "Education", cols = "Marital_Status")







