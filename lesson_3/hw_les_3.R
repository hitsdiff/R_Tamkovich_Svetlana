library(tidyverse)
library(readr)

superstore_data <- read_delim("ДЗ3_superstore_data.csv")

# Задание 1
superstore_data_filter <- filter(superstore_data,Income>30000)
superstore_data_filter

# Задание 2
superstore_data_select <- select(superstore_data,Id, Year_Birth, Education, Marital_Status, Income, Response)
superstore_data_select

# Задание 3
superstore_data_mutate <- mutate(superstore_data,Age=(2023-Year_Birth),Rich_flag=(Income>80000))

# Задание 4
superstore_data2 <- group_by(superstore_data,Education)
superstore_data2 <- summarise(superstore_data2,avg_income=mean(Income,na.rm=TRUE))
# или
superstore_data2 <- superstore_data %>% group_by(Education) %>% summarise(avg_income=mean(Income,na.rm=TRUE))

# Задание 5
superstore_data2_join <- left_join(superstore_data,superstore_data2,by="Education")










