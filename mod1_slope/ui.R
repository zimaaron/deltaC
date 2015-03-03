
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

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
      <li><a href="http://statmos.uw.edu/deltac/deltaC_home/">Home</a></li>
      <li><a href="#">Modules</a>
      <ul>
      <li><a href="http://statmos.uw.edu/deltac/mod1_home/">When is a trend actually trending?</a></li>
      <li><a href="http://statmos.uw.edu/deltac/mod2_home/">When is a spatial data spatially varying?</a></li>
      </ul>
      </li>
      <li><a href="#">Links</a>
      <ul>
      <li><a href="http://statmos.uw.edu">Statmos Home</a></li>
      <li><a href="http://uw.edu">University of Washington</a></li>
      <li><a href="http://statmos.uw.edu/deltac/deltaC_resources/">Other Curriculum Resources</a></li>
      </ul>
      </li>
      <li><a href="http://statmos.uw.edu/deltac/deltaC_about/">About Us</a></li>
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
  
  # Sidebar with instructions
  sidebarPanel(
    h4("This time-series does not have autocorrelation."),
    sliderInput("nomem_center", 
                "Slide or press play to change the regression window", 
                min = 20, 
                max = 134, 
                value = 20,
                step=10,
                animate=animationOptions(interval=600, loop=T)),
    HTML(
      '<br><br><br>'
    ),
    numericInput("window","Width of Regression Window (time steps)",
                 min=4,
                 max=19,
                 value=15),
    HTML(
      '<br><br><br><br><br><br>'
    ),
    h4("This time-series has autocorrelation."),
    sliderInput("mem_center", 
                "Slide or press play to change the regression window", 
                min = 20, 
                max = 134, 
                value = 20,
                step=10,
                animate=animationOptions(interval=600, loop=T))
    ),
  
  # Show a plot of the generated distribution
  mainPanel(
                plotOutput("nomemPlot",height=300),
                plotOutput("memPlot",height=300)
        )
    
  )
)
