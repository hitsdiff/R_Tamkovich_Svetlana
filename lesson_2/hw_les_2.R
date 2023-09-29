# Векторы и функции

# Задание 1
products <- c("apple","grape","lemon","pineapple")
num <- seq(1,20,2)
products
num

# Задание 2
length(num)
num[1]
num[2:4]

# Задание 3
v1 <- c(1,5,3)
v2 <- c(4,6,2)
sum <- v1+v2
sum

# Задание 4
mean_v1 <- mean(v1)
mean_v1

# Задание 5
function_1 <- function(number)
{
  result <- number*2
}
res_3 <- function_1(3)
res_3

# Задание 6
res_v1 <- function_1(v1)
res_v1

# Матрицы

# Задание 1
m1 <- matrix(v1,nrow=3,ncol=3)
m1

# Задание 2
m1[,1]
m1[2,]

# Задание 3
m1[2,2]

#Датафрейм

# Задание 1
data1 <- read.csv("C:/Users/79082/Downloads/ДЗ2_vgsales.csv", header= TRUE , stringsAsFactors= FALSE )
summary(data1)
str(data1)







