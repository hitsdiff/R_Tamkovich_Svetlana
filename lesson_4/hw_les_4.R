library('tidyverse')

# Задание 1

View(superstore_data_mutate)
# Считаю, что плоские таблицы нужно использовать не для визуализации, а для хранения данных.
# Посмотрев на такую таблицу сложно сделать какие либо выводы, если данных много. Разве что 
# сколько наблюдений и по каким признакам.

# Задание 2

library(pivottabler)
pt <- PivotTable$new()
pt$addData(superstore_data_mutate)
pt$addColumnDataGroups('Marital_Status')
pt$addRowDataGroups('Education')
pt$defineCalculation(calculationName='Total count', summariseExpression='n()')
pt$evaluatePivot()
pt
# Наибольшее количество людей состоят в отношениях

# Задание 3

hist <- ggplot(superstore_data_mutate) + geom_bar(mapping=aes(x=Education,fill=Rich_flag))
hist
# Среди людей с уровненем образования "Basic" нет таких, чей семейный доход в год превышает 80000.
# Наибольшее количество таких людей с образованием "Graduation", но если мы посмотрим в примерном 
# процентном соотношении, то процент людей с семейным годовым доходом превышающим 80000 примерно одинаков 
# в 4-х оставшихся категриях.


# Задание 4

superstore_data_mutate_by_year <- table(superstore_data_mutate$Year_Birth)
df_superstore_data_mutate_by_year <- data.frame(superstore_data_mutate_by_year)
names(df_superstore_data_mutate_by_year)<-c("Year_Birth","Count")
df_superstore_data_mutate_by_year["Year_Birth"] = lapply(df_superstore_data_mutate_by_year["Year_Birth"],function(x) as.Date(x, format="%Y"))

line <- ggplot(df_superstore_data_mutate_by_year,aes(x=Year_Birth,y=Count,group = 1)) + geom_line()
line

# Наибольшее количество покупателей родились примерно с 1965-1975. 







