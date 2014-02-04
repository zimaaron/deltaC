library(shiny)
library(ngramr)
library(rWBclimate)
library(xtable)

# Define server logic required to download and plot trend data
shinyServer(function(input, output) {
  
  searchInput <- reactive({input$sterm})
  
  tdata <- reactive({
    switch(input$dataset,
           "Google ngrams" = ngram(as.character(input$sterm),
                                   corpus="eng_2012",
                                   year_end=2012,
                                   smoothing=0)[,c(1,3)],
           "WB climate" = get_historical_temp(input$ccode,
                                              time_scale="year")[,c(1,2)])
  })
  
  output$selectUI <- renderUI({
    if(input$dataset=="Google ngrams"){
      textInput("sterm", "Search Term(s):", value = "climate")
    }else if(input$dataset=="WB climate"){
      textInput("ccode","WB Country Code:",value = "USA")
    }
  })
  
  ##Takes inputs from the date range input.
  year_start <- reactive({input$start})
  year_end <- reactive({input$end})
  
  ##Takes input from the subsampling control.
  sub_factor <- reactive({input$sub})
  
  ##Takes input from the lagging control
  lag_factor <- reactive({input$lag})

  output$ols_timePlot <- renderPlot({
    
    ##Standardizes column names
    tdata <- tdata()
    colnames(tdata) <- c("year","data")

    ##Subsets the data.
    tdata2 <- tdata[tdata$year>=year_start() & tdata$year<=year_end(),]
    
    ##Plots the data.
    plot(tdata2$year,tdata2$data,type='l',col="slateblue",xlab="Year",ylab="",main="Trend over Time")
    points(tdata2$year,tdata2$data,pch=21,bg="white")
    if(input$dataset=="Google ngrams"){
      mtext(side=2,text="Ngram Frequency",line=2)
    }else if(input$dataset=="WB climate"){
      mtext(side=2,text="Mean Annual Temp. (C)",line=2)
    }
    
    ##Adds a trend line to the plot.
    model <- lm(tdata2$data~tdata2$year)
    if(input$trend==T){
      abline(model,lty=2)
     }
  })
  
  output$ols_diagPlot <- renderPlot({
    if(input$diag==T){
      ##Standardizes column names
      tdata <- tdata()
      colnames(tdata) <- c("year","data")
      
      tdata2 <- tdata[tdata$year>=year_start() & tdata$year<=year_end(),]
      model <- lm(tdata2$data~tdata2$year)
      resid <- residuals(model,type="response")
      acf <- acf(resid)
      par(mfrow=c(1,2))
      plot(tdata2$year,resid,type="p",main="Residuals",ylab="Residuals",xlab="Year")
      abline(h=0)
      plot(acf,main="Auto-correlation Function",xlab="Lag (Years)")
    }
    
  output$ols_modTable <- renderTable({
    if(input$mod==T){
      ##Standardizes column names
      tdata <- tdata()
      colnames(tdata) <- c("year","data")
      tdata2 <- tdata[tdata$year>=year_start() & tdata$year<=year_end(),]
      model <- lm(tdata2$data~tdata2$year)
      coefs <- summary(model)$coefficients
      rownames(coefs) <- c("Int.","Year")
      return(coefs)
    }
  },digits=-2)
    
    output$sub_timePlot <- renderPlot({
      ##Standardizes column names
      tdata <- tdata()
      colnames(tdata) <- c("year","data")
      
      ##Subsets the data.
      tdata2 <- tdata[tdata$year>=year_start() & tdata$year<=year_end(),]
      
      ##Plots the data.
      plot(tdata2$year,tdata2$data,type='l',col="slateblue",xlab="Year",ylab="",main="Trend over Time")
      if(input$dataset=="Google ngrams"){
        mtext(side=2,text="Ngram Frequency",line=2)
      }else if(input$dataset=="WB climate"){
        mtext(side=2,text="Mean Annual Temp. (C)",line=2)
      }
      
      ##Subsets the data.
      tdata3 <- tdata2[c(rep(FALSE,sub_factor()),TRUE),]
      points(tdata3$year,tdata3$data,pch=21,bg="white")
      
      ##Adds a trend line to the plot.
      model <- lm(tdata3$data~tdata3$year)
      if(input$trend==T){
        abline(model,lty=2)
      }
    })
    
    output$sub_diagPlot <- renderPlot({
      if(input$diag==T){
        ##Standardizes column names
        tdata <- tdata()
        colnames(tdata) <- c("year","data")
        
        tdata2 <- tdata[tdata$year>=year_start() & tdata$year<=year_end(),]
        ##Subsets the data.
        tdata3 <- tdata2[c(rep(FALSE,sub_factor()),TRUE),]
        
        model <- lm(tdata3$data~tdata3$year)
        resid <- residuals(model,type="response")
        acf <- acf(resid)
        par(mfrow=c(1,2))
        plot(tdata3$year,resid,type="p",main="Residuals",ylab="Residuals",xlab="Year")
        abline(h=0)
        plot(acf,main="Auto-correlation Function",xlab="Lag (Years)")
      }
    })
      
      output$sub_modTable <- renderTable({
        if(input$mod==T){
          ##Standardizes column names
          tdata <- tdata()
          colnames(tdata) <- c("year","data")
          
          tdata2 <- tdata[tdata$year>=year_start() & tdata$year<=year_end(),]
          tdata3 <- tdata2[c(rep(FALSE,sub_factor()),TRUE),]
          model <- lm(tdata3$data~tdata3$year)
          coefs <- summary(model)$coefficients
          rownames(coefs) <- c("Int.","Year")
          return(coefs)
        }
      },digits=-2)
    
    output$lag_timePlot <- renderPlot({
      ##Standardizes column names
      tdata <- tdata()
      colnames(tdata) <- c("year","data")
      
      ##Subsets the data.
      tdata2 <- tdata[tdata$year>=year_start() & tdata$year<=year_end(),]
      
      ##Plots the data.
      plot(tdata2$year,tdata2$data,type='l',col="slateblue",xlab="Year",ylab="",main="Trend over Time")
      points(tdata2$year,tdata2$data,pch=21,bg="white")
      if(input$dataset=="Google ngrams"){
        mtext(side=2,text="Ngram Frequency",line=2)
      }else if(input$dataset=="WB climate"){
        mtext(side=2,text="Temp. (C)",line=2)
      }
      
      ##Creates a lag variable and binds it to the data.
      data_ts <- as.ts(tdata2$data,frequency=(1/365))
      data_lag <- lag(data_ts,k=lag_factor())
      lag_data <- cbind(data_ts,data_lag)
      tdata2$data_lag <- lag_data[,2][(lag_factor()+1):length(lag_data[,2])]
      tdata2$year[1:length(tdata)]
      ##Adds to the plot
      lines(tdata2$year,tdata2$data_lag,lty=2,col='slateblue')
      
      ##Creates a lagged regression model.
      model <- lm(tdata2$data~tdata2$year+tdata2$data_lag)
      
      if(input$trend==T){
        tdata3 <- data.frame(tdata2$data,tdata2$year,data_lag=mean(tdata2$data_lag,na.rm=T))
        lag_pred <- predict(model,newdata=tdata3,type='response')
        lag_pred <- lag_pred[1:(length(lag_pred)-lag_factor())]
        lines(tdata2$year[1:(length(tdata2$year)-lag_factor())],lag_pred,lty=2)
      }
    })
    
    output$lag_diagPlot <- renderPlot({
      if(input$diag==T){
        ##Standardizes column names
        tdata <- tdata()
        colnames(tdata) <- c("year","data")
        
        tdata2 <- tdata[tdata$year>=year_start() & tdata$year<=year_end(),]
        
        ##Creates a lag variable and binds it to the data.
        data_ts <- as.ts(tdata2$data,frequency=(1/365))
        data_lag <- lag(data_ts,k=lag_factor())
        lag_data <- cbind(data_ts,data_lag)
        tdata2$data_lag <- lag_data[,2][(lag_factor()+1):length(lag_data[,2])]
        
        ##Creates a lagged regression model.
        model <- lm(tdata2$data~tdata2$year+tdata2$data_lag)
        resid <- residuals(model,type="response")
        acf <- acf(resid)
        par(mfrow=c(1,2))
        plot(tdata2$year[1:(length(tdata2$year)-lag_factor())],resid,type="p",main="Residuals",ylab="Residuals",xlab="Year")
        abline(h=0)
        plot(acf,main="Auto-correlation Function",xlab="Lag (Years)")
      }
    })
    
    output$lag_modTable <- renderTable({
      if(input$mod==T){
        ##Standardizes column names
        tdata <- tdata()
        colnames(tdata) <- c("year","data")
        
        tdata2 <- tdata[tdata$year>=year_start() & tdata$year<=year_end(),]
        
        ##Creates a lag variable and binds it to the data.
        data_ts <- as.ts(tdata2$data,frequency=(1/365))
        data_lag <- lag(data_ts,k=lag_factor())
        lag_data <- cbind(data_ts,data_lag)
        tdata2$data_lag <- lag_data[,2][(lag_factor()+1):length(lag_data[,2])]
        
        ##Creates a lagged regression model.
        model <- lm(tdata2$data~tdata2$year+tdata2$data_lag)
        coefs <- summary(model)$coefficients
        rownames(coefs) <- c("Int.","Year","Lagged Response")
        return(coefs)
      }
    },digits=-2)
    
  })
})