library(shiny)

# Define UI for application that plots stuff over time.
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel(
    HTML(
      '<!DOCTYPE html>
      <head>
        <link href="/normalize.css" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
        <style>
        header {
        font-family: "Open Sans", sans-serif;
        font-size: 18px; 
        line-height: 24px;
        text-align: center;
        background: url("1280px-Morteratsch_glacier_1.jpg");
        background-size: cover;
        color: white;
        }
        a {
        color: blue;
        }
        nav {
        margin: 0 auto;
        position:relative;
        top: 40px; 
        text-align: center;
        }
        nav ul ul {
        display: none;
        }
        nav ul li:hover > ul {
        display: block;
        }
        nav ul {
        background: #efefef; 
        background: linear-gradient(top, #efefef 0%, #bbbbbb 100%);  
        background: -moz-linear-gradient(top, #efefef 0%, #bbbbbb 100%); 
        background: -webkit-linear-gradient(top, #efefef 0%,#bbbbbb 100%); 
        box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
        padding: 0 20px;
        border-radius: 10px;  
        list-style: none;
        position: relative;
        display: inline-table;
        }
        nav ul:after {
        content: ""; clear: both; display: block;
        }
        nav ul li {
        float: left;
        }
        nav ul li:hover {
        background: #4b545f;
        background: linear-gradient(top, #4f5964 0%, #5f6975 40%);
        background: -moz-linear-gradient(top, #4f5964 0%, #5f6975 40%);
        background: -webkit-linear-gradient(top, #4f5964 0%,#5f6975 40%);
        }
        nav li a {
        display: block; padding: 15px 30px;
        color: black; text-decoration: none;
        }
        nav ul ul {
        background: #5f6975; border-radius: 0px; padding: 0px;
        position: absolute; top: 100%;
        }
        nav ul ul li {
        float: none; 
        border-top: 1px solid #6b727c;
        border-bottom: 1px solid #575f6a; position: relative;
        }
        nav ul ul li a {
        padding: 15px 30px;
        color: #fff;
        }	
        nav ul ul li a:hover {
        background: #4b545f;
        }
        nav ul ul ul {
        position: absolute; left: 100%; top:0;
        }
        article {
        font-family: "Open Sans", sans-serif;
        max-width: 800px;
        padding: 20px;
        margin: 0 auto;
        }
        @media (max-width: 500px) {
        h1 {
        font-size: 36px;
        padding: 5px;
        }
        li {
        padding: 5px;
        display: block;
        }
        }
        #logo {
        background: #efefef; 
        border-radius: 10px;
        background: linear-gradient(top, #efefef 0%, #bbbbbb 100%); 
        background: -moz-linear-gradient(top, #efefef 0%, #bbbbbb 100%); 
        background: -webkit-linear-gradient(top, #efefef 0%,#bbbbbb 100%); 
        box-shadow: 0px 0px 10px rgba(0,0,0,0.3);
        padding: 20px 20px; 
        margin: 30px 0px -15px 0px;
        }
        #titletext {
        padding: 40px 0px 0px 0px;
        }
        </style>
        </head>
        <body>
        <header>
        <div id="logo_space">
         <img id="logo" src="deltac_logo_small.png">
        </div>
        <nav id="navigation bar">
        <ul>
        <li><a href="http://statmos.uw.edu/shiny/deltaC_home">Home</a></li>
        <li><a href="#">Modules</a>
        <ul>
        <li><a href="http://statmos.uw.edu/shiny/mod1_home">When is a trend actually trending?</a></li>
        </ul>
        </li>
        <li><a href="#">Links</a>
        <ul>
        <li><a href="http://statmos.uw.edu">Statmos Home</a></li>
        <li><a href="http://uw.edu">University of Washington</a></li>
        <li><a href="http://statmos.uw.edu/shiny/deltaC_resources">Other Curriculum Resources</a></li>
        </ul>
        </li>
        <li><a href="http://statmos.uw.edu/shiny/deltaC_about">About Us</a></li>
        </ul>
        </nav>
        </header>
        <div id="titletext">
          <h2>Module 1: When is a trend actually trending?</h2>
          <h3>Autocorrelation in Regression</h3>
        </div>'
    ),
    windowTitle="deltaC Module #1: When is a trend actually trending?"
  ),
    
  # Sidebar with a slider input for number of observations
  sidebarPanel(
      #Help text
      helpText("Explore different methods for dealing with temporal autocorrelation. Choose a dataset to get started."),
      
      #Select dataset
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("Google ngrams","WB climate"),
                  selected = "WB climate"),
      #Search Term
      htmlOutput("selectUI"),
      
      #Link to details about data source.
      htmlOutput("selectLink"),

      # Specification of range within an interval
      numericInput("start","From Year:",value=1950),
      numericInput("end","To Year:",value=2010),
      
      # Add a blank space.
      HTML("<br>"),
      
      # Draws the download button
      downloadButton('downloadData', 'Download Data (.csv)'),
      
      # Options to display trend and diagnostic plots.
      checkboxInput("trend","Show Linear Trend",value=F),
      checkboxInput("diag","Show Diagnostic Plots",value=F),
      checkboxInput("mod","Show Model Output",value=F),
      
      # Displays model output in sidebar
      conditionalPanel(condition="input.conditionedPanels=='OLS'",
                       tableOutput("ols_modTable")),
      conditionalPanel(condition="input.conditionedPanels=='Subsampling'",
                       tableOutput("sub_modTable")),
      conditionalPanel(condition="input.conditionedPanels=='Lagging'",
                       tableOutput("lag_modTable")),
      conditionalPanel(condition="input.conditionedPanels=='GLS'",
                       tableOutput("gls_modTable")),
    
    # Displays options for subsampling.
    conditionalPanel(condition="input.conditionedPanels=='Subsampling'",
                     wellPanel(
                       helpText("Subsampling Options:"),
                       sliderInput("sub","Subsampling Interval (Years)",
                                   min=0,
                                   max=5,
                                   value=1))
                     ),
    conditionalPanel(condition="input.conditionedPanels=='Lagging'",
                     wellPanel(
                       helpText("Lagging Options:"),
                       sliderInput("lag","Interval of Lag (Years)",
                                   min=1,
                                   max=5,
                                   value=1))
                    ),
   conditionalPanel(condition="input.conditionedPanels=='GLS'",
                    wellPanel(
                      helpText("GLS Options:"),
                      sliderInput("ar_order","Auto-Regressive Order",
                                  min=1,
                                  max=5,
                                  value=1))
                    )
  ),
  
  # Draw plots of the generated timeseries.
  mainPanel(
    tabsetPanel(id = "conditionedPanels",
      tabPanel("OLS",    
               plotOutput("ols_timePlot",height=300),
               plotOutput("ols_diagPlot",height=300)),
      tabPanel("Subsampling",
               plotOutput("sub_timePlot",height=300),
               plotOutput("sub_diagPlot",height=300)),
      tabPanel("Lagging",
               plotOutput("lag_timePlot",height=300),
               plotOutput("lag_diagPlot",height=300)),
      tabPanel("GLS",
               plotOutput("gls_timePlot",height=300),
               plotOutput("gls_diagPlot",height=300)),
      HTML("<a rel='license' href='http://creativecommons.org/licenses/by/4.0/'><img alt='Creative Commons License' style='border-width:0' src='http://i.creativecommons.org/l/by/4.0/88x31.png' /></a><br /><span xmlns:dct='http://purl.org/dc/terms/' href='http://purl.org/dc/dcmitype/InteractiveResource' property='dct:title' rel='dct:type'>deltaC curriculum material</span> by <span xmlns:cc='http://creativecommons.org/ns#' property='cc:attributionName'>STATMOS</span> is licensed under a <a rel='license' href='http://creativecommons.org/licenses/by/4.0/'>Creative Commons Attribution 4.0 International License</a>.")
    )
  )
))