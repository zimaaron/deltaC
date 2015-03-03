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
  
  # Sidebar with navigation options
  navlistPanel(
    tabPanel("Module Home",
             h4("Module Background"),
             HTML('<p>Trends are all around us, and detecting trends over time is often the first step in responding to our surroundings in school, business, or life. We live in a world that is always changing, but not all of the changes we see are part of a long-term trend. How do we judge wether a change we see is really a trend? In everyday life, we often make this judgement subjectively.  You might not consider a new band to be trending if you hear a friend talk about it once, for example, but if you hear two different groups of your friends talking about the band in the same week, you might have a different judgement. In many situations these kinds of subjective judgements are fine, but what about trends with more serious consequences for society, like pollution?</p>
                  <p>Environmental scientists and statisticians have developed quantitative methods for judging whether something is really trending. Judging whether changes in the environment represent long-term trends or just short-term variability is important to recognizing environmental problems and assessing whether they are getting better or worse.</p>'),
             h4("Preparation"),
            HTML('This set of activities is designed to familiarize you with some of these methods for detecting trends over time. The methods build on the basic statistical method of linear regression, so some familiarity with regression will be helpful.  The exercises are a mix of different kinds of activities, and each of the nine exercises are designed to take between 45 and 60 minutes to complete. At a minimum, you will need a modern web browser such as Google Chrome or Mozilla Firefox. One of the exercises also requires Microsoft Excel or another spreadsheet program such as the free <a href="https://www.libreoffice.org/download/libreoffice-stable/">LibreOffice Calc</a> that can read Excel files.'),
            h4("Additional Materials"),
            HTML('<p>A zip file with printable versions of the exercises and supporting data can be downloaded <a href="mod1_all.zip"> here </a>.</p>
                 <p>Model responses and rubrics for the questions are available <a href="mod1_answers.zip"> here </a> (password protected).</p>')
    ),
    "-----",
    "Exercises",
    ####Code for exercise 1 ####
    tabPanel("Exercise 1 - How is trend detection used?",
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
             p(em("1. Which site did you visit?")),
             p(em("2. What types of trends in our environment are displayed on the site? What properties of the atmosphere, land, or ocean are they tracking?")),
             p(em("3. Does the site provide any tools to determine if there are changes over time? If so, what are they?")),
             p(em("4. Find a graph on the site that displays how an environmental measurement changes over time, and include the graph in your answer.")),
             p(em("5. What do the axes of the graph represent?")),
             p(em("6. Does there seem to be a trend in the data over time? How can you tell?")),
             
             h4("Downloads"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise1.pdf> PDF</a> or <a href=Exercise1.docx> Microsoft Word </a> format")
    ),
    
    #### Code for exercise 2 ####
    tabPanel("Exercise 2 - What is the sample and population?",
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
    tabPanel("Exercise 3 - Recognizing autocorrelation",
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
    #### Code for exercise 4 ####
    tabPanel("Exercise 4 - Why is autocorrelation a problem?",
             h3("Why is autocorrelation a problem for deciding when a trend is real?"),
             h4('Background'),
             HTML('<p>We often use regression to model the relationship between two variables and do a t-test to determine if that relationship is significant.  That test relies on a key assumption: that the left-over variation in the data (the “residuals”) should all be independent of each other. For measurements of systems over time, there are usually short-term changes that have nothing to do with the long-term trend, and might even be in a different direction than the trend itself. Because the system has autocorrelation, it often takes several time-periods to “recover” from these short-term changes. This introduces additional variation in the regression slope if we examine different time-periods.<p>
</p>'),
             h4("Instructions"),
             HTML('<p>For this exercise, you will be using an interactive web app.</p>  
                    <p>
                    <i class="fa fa-refresh"></i>
                    <a href="http://statmos.uw.edu/deltac/mod1_slope/" target="_blank"><button class="btn btn-primary" type="button"><font color="white">Launch App</font></button></a></p>
                   <p>This app is designed to show the influence of autocorrelation on our estimate of a linear trend over time. The dotted lines represent the slope of a linear regression fit to the observations (white circles) within a certain window of time (gray shading). The top trend does not have strong autocorrelation, but the one plotted below does have autocorrelation. You can control the position of the time-window that is used to fit the regression, as well as the width of the window, using the controls.</p>
                  <p> Spend some time exploring the app, and then use it to answer the questions below.</p>'),
             h4("Questions"),
             HTML('<p><em>1. How does changing the width of the regression window affect how much variation there is in the slopes of the regression lines fit to different windows of time? Why does this occur?</p>
                   <p>2. Set the width of the regression window to the default (15 time-steps), and bring the slider for the top graph back to its original starting position. Record the value of the slope of the regression line on the top graph (printed in the top-right corner of the graph) in the table below. Next, advance the slider by 15 time-steps, and record the new value of the slope, filling in the table below with the new value. Do this for every time-step that you can on both the top graph and the bottom-graph.</p></em>
                  <table border="1" cellspacing="10" cellpadding="10" > 
                  <tbody>
                  <tr>
                  <td align="center" > </td>
                  <td colspan="9" align="center" ><p><b>Center of Time Window</b></p></td>
                  </tr>
                  <tr>
                  <td align="center" ><p><b>Time-Series</b></td>
                  <td align="center" ><p><b>20</b></b></td>
                  <td align="center" ><p><b>30</b></b></td>
                  <td align="center" ><p><b>40</b></b></td>
                  <td align="center" ><p><b>50</b></b></td>
                  <td align="center" ><p><b>60</b></b></td>
                  <td align="center" ><p><b>70</b></b></td>
                  <td align="center" ><p><b>80</b></b></td>
                  <td align="center" ><p><b>90</b></b></td>
                  <td align="center" ><p><b>100</b></b></td>
                  <td align="center" ><p><b>Std. Dev.</b></b></td>
                  </tr>
                  <tr>
                  <td align="center" ><p>Not Autocorrelated</p></td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  </tr>
                  <tr>
                  <td align="center" ><p>Autocorrelated</p></td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  <td align="center" > </td>
                  </tr>
                  </tbody>
                  </table>
                  <p><em>3. Now compute the standard deviation of the group of slope estimates for the two time-series. Which time-series shows more variation in the slope, the one with autocorrelation, or the one without autocorrelation? Why does this occur?</em></p>
                  <p><em>4. Based on this result, how might autocorrelation interfere with our ability to measure long-term trends using linear regression?</em></p>'),
             h4("Downloads"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise4.pdf> PDF</a> or <a href=Exercise4.docx> Microsoft Word </a> format")
    ),
    #### Code for exercise 5 ####
    tabPanel("Exercise 5 - Measuring temporal autocorrelation",
             h3("Measuring temporal autocorrelation using the autocorrelation function (ACF)"),
             h4("Background"),
             HTML('<p>In the last exercise, we explored why temporal autocorrelation can prevent us from effectively using linear regression to judge whether something is trending over time. Recall that what autocorrelation does is give us false-confidence in the value of the slope of the long-term trend over time, but how big a problem is it? </p>
                  <p>To figure this out, we need some measure of the strength of autocorrelation in a given series of measurements. We typically do that by calculating a statistic called the autocorrelation function (ACF). This is a correlation coefficient similar to the Pearson Correlation, which measures the strength of association between two different variables. The key difference here is that instead of two different variables, we are measuring the association between measurements of a system at some time <em>k</em> to measurements of that same system a certain number of observations into the past. The number of measurements backwards-in-time over which we are measuring those differences is called the lag, <em>h</em>.</p>
                  <p>The formula for the autocorrelation function at a given lag, <em>h</em>, is given by:</p>
                  <img src="acf_equation.png" width=800></img>
                  <p>This equation compares measurements at time <em>k</em>, (<em>y<sub>k</sub></em>) and measurements at the previous times (<em>y<sub>k-h</sub>)</em><sub> </sub>to the mean of all observations in the series <img src="y_bar.png" width=20></img>, for all times for which we have measurements. The resulting number varies between -1 and 1. Values close to 1 indicate that observations separated by a lag of time <em>h</em> are very similar to each other (positive autocorrelation), while values near -1 indicate that they are very different (negative autocorrelation).</p>'),
             h4("Instructions"),
             HTML('<p>For this exercise, you will need Microsoft Excel, or another spreadsheet program that can read compatible files, along with the Excel Workbook available here: <p><a href="ocean_acid_autocorr.xlsx"><button class="btn btn-primary" type="button">
                    <i class="fa fa-refresh"></i>
                    <font color="white">Download Workbook</font>
                    </button></a></p>
                    <p>This spreadsheet contains data from <a href="http://www.google.com/trends">Google Trends</a>). Google Trends tracks the frequency of web searches through the Google search engine, and has been used as an index of how many internet-connected users are interested in a particular topic over time. The data we will work with represents the relative number of searches for the phrase “ocean acidification” for each week from January 2013 to January 2014. </p>'),
             HTML('<p>• Open the Excel spreadsheet “ocean_acid_autocorr.xlsx”. The first two columns represent the date and the normalized search volume (our measurement of how popular the term “ocean acidification” was on Google). The next column is the same data but shifted “down” by one cell. This means that every row in the table now has the search volume at a particular week in Column B, and the search volume in the previous week in Column C. </p>
                  <p>• The next two columns are different parts of the equation for the autocorrelation function. Double-click on cell D4 to see the formula in that cell. It is using the formula AVERAGE() to find the mean value for all of the cells in that particular column, and is using that number to come up with the numerator component of the ACF for each time-interval. Cell E4 contains the denominator part of the equation. </p>           
                  <p>• In Columns C and D, drag the fill box to fill in these equations for the blank cells in the rest of the table (hint, highlight cells D4 and E4, then click on the box in the lower-right corner and drag the box down).</p>           
                  <p>• Formulas are already set up to put together the parts of the ACF equation. Cells D56 and D57 sum up the values in Columns D and E (the ) parts, and Cell B57 takes their ratio.</p>    
                  <p>• That’s it! We’ve just calculated the ACF at a lag of one observation, which compares values that were measured consecutively in time.</p>'),
             h4("Questions"),
             HTML('<em><p>Use the spreadsheet to answer the following questions:</p>
                   <p>1. Examine the graph of the time-series at the top of the worksheet. Is there any visual evidence of autocorrelation in the data? If so, what is it?</p>               
                  <p>2. What is the value of the ACF that you calculated? Does this confirm or deny your suspicion about autocorrelation?</p>           
                  <p>3. In this analysis, we calculated the ACF for consecutive observations (a lag of 1). How would you need to modify the spreadsheet in order to calculate the ACF for observations that are separated by two time-steps (a lag of 2)?</p>
                  <p>4. Perform the modifications that you proposed in the previous question. What is the lag 2 autocorrelation? How is it different from the correlation at a lag of one?</p></em>'),
             h4("Downloads"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise5.pdf> PDF</a> or <a href=Exercise5.docx> Microsoft Word </a> format. The data used in this exercise can be downloaded <a href=ocean_acid_autocorr.xlsx>here</a>")
    ),
    #### Code for exercise 6 ####
    tabPanel("Exercise 6 - Plotting the autocorrelation function",
             h3("Plotting the autocorrelation function"),
             h4("Background"),
             HTML('<p>In the last exercise, we explored how to measure the strength of temporal autocorrelation using the autocorrelation function (ACF) and assess whether it might be a problem for making inference about trends over time using linear regression. The calculation of the ACF itself is labor-intensive, so researchers typically employ software to help us assess autocorrelation in the data over many different lags. </p>
                  <p>In this exercise, we will use an interactive web application to examine patterns of autocorrelation in time-series data. You can access the application by clicking the link below: 
                  <p><a href="http://statmos.uw.edu/deltac/mod1_regression/" target="_blank"><button class="btn btn-primary" type="button">
                    <i class="fa fa-refresh"></i>
                    <font color="white">Launch App</font>
                    </button></a></p>
                    <p>This application allows you to search online databases for time-series data, plot the data, apply linear regression, and view diagnostic plots to help see if you can make valid inference using Ordinary Least Squares. If not, it gives you a few alternative strategies for assessing whether something is trending over time. For now, we will focus on interpreting diagnostic plots that help us check whether a regression analysis is valid for time-series data.'),
             h4("Navigating the App"),
             HTML('<p>Here’s a brief field-guide to some of the options in the app:</p>
                  <p><h5>Choose a dataset:</h5></p>
                  <p>These options, and the ones below, allow you to select the data you want to plot and examine. Two types of data are available:</p>
                  <p>• The dataset “WB climate” contains temperature trend data over the past century summarized by country. You can search for a particular country by typing in a three-letter code that corresponds to the country name (you can find the list of codes <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">here</a></p>
                  <p>• The dataset “Google ngrams” contains data on the frequency that words and phrases appear in all of the books indexed by Google Books, currently numbering approximately 6-million. You can search for a particular word or phrase by typing it into the box.</p>
                  <p><h5>From Year and To Year</h5></p>
                  <p>These options control the time-range of the data that is plotted.</p>
                  <p><h5>Show Linear Trend</h5></p>
                  <p>Checking this option will display a best-fit regression line over the data plotted in the right-hand panel.</p>
                  <p><h5>Show Diagnostic Plots</h5></p>
                  <p>The first of the two diagnostic plots show the residual variation in the data that is not “explained” by the regression model. Essentially, these are the differences between the observed data, and the value that would be predicted using the model.</p>
                  <img src=residuals.png width=500></img>
                  <p>Remember that a major assumption of linear regression is that the residuals be independent of each other, normally distributed, and have a constant variance over the range of the data. This plot allows you to assess whether those assumptions are reasonable for the data at hand.</p>
                  <p>The second plot shows the ACF for the model residuals at many different values of the lag. In the last exercise, we calculated the ACF for observations that were adjacent in time. This plot shows that value, along with the values of the ACF at lags greater than 1.</p>
                  <img src=acf.png width=400></img>
                  <p>In this plot, the height of the vertical bars shows the strength of autocorrelation at each lag. Because observations are always perfectly correlated with themselves, the ACF at a lag 0 is always equal to one. ACF values typically decrease as we examine observations separated by larger numbers of observations, like in the plot above. The horizontal dotted lines indicate the maximum amount of autocorrelation that we could expect by chance. If the bars are taller than the dotted line, then it indicates that the residuals are not independent, and we should be suspicious of the results from our regression model. </p>
                  <p><h5>Show Model Output</h5></p>
                  <p>Checking this option will display a standard output from the linear regression model fit to the data.</p>      
'),
             h4("Instructions"),
             HTML('Spend a few minutes exploring the different options that the application gives you, but stick to the tab that is labeled ‘OLS’ for now. After you are familiar with what is going on, answer the questions below:'),
             h4("Questions"),
             HTML('<em><p>1. Refresh the page in your web browser to return to the default options, then check the “Show Linear Trend” and “Show Diagnostic Plots” options. This data shows mean annual temperature in the USA from 1900 to 2010. Does there appear to be an increasing or decreasing trend in temperatures over time?</p>
                  <p>2. Examine the diagnostic plots. Do the residuals from the regression model appear to meet the assumptions that are required for valid inference using linear regression? If not, which assumptions appear to be violated, and how?</p>
                  <p>3. Change the “From Year” field from 1900 to 1960. Examine the diagnostic plots. Do the residuals from the regression model appear to meet the assumptions that are required for valid inference? If not, which assumptions appear to be violated, and how?</p>
                  <p>4. Change the “From Year” field to 1930 and the “To Year” field to 1980. Examine the diagnostic plots. Do the residuals from the regression model appear to meet the assumptions that are required for valid inference? If not, which assumptions appear to be violated, and how?</p>
                  <p>5. How did the trends differ in the two time-periods you examined in questions 3 and 4 (1960-2010 and 1930-1980)?</p>
                  <p>6. How are the trends you examined in Questions 3 and 4 related to potential problems with using linear regression to assess whether there is a long-term trend in temperatures from 1900-2010?</p></em>'),
             h4("Downloads"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise6.pdf> PDF</a> or <a href=Exercise6.docx> Microsoft Word </a> format")
    ),
    #### Code for exercise 7 ####
    tabPanel("Exercise 7 - Subsampling and lagging",
             h3("Making inference about trends using subsampling and lagging"),
             h4("Background"),
             HTML('<p>In the last exercise, we found that, although their appears to be an overall trend towards higher temperatures in the USA during the 20<sup>th</sup> century, the data has some properties that pose problems for assessing whether that trend was significant using linear regression. In particular, it looks like there is temporal autocorrelation in the data, which might give us false confidence that this trend is significant!</p>
                  <p>Luckily, there are a few different ways that we can modify our approach to the problem and make inference about trends even in the presence of autocorrelation. Here are two of them:</p>
                  <p><h5>Approach 1: Subsampling the data</h5></p>
                  <p>The biggest problem with temporal autocorrelation is that it “fools” us into thinking that we have more independent observations of a system than we actually do. Luckily, temporal autocorrelation tends to be strongest between observations that are close together in time, and gets less strong as we examine observations that are spaced farther apart. We can take advantage of this by using only a subset of our observations to make inference about trends. If autocorrelation is only a problem for a lag of 1 (adjacent observations), then we might be able to deal with the problem by including only half of the observations in the regression, ensuring that each observation is separated by two time-intervals, instead of one. If we still have a significant trend after subsampling the data, and the residuals from that model look OK, we can be reasonably confident that there is a long-term trend in the data.</p> 
                  <p><em>Advantages:</em> Simple, easy to understand and communicate.</p>
                  <p><em>Disadvantages:</em> Doesn’t use all of the data.</p>
                  <p><h5>Approach 2: Adding a lag to the model</h5></p>
                  <p>Another way of dealing with autocorrelation is to include values of the response in a previous time as another term in your regression model. Adding a lag changes the regression equation from this:</p>
                  <div align="center"><em> response = intercept + slope * year<sub>t </sub>+ error</em></div>
                  <p>to this:</p>
                  <div align="center"><em>response = intercept + slope<sub>t </sub>* year<sub>t </sub>+ slope<sub>t-h </sub>* year<sub>t-h </sub>+ error</em></div>
                  <p>In this way, we are including the correlation between years directly into our model. </p>
                  <p><em>Advantages: </em>Uses more of the data.</p>
                  <p><em>Disadvantages: </em>The slope associated with year no longer represents the long-term trend. Cannot use observations at the beginning of the series.</p>'),
             h4("Instructions"),
             HTML('<p>In this exercise, we will return to the web app that we used for Exercise 7. You can launch the app in a new tab by clicking the button below.</p>
                  <p><a href="http://statmos.uw.edu/deltac/mod1_regression/" target="_blank"><button class="btn btn-primary" type="button">
                  <i class="fa fa-refresh"></i>
                  <font color="white">Launch App</font>
                  </button></a></p>
                  <p>• In the web app, examine the temperature trend in the USA from 1900 to 2010 by changing the “from Year” and “to Year” fields to 1900 and 2010, respectively. Click all three check-boxes to look at the trend, diagnostic plots, and model outputs for this data. Remind yourself why we can’t trust the standard errors and p-values from the model output using Ordinary Least Squares.</p>
                  <p>• Click on the tab above the trend graph that says “Subsampling”. A new control will appear in the sidebar below that lets you choose how many observations will be between each one that you use in the regression model. Change the sampling interval and watch how it changes the time-trend plot, the diagnostic plots, and the model output.</p>
                  <p>• Click on the tab that says “Lagging”. This will add a lagged value of the response into the regression model. This lagged value now shows up as a blue dotted line on the time-trend plot. The slider control now allows you to change the lag on the new term we’ve added to the regression model. By default, it’s set at a lag of one, meaning that we are using the value in the previous year to predict the value in the current year. Change the value of the lag, and watch how it changes the time-trend plot, the diagnostic plots, and the model output.</p>'),
             h4("Questions"),
             HTML("<em><p>1. What is the minimum value of the subsampling interval that we need in order for the diagnostic plots to indicate we can proceed with making valid inference about trends?</p>
                  <p>2. How does subsampling the data change our estimate of the long-term trend in temperatures in the USA? How does it change our confidence that this trend is significant? </p>
                  <p>3. What’s the minimum value of the lag that we need in order for the residuals to be independent?</p>
                  <p>4. How does adding a lag to the regression model change our confidence in the long-term trend?</p>
                  <p>5. If our goal was to get the most accurate estimate of the long-term trend in temperatures over this time-period, which of the three approaches (OLS, Subsampling, Lagging) would we want to use? Why?</p>
                  <p>6. If our goal was to predict what the mean annual temperature of the USA would be in 2011, which of the three approaches (OLS, Subsampling, Lagging) would we want to use? Why?</p></em>"),
             h4("Downloads"),
             HTML("A printable version of this exercise can be downloaded here in <a href=Exercise7.pdf> PDF</a> or <a href=Exercise7.docx> Microsoft Word </a> format")
    ),
    #### Code for exercise 8 ####
    tabPanel("Exercise 8 - Generalized least-squares",
             h3("Making inference about trends using Generalized Least Squares"),
             h4("Background"),
             HTML('<p>In the last exercise, we used subsampling and adding a lag term to attempt to account for autocorrelation in regression models and allow us to use linear regression to make inferences about trends over time. </p>
                  <p>In a way, those are both indirect ways of dealing with the problem. Remember that temporal autocorrelation is only really a problem for regression if it shows up in the <i>residuals</i><b>, </b>because it violates the assumption that the errors in the model are independent. That’s why we always examine plots of the residuals and compute the autocorrelation function on the residuals, not the raw data. Remember that a linear regression model has the general form:</p>
                  <img src="regression_equation.png"></img>
                  <p>Both of the strategies we used in the last exercise (subsampling and adding a lag) adjust either the response variable Y or the predictor variables (X<sub>s</sub>). The final strategy, and the one that’s used most often in research, is to incorporate temporal autocorrelation directly into the error component of the model, using a technique called <em>generalized least-squares (GLS)</em>. The details of GLS are complicated relative to Ordinary Least-squares, so we will not go into mathematical detail about the nuts and bolts of the method. If you are interested in learning more about what is going on "under the hood" there are a few <a href=http://cran.r-project.org/doc/contrib/Fox-Companion/appendix-timeseries-regression.pdf>good resources</a> out there.</p>
                  <p>Here is a general description of what is going on with GLS.  Remember the autocorrelation function? We computed the ACF in Exercise 5 and plotted it in Exercise 6. The ACF is a measure of how correlated the regression residuals are for observations that are separated by different intervals of time. In many cases, residual variation for observations that are close in time will tend to have values that are more similar to each other than residuals that are separated by large intervals of time. This leads to a situation in which the ACF "decays" as we look over greater values of the <em>lag</em>, or the interval between observations.  In this situation, a plot of the ACF looks similar to this:</p>
                  <img src="acf_ar1.png" width=400></img>
                  <p>The important point here is that there is a predictable relationship between how correlated the residuals are, and how close together they are in time. You can see in the plot above that each sucessive bar is about 80% as tall as the one to the left of it. Because the relationship is pretty regular, we can estimate how quickly the correlation dissapears with increasing intervals of time. The simplest possible relationship between the correlation of residuals and the lag is to assume that the residual at time t is only affected by the residual at time t-1 and the residual at time t-1 is only affected by the residual at t-2 and so on. This relationship is called an AR(1) process because errors are only directly related if they are separated by one interval in time. Alternatively, residuals at time t could be affected directly by both residuals at time t-1 and time t-2, in which case we would call this as AR(2) process. We could continue adding additional terms to our model to represent relationships over greater intervals in time, p, and we call those AR(p) models.</p>   
                  <p>Regardless of the order of the AR process, GLS allows us to estimate those relationships and incorporate them into the error term of the regression model, which is typically done automatically in software.  The only tricky part on our end is choosing what order of AR process we want to fit. Because models of increasing autoregressive order p get more complex, we usually choose the minimal AR order that is adequate to deal with correlation in our data. If the AR model has sucessfully dealt with the error, then the residuals from this GLS model should not have a significant ACF at any lag interval.</p>
                  '),
             h4("Instructions"),
             HTML('<p>We will return to the web app for this exercise. You can launch the app in a new tab by clicking the button below.</p>
                  <p><a href="http://statmos.uw.edu/deltac/mod1_regression/" target="_blank"><button class="btn btn-primary" type="button">
                  <i class="fa fa-refresh"></i>
                    <font color="white">Launch App</font>
                    </button></a></p>
                  <p>• In the app, find data for the temperature trend in Mexico from 1900 to 2010 by entering “MEX” into the Country Code field, and changing the “from Year” and “to Year” fields to 1900 and 2010, respectively.</p>
                  <p>• Click all three check-boxes to look at the trend, diagnostic plots, and model outputs for this data. In particular, remind yourself why we can’t trust the standard errors and p-values from the model output using Ordinary Least Squares.</p>            
                  <p>• Click on the “GLS” tab above the trend graph. This will fit an AR(1) model to the data using Generalized Least Squares. Compare the plot of the residuals, Autocorrelation Function, and model output from the GLS model to the OLS model.</p>
                  <p>• Use these comparisons to answer the questions below.</p>'),
             h4("Questions"),
             HTML('<em><p>1. Click on the “OLS” tab and examine the plot of residual autocorrelation. Does it resemble the pattern you would expect if an AR(<i>p</i>) error structure was appropriate for the data? Why or why not?</p>
                  <p>2. Compare the estimates of temperature trends from the OLS and GLS analyses. How closely do the two estimates correspond?</p>
                  <p>3. Compare the standard errors and p-values for the OLS and GLS estimates of the trend. How do they differ? </p>
                  <p>4. Examine the residuals plot and the ACF plot for the GLS model. Do the residuals from the GLS analysis appear to be correlated? Based on what you see, should you trust statistical inference based on this model?</p> 
                  <p>5. Compare the results of the GLS analysis to the results obtained by subsampling the data and adding a lag. How do the GLS results differ?</p> 
                  <p>6. What does the GLS analysis tell you about temperature trends in Mexico over the past century?</p>     
                  <p>7. Select the “Google ngrams” dataset from the dropdown menu and search for a term that you want to track over time (your choice). Try and find some trend data that would clearly not be appropriate for analysis using OLS. Which search term did you use? What time-interval? </p>      
                  <p>8. Why can’t you use OLS to make valid inference about trends over time using this data? Does using GLS help matters? Why or why not?</p></em>'),
             h4("Downloads"),
             HTML('A printable version of this exercise can be downloaded here in <a href=Exercise8.pdf> PDF</a> or <a href=Exercise8.docx> Microsoft Word </a> format')
    ),
    #### Code for exercise 9 ####
    tabPanel("Exercise 9 - Independent project",
             h3("Independent project"),
             h4("Background"),
             HTML('<p>We now have a few new tools in our data analysis toolkit for detecting trends over time: we can use them to identify situations where we can use Ordinary Least Squares (OLS) to test whether apparent trends are likely to be due to chance. If OLS is clearly not appropriate due to temporal autocorrelation, we have learned about a few different ways of dealing with the issue that still allow us to make inference if apparent trends are real. These tools are important for monitoring our environment. Our atmosphere, lands, and oceans are dynamic and it is often difficult to identify long-term trends when there is lots of short-term variation. Although the appearance of a significant trend over time doesn’t tell you much about what’s driving the trend (that’s a much harder problem), the first step is usually to test whether there is any trend at all.</p>
                  <p>For the directed exercises, we have had you focus on a few different sets of data that are appropriate for demonstrating particular statistical issues. The data sets that are accessible through the web application are much more extensive, incorporating climate data for more than 200 countries and more than a million different search terms in Google Books.</p>'),
             h4('Instructions'),
             HTML('<p>Your assignment is to use these data and the tools provided to test a hypothesis about trends over time. The hypothesis should be framed in a way that you can use the tools provided to test it explicitly using linear regression. An example of a hypothesis like this is below:
                  <div align="center"><strong>"The declining sales of Nintendo-branded game systems will have resulted in the phrase “Nintendo” decreasing in frequency in Google nGrams from 1990 to 2008."</strong></div>
                  <br>
                  <p>•  The main challenge here is to choose an appropriate method to analyze the data, justify your choice, and correctly interpret how the model results relate to your hypothesis.</p>
                  <p>•	Another important point is that where possible, scientists try and form hypotheses before they look at the data, not afterwards. It is easy to come up with a hypothesis to match any particular set of data, but the real challenge in science is to make predictions about the patterns you expect to see before you collect the data. This means that you should think about what hypothesis you want to test before you look at the data, not after.</p>'),
             h4('Questions'),
             HTML('<em><p>1. What hypothesis did you decide to test? Why was this interesting to you?</p>
                  <p>2. Paste-in a graph of your data. </p>
                  <p>3. After you looked at the data, but before fitting any models, did there appear to be a strong trend in the data over time?</p>
                  <p>4. Which analysis method (OLS, Subsampling, Lagging, GLS) did you select for the analysis? What properties of the data caused you to make this choice?</p>
                  <p>5. How do the model results relate to your hypothesis? Do they provide evidence to support or reject it? What is that evidence?</p></em>'),
             h4('Downloads'),
             HTML('A printable version of this exercise can be downloaded here in <a href=Exercise9.pdf> PDF</a> or <a href=Exercise9.docx> Microsoft Word </a> format')
    )),
  
  # Show a plot of the generated distribution
  mainPanel(
    HTML("<a rel='license' href='http://creativecommons.org/licenses/by/4.0/'><img alt='Creative Commons License' style='border-width:0' src='http://i.creativecommons.org/l/by/4.0/88x31.png' /></a><br /><span xmlns:dct='http://purl.org/dc/terms/' href='http://purl.org/dc/dcmitype/InteractiveResource' property='dct:title' rel='dct:type'>deltaC curriculum material</span> by <span xmlns:cc='http://creativecommons.org/ns#' property='cc:attributionName'>STATMOS</span> is licensed under a <a rel='license' href='http://creativecommons.org/licenses/by/4.0/'>Creative Commons Attribution 4.0 International License</a>.")
  )
))
