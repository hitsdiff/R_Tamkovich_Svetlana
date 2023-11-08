library(tidyverse)
library(readr)
#library(stringr)
library(dplyr)
library(shiny)
library(shinydashboard)
library(tidyverse)
#library(readxl)
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




#campaign <- left_join(campaign_desc,campaign_table,by="CAMPAIGN")
#campaign <- select(campaign,CAMPAIGN, DESCRIPTION.x, START_DAY, END_DAY, household_key)
#campaign


#coup <- left_join(coupon,coupon_redempt,by="CAMPAIGN")





