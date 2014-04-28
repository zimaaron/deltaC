library(shiny)
  
  # Define UI for application that plots google searches for cats over time.
  shinyUI(fluidPage(
    
    # Application title
    headerPanel(
      HTML(
        '<!DOCTYPE html>
        <head>
        <link href="/normalize.css" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
        <script type="text/javascript",src="reveal.js"></script>
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
        <li><a href="#">Home</a></li>
        <li><a href="#">Modules</a>
        <ul>
        <li><a href="#">When is a trend actually trending?</a></li>
        <li><a href="#">World records revisited</a></li>
        <li><a href="#">The median is not the message</a></li>
        </ul>
        </li>
        <li><a href="#">Links</a>
        <ul>
        <li><a href="#">Statmos Home</a></li>
        <li><a href="#">University of Washington</a></li>
        </ul>
        </li>
        <li><a href="#">About Us</a></li>
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
  
  # Sidebar with navigation options
  navlistPanel(
    "Exercises",
    tabPanel("Module Home",
             h3("Module Background"),
             p("Trends are all around us, and detecting trends over time is often the first step in responding to our surroundings in school, business, or life. We live in a world that is always changing, but not all of the changes we see are part of a long-term trend. How do we judge wether a change we see is really a trend? In everyday life, we often make this judgement subjectively.  You might not consider a new band to be trending if you hear a friend talk about it once, for example, but if you hear two different groups of your friends talking about the band in the same week, you might have a different judgement. In many situations these kinds of subjective judgements are fine, but what about trends with more serious consequences for society, like pollution?  "),
             p("Environmental scientists and statisticians have developed quantitative methods for judging whether something is really trending. Judging whether changes in the environment represent long-term trends or just short-term variability is important to recognizing environmental problems and assessing whether they are getting better or worse."),
            p("This set of activities is designed to familiarize you with some of these methods for detecting trends over time. The methods build on the basic statistical method of linear regression, so some familiarity with regression will be helpful.  The exercises are a mix of different kinds of activities, and are designed to take between 45 and 60 minutes to complete. At a minimum, you will need a modern web browser such as Google Chrome or Mozilla Firefox. One of the exercises also requires Microsoft Excel or another spreadsheet program such as LibreOffice Calc that can read Excel files.")
    ),
    "-----",
    ####Code for exercise 1 ####
    tabPanel("Exercise 1",
             h3("How is trend detection used in the environmental sciences?"),
             h4("Background"),
             p("The websites listed below are major sources of information about trends in our environment:"), 
             p(HTML("<a href=http://nsidc.org/data/seaice_index/>•  National Snow and Ice Data Center Trend Mapping.</a>")),
             p(HTML("<a href=http://www.seaaroundus.org/data/>•  The Sea Around Us: Trend monitoring for global fisheries.</a>")),
             p(HTML("<a href=http://www.ecowest.org/ >•  EcoWest.org: Interactive dashboards for keeping track of environmental trends in the American West.  </a>")),
             p(HTML("<a href=http://www.epa.gov/airtrends/index.html>•  Environmental Protection Agency Air Quality Trends for the United States.</a>")),
             h4("Instructions"),
             p("Spend about 15 minutes exploring different visualizations of environmental trends at one of the websites linked above, then answer the questions below based on what you find at the site. After you are finished answering the questions, share what you found with other members of your group or class."),
             h4("Questions"),
             p(em("Which site did you visit?")),
             p(em("What types of trends in our environment are displayed on the site? What properties of the atmosphere, land, or ocean are they tracking?")),
             p(em("Does the site provide any tools to determine if there are changes over time? If so, what are they?")),
             p(em("Find a graph on the site that displays how an environmental measurement changes over time, and include the graph in your answer.")),
             p(em("What do the axes of the graph represent?")),
             p(em("Does there seem to be a trend in the data over time? How can you tell?")),
             
             h4("Downloads"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise1.pdf> PDF</a> or <a href=Exercise1.docx> Microsoft Word </a> format")
    ),
    
    #### Code for exercise 2 ####
    tabPanel("Exercise 2",
             h3("Identifying the measurement, the sample, and the population in time-series data"),
             h4("Background"),
             p("When we want to talk about trends over time in quantitative terms we often want to know if there is a relationship between a given property of a system and time.  We also might want to know the probability of seeing changes at least this large if there is no long-term trend.  We’ve already been exposed to one statistical approach for determining if two variables are related to each other: linear regression.  When we use linear regression to detect trends, we are testing to see if our measurement of interest is significantly related to another variable, the time at which the measurement was taken."),
             p("This use of regression is different from how we have used it so far. Instead of sampling independent units from an underlying population, we are sampling the same attribute of a system at different points in time.  In order to use regression to detect trends over time, we need to adjust what we mean by measurement, sample, and population"),
             HTML('<table border="1" cellspacing="10" cellpadding="10" > 
                  <tbody>
                  <tr>
                  <td align="center" ><p><b>Property</b></p></td>
                  <td align="center" ><p><b>Ordinary Regression</b></p></td>
                  <td align="center" ><p><b>Time-trend Regression</b></p></td>
                  </tr>
                  <tr>
                  <td align="center" ><p>Measurement</p></td>
                  <td align="center" ><p>Two different variables measured for each unit.</p></td>
                  <td align="center" ><p>One variable at different times</p></td>
                  </tr>
                  <tr>
                  <td align="center" ><p>Sample</p></td>
                  <td align="center" ><p>A collection of units randomly chosen from a population.</p></td>
                  <td align="center" ><p>Section of time chosen at random</p></td>
                  </tr>
                  <tr>
                  <td align="center" ><p>Population</p></td>
                  <td align="center" ><p>A very large collection of units, each with an equal probability of being sampled.</p></td>
                  <td align="center" ><p>A very long series of measurements extending far into the past and future</p></td>
                  </tr>
                  </tbody>
                  </table>'),
             h4("Instructions"),
             p("Below are examples of situations in which you might use linear regression to make inference about whether trends over time are statistically significant. For each example, identify the measurement, the sample, and the population."),
             h4("Questions"),
             HTML('<p><em>1. The National Aeronautics and Space Administration uses satellites to monitor the extent of sea ice in the Arctic. Every month, the satellite measurements are processed to estimate the total area covered by sea ice over that month.  Below is a graph of the average extent of sea ice during the month of January in the Arctic from 1990 to 2012 (data from <a href=http://nsidc.org/data/nsidc-0079>here</a>)</em></p>'),
             img(src='nsidc_picture.jpg'),
             img(src='nsidc_graph.jpg'),
             HTML('<p><em>2. The National Interagency Fire Center (<a href="http://www.nifc.gov/">http://www.nifc.gov/</a>) collects reports from federal and state agencies on the total area burned by wildfire across the United States in a given year. The graph below shows the estimated total area burned by wildfire in the USA from 1987 to 2012.</em></p>'),
             img(src='wildfire_picture.jpg'),
             img(src='wildfire_graph.jpg'),
             HTML('<p><em>3. Researchers with the Hawaii Ocean Time-series (HOT) program (<a href="http://hahana.soest.hawaii.edu/hot/">http://hahana.soest.hawaii.edu/hot/</a>) have been making observations of the chemistry of seawater at a location north of Oahu, Hawaii since October 1988. Measurements are taken 5 - 15 times per year at this location, and a normalized pH value (a measure of the acidity of the water) is calculated for each measurement shown below..</em></p>'),
             img(src='hawaii_picture.jpg'),
             img(src='hawaii_graph.jpg'),
             h4("Downloads"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise2.pdf> PDF</a> or <a href=Exercise2.docx> Microsoft Word </a> format")
    ),
    
    ####Code for exercise 3 ####
    tabPanel("Exercise 3",
             h3("Recognizing autocorrelation in time-series"),
             h4("Background"),
             HTML('<p>When we want to see if a particular thing (Youtube hits for Ryan Gosling, papers published on climate change) is related to time using regression we have to be careful of a lurking factor that messes with our ability to detect trends. The lurking problem is called <a href=http://en.wikipedia.org/wiki/Autocorrelation>autocorrelation.</a></p>'),
             HTML('<p>Autocorrelation is the tendency of the next state of any system to depend on previous states. It shows up almost anywhere that you look for it, including in the values of stocks, the rate of unemployment, the area of sea ice, or the global temperature.</p>'),
             HTML('<p>When we do linear regression in most cases, we don’t have to worry about memory because we are sampling a different unit for each observation. Trends over time are different: we are tracking a single property of a system at different points in time, so we usually expect that the past will influence the future, even if there is no long-term trend.</p>'),
             h4("Instructions"),
             HTML('<p>Below are five graphs of time-series data with the same average trend (dotted line) but different levels of autocorrelation.  Three of the trends have strong autocorrelation, but two do not. Identify which of the trends are strongly autocorrelated, then answer the questions below.</p>'),
             img(src='ex3_autocorr.jpg'),
             h4('Questions'),
             HTML('<p><em>1. For the time-series that you identified as autocorrelated, why did you choose the ones you did?</em></p>'),
             HTML('<p><em>2. Which of the trends show strong autocorrelation?</em></p>'),
             h4("Downloads"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise3.pdf> PDF</a> or <a href=Exercise3.docx> Microsoft Word </a> format")
    ),
    tabPanel("Exercise 4",
             h3("This is the third panel"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise4.pdf> PDF</a> or <a href=Exercise4.docx> Microsoft Word </a> format")
    ),
    tabPanel("Exercise 5",
             h3("This is the third panel"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise5.pdf> PDF</a> or <a href=Exercise5.docx> Microsoft Word </a> format")
    ),
    tabPanel("Exercise 6",
             h3("This is the third panel"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise6.pdf> PDF</a> or <a href=Exercise6.docx> Microsoft Word </a> format")
    ),
    tabPanel("Exercise 7",
             h3("This is the third panel"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise7.pdf> PDF</a> or <a href=Exercise7.docx> Microsoft Word </a> format")
    ),
    tabPanel("Exercise 8",
             h3("This is the third panel"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise8.pdf> PDF</a> or <a href=Exercise8.docx> Microsoft Word </a> format")
    ),
    tabPanel("Exercise 9",
             h3("This is the third panel"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise9.pdf> PDF</a> or <a href=Exercise9.docx> Microsoft Word </a> format")
    )),
  
  # Show a plot of the generated distribution
  mainPanel(
    HTML("<a rel='license' href='http://creativecommons.org/licenses/by/4.0/'><img alt='Creative Commons License' style='border-width:0' src='http://i.creativecommons.org/l/by/4.0/88x31.png' /></a><br /><span xmlns:dct='http://purl.org/dc/terms/' href='http://purl.org/dc/dcmitype/InteractiveResource' property='dct:title' rel='dct:type'>deltaC curriculum material</span> by <span xmlns:cc='http://creativecommons.org/ns#' property='cc:attributionName'>STATMOS</span> is licensed under a <a rel='license' href='http://creativecommons.org/licenses/by/4.0/'>Creative Commons Attribution 4.0 International License</a>.")
  )
))
