library(tidyverse)
library(readr)
library(dplyr)
library(shiny)
library(shinydashboard)
library(tidyverse)
library(plotly)
library(DT)
library(rhandsontable)
library(shinyalert)

campaign_desc <- read.csv("campaign_desc.csv")
campaign_table <- read.csv("campaign_table.csv")
causal_data <- read.csv("causal_data.csv")
coupon <- read.csv("coupon.csv")
coupon_redempt <- read.csv("coupon_redempt.csv")
hh_demographic <- read.csv("hh_demographic.csv")
product <- read.csv("product.csv")
transaction_data <- read.csv("transaction_data.csv")

# Объединяем таблицы
campaign <- left_join(campaign_desc,campaign_table,by="CAMPAIGN")
campaign <- select(campaign,CAMPAIGN, DESCRIPTION.x, START_DAY, END_DAY, household_key)

coupon_hh <- left_join(coupon_redempt,coupon,by="COUPON_UPC")
coupon_hh <- select(coupon_hh,household_key,DAY,CAMPAIGN.x,PRODUCT_ID,COUPON_UPC)


# Подготавливаем некоторые данные в этом файле, 
# почему-то когда эти преобразования осуществлялись в файле server.R, переменные не считывались и не преобразовывались:(
top_by_sales <- transaction_data %>% group_by(PRODUCT_ID) %>% summarise(sum_sales=sum(SALES_VALUE,na.rm=TRUE))  
top_by_sales <- top_by_sales[order(top_by_sales$sum_sales,decreasing=TRUE),]
top_by_sales <- top_by_sales %>% slice(1:10)
top_by_sales

top_by_quantity <- transaction_data %>% group_by(PRODUCT_ID) %>% summarise(sum_q=sum(QUANTITY,na.rm=TRUE))
top_by_quantity <- top_by_quantity[order(top_by_quantity$sum_q,decreasing=TRUE),]
top_by_quantity <- top_by_quantity %>% slice(1:10)

top_stores_by_sales <- transaction_data %>% group_by(STORE_ID) %>% summarise(sum_sales_store=sum(SALES_VALUE,na.rm=TRUE))
top_stores_by_sales <- top_stores_by_sales[order(top_stores_by_sales$sum_sales_store,decreasing=TRUE),]
top_stores_by_sales <- top_stores_by_sales %>% slice(1:10)

stores_products <- left_join(top_stores_by_sales,transaction_data,by="STORE_ID")
stores_products <- select(stores_products,STORE_ID,sum_sales_store,PRODUCT_ID)  #,SALES_VALUE,QUANTITY)
stores_products <- stores_products %>% filter(PRODUCT_ID %in% unique(top_by_sales$PRODUCT_ID) | PRODUCT_ID %in% unique(top_by_quantity$PRODUCT_ID))
stores_products <- distinct(stores_products)
stores_products <- stores_products %>% group_by(STORE_ID) %>% summarise(count_top_products=n())
stores_products <- stores_products[order(stores_products$count_top_products,decreasing=FALSE),]
stores_products

transaction_data$amount<- transaction_data$QUANTITY*transaction_data$SALES_VALUE
sum_for_each <- transaction_data %>% group_by(household_key) %>% summarise(sum_amount_purchases=sum(amount,na.rm=TRUE))





