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
        #center_pic {
        display: block;
        padding: 20px 20px 20px 20px;
        margin-left:auto;
        margin-right:auto;
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
        <li><a href="http://statmos.uw.edu/shiny/deltaC_home/">Home</a></li>
        <li><a href="#">Modules</a>
        <ul>
        <li><a href="http://statmos.uw.edu/shiny/mod1_home/">When is a trend actually trending?</a></li>
        </ul>
        </li>
        <li><a href="#">Links</a>
        <ul>
        <li><a href="http://statmos.uw.edu">Statmos Home</a></li>
        <li><a href="http://uw.edu">University of Washington</a></li>
        <li><a href="http://statmos.uw.edu/shiny/deltaC_resources/">Other Curriculum Resources</a></li>
        </ul>
        </li>
        <li><a href=""http://statmos.uw.edu/shiny/deltaC_about/"">About Us</a></li>
        </ul>
        </nav>
        </header>'
    ),
    windowTitle="deltaC: About Us"
  ),  
  mainPanel(width=12,
    HTML("<article>
      <h2>Who is deltaC?</h2>
      <p> The deltaC curriculum materials were developed by <a href=mailto:ibreckhe@uw.edu>Ian Breckheimer</a> and <a href=mailto:peter@stat.washington.edu>Peter Guttorp</a> at the University of Washington in Collaboration with the Seattle Public Schools. The deltaC project is sponsored by the  <a href=http://statmos.uw.edu>STATMOS network</a>, with funding from the National Science Foundation under grant #DMS-1106862.</p>
      <img id='center_pic' src='nsf1.gif' width=100>
      </article>")
  )
))
