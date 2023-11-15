shinyServer(function(input,output){
  
  #Задание 1
  output$time_plot <- renderPlot({
    
    time <- transaction_data$TRANS_TIME
    time_plot<-hist(transaction_data$TRANS_TIME,main="Распределение количества заказов в течение дня",
                   xlab="Время",
                    xlim=c(0,2450),
                    ylab="Количество заказов",
                    col="darkorchid4")
        
      time_plot
    ?hist
  })
  
  # Дополнительные графики
  output$hh_comp_desc_plot <- renderPlotly({
    
    hh_comp_desc_plot <- ggplot(hh_demographic) + geom_bar(mapping=aes(x=HH_COMP_DESC),color="#9A32CD",fill="#9A32CD")+labs(x="Типы",y="Количество") 
    hh_comp_desc_plot
  })
  
  output$age_desc_plot <- renderPlotly({
    
    age_desc_plot <- ggplot(hh_demographic) + geom_bar(mapping=aes(x=AGE_DESC),color="#BF3EFF",fill="#BF3EFF")+labs(x="Возраст",y="Количество")
    age_desc_plot
    
  })
  
  # Задание 4
  output$time_table <- renderRHandsontable({
    #transaction_data_less <- select(transaction_data,household_key,QUANTITY,STORE_ID,PRODUCT_ID,SALES_VALUE,TRANS_TIME)  #,SALES_VALUE,QUANTITY)
    
    rhandsontable(head(transaction_data,1000))
  })
  
  # Задание 2
  output$top_sum_table <- renderRHandsontable({
    #top_by_sales <- transaction_data %>% group_by(PRODUCT_ID) %>% summarise(sum_sales=sum(SALES_VALUE,na.rm=TRUE))  
    #top_by_sales <- top_by_sales[order(top_by_sales$sum_sales,decreasing=TRUE),]
    #top_by_sales <- top_by_sales %>% slice(1:10)
    #top_by_sales
    rhandsontable(top_by_sales)
  })
  
  
  output$top_quantity_table <- renderRHandsontable({
    #top_by_quantity <- transaction_data %>% group_by(PRODUCT_ID) %>% summarise(sum_q=sum(QUANTITY,na.rm=TRUE))
    #top_by_quantity <- top_by_quantity[order(top_by_quantity$sum_q,decreasing=TRUE),]
    #top_by_quantity <- top_by_quantity %>% slice(1:10)
    
    rhandsontable(top_by_quantity)
  })
  
  
  
  output$top_stores_table <- renderRHandsontable({
    #top_stores_by_sales <- transaction_data %>% group_by(STORE_ID) %>% summarise(sum_sales_store=sum(SALES_VALUE,na.rm=TRUE))
    #top_stores_by_sales <- top_stores_by_sales[order(top_stores_by_sales$sum_sales_store,decreasing=TRUE),]
    #top_stores_by_sales <- top_stores_by_sales %>% slice(1:10)

    #stores_products <- left_join(top_stores_by_sales,transaction_data,by="STORE_ID")
    #stores_products <- select(stores_products,STORE_ID,sum_sales_store,PRODUCT_ID)  #,SALES_VALUE,QUANTITY)
    #stores_products <- stores_products %>% filter(PRODUCT_ID %in% unique(top_by_sales$PRODUCT_ID) | PRODUCT_ID %in% unique(top_by_quantity$PRODUCT_ID))
    #stores_products <- distinct(stores_products)
    #stores_products <- stores_products %>% group_by(STORE_ID) %>% summarise(count_top_products=n())
    #stores_products <- stores_products[order(stores_products$count_top_products,decreasing=FALSE),]
    #stores_products
    rhandsontable(stores_products)
  })
  
  # Задание 3
  output$clients_quantity <- renderValueBox({
    clients_q <- length(unique(transaction_data$household_key))
    valueBox(clients_q,"Количество клиентов,покупающих товары наших в магазинах",color="purple",icon=icon("user"))
  })
  
  output$cur_num_marketing_companies <- renderValueBox({
    cur_num_companies <- length(unique(campaign_desc$CAMPAIGN))
    valueBox(cur_num_companies,"Текущее количество маркетинговых кампаний",color="purple",icon=icon("briefcase"))
  })
  
  
  output$mean_one_hosehold <- renderValueBox({
    transaction_data$amount<- transaction_data$QUANTITY*transaction_data$SALES_VALUE
    mean_for_each <- transaction_data %>% group_by(household_key) %>% summarise(avg_amount_purchases=mean(amount,na.rm=TRUE))
    mean_all <- round(mean(mean_for_each$avg_amount_purchases),1)
    valueBox(mean_all,"Средняя сумма покупок на одну семью",color="purple",icon=icon("coins"))
  })
  
  output$count_sale_products_all <- renderValueBox({
   all_products <- sum(transaction_data$QUANTITY)
   all_products
    v <- paste(round(all_products/1000000,1),"M",sep="")
    valueBox(v,"Общее количество проданных товаров",color="purple",icon=icon("bars"))
  })
  
  # Дополнительные показатели
  #sum_for_each <- transaction_data %>% group_by(household_key) %>% summarise(sum_amount_purchases=sum(amount,na.rm=TRUE))
  output$untop_clients_table <- renderRHandsontable({
    #transaction_data$amount<- transaction_data$QUANTITY*transaction_data$SALES_VALUE
    #sum_for_each <- transaction_data %>% group_by(household_key) %>% summarise(sum_amount_purchases=sum(amount,na.rm=TRUE))
    untop_cl_table <- sum_for_each[order(sum_for_each$sum_amount_purchases,decreasing=FALSE),]
    untop_cl_table <- untop_cl_table %>% slice(1:10)
    untop_cl_table
    rhandsontable(untop_cl_table)
  })
  
  output$top_clients_table <- renderRHandsontable({
    top_cl_table <- sum_for_each[order(sum_for_each$sum_amount_purchases,decreasing=TRUE),]
    top_cl_table <- top_cl_table %>% slice(1:10)
    top_cl_table
    rhandsontable(top_cl_table)
  })
  

  
})
