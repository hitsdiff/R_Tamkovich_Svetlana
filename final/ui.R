shinyUI(dashboardPage(
  #Заголовок
  dashboardHeader(title="Dashboard"),
  
  #Меню
  dashboardSidebar(
    sidebarMenu(
      menuItem("Графики",tabName="distribution_tab",icon=icon
               ("dashboard")),
      menuItem("Топ-10",tabName="top_10_tab",icon=icon
               ("dashboard")),
      menuItem("Основные показатели бизнеса",tabName="main_business_indicators",icon=icon
               ("dashboard"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName="distribution_tab",
              fluidRow(
                useShinyalert(force=TRUE),
                
                box(title="",width=12,collapsible=TRUE,
                    plotOutput("time_plot")),
                box(title="Типы семей",width=12,collapsible=TRUE,
                    plotlyOutput("hh_comp_desc_plot")),
                box(title="Возраст",width=12,collapsible=TRUE,
                    plotlyOutput("age_desc_plot")),
                box(width=12,#,actionButton("table_save_button",label="Сохранить"),title="",
                    br(),
                    rHandsontableOutput("time_table",height=400,width=1200))
                
      )),
      
    
      
        tabItem(tabName="top_10_tab",
                fluidRow(
                  useShinyalert(),
                  #box(title="Структура затрат",width=6,collapsible=TRUE,
                  #selectInput("prod_select", label="Продукт",choices=c("rt","yj","gh")),
                  #plotOutput("costs_plot")
                  #),
          
                  box(title="Топ товаров по стоимости", width=4,#,actionButton("table_save_button",label="Сохранить"),
                      br(),
                      rHandsontableOutput("top_sum_table",height=300,width=400)),
                  
                  box(title="Топ товаров по количеству", width=4,#,actionButton("table_save_button",label="Сохранить"),
                      br(),
                      rHandsontableOutput("top_quantity_table",height=300,width=400)),
                  
                  
                  box(title="Топ магазинов", width=4,#,actionButton("table_save_button",label="Сохранить"),
                      br(),
                      rHandsontableOutput("top_stores_table",height=300,width=400))
                  
                  )
        ),
      
      
      
      tabItem(tabName="main_business_indicators",
              fluidRow(
                valueBoxOutput("clients_quantity",width=3),
                valueBoxOutput("cur_num_marketing_companies",width=3),
                infoBoxOutput("mean_one_hosehold",width=3),
                valueBoxOutput("count_sale_products_all",width=3),
                
                box(title="Топ 10 семей с наименьшим количеством купленных товаров ", width=6,#,actionButton("table_save_button",label="Сохранить"),
                    br(),
                    rHandsontableOutput("untop_clients_table",height=300,width=600)),
                box(title="Топ 10 семей с наибольшим количеством купленных товаров ", width=6,#,actionButton("table_save_button",label="Сохранить"),
                    br(),
                    rHandsontableOutput("top_clients_table",height=300,width=600))
              )
              
      )
    )
   
    
  )
  
))