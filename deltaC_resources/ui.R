
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

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
      <li><a href="http://statmos.uw.edu/shiny/deltaC_resources">Other Educational Resources</a></li>
      </ul>
      </li>
      <li><a href=""http://statmos.uw.edu/shiny/deltaC_about"">About Us</a></li>
      </ul>
      </nav>
      </header>
      <div id="titletext">
      <h2>Educational Resources on Climate Change</h2>
      </div>'
    ),
    windowTitle="deltaC: additional educational resources?"
  ),  
  
  # Sidebar with navigation options
  navlistPanel(
    tabPanel("Alliance for Climate Education",
             HTML('<p><a href="http://www.acespace.org/"><h3>Alliance for Climate Education (ACE)</h3></a></p>
                  <p><b>Mission</b>: “ACE’s mission is to educate high school students on the science behind climate change and to inspire to learn, organize and take on leadership roles in their schools and communities.”</p>
                  <p><b>Resources for Students (High School)</b>: </p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.acespace.org%2Fget-inspired%2Finformation-station%2Fdropping-science&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHtIo3ZN63h21iBe0uIuARU4L3ccQ">FAQs</a>: general facts about climate change</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.acespace.org%2Ftraining&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNH4KSb7RMkQHEXlTqVsTOSyF4KOug">Leadership Programs</a>: leadership training programs for high school students offered in limited cities; San Francisco, Boston, New York, Los Angles, Atlanta, Washington D.C., and Chicago</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.acespace.org%2Fdot&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGsr4gH6QspCAxEUoNCfdCh7QDD3A">Do One Thing (DOT)</a>: a place for high school students interested in making impact write down one thing they will start doing to help the environment</p>
                  <p><b>Resources for Educators (High School)</b>:</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.acespace.org%2Fteachers%2Fcurricula&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFLkYL5VORmojouZqEpjhB3YS-JlA">Lesson Plans</a>: a wide range of lesson plans that cover climate change topics</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.acespace.org%2Fteachers%2FFAQ&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHsf56AXMoA65KRBvvOt33S1lxX7Q">Teacher FAQs</a>: questions and concerns utilizing resources on website for educators</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.acespace.org%2Fteachers%2Fbook&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHo1lmMRwzTn1EzkKJHHLTuS3uNDA">Book an Assembly</a>: form for booking an assembly by ACE at your school</p>')
    ),
    tabPanel("NASA Climate Change Kids",
             HTML('<p><a href="http://climatekids.nasa.gov/"><h3>NASA Climate Change Kids</h3></a></p>
                   <p><b>Summary</b>: the goal of this website is to aid children in elementary and middle school in understanding relevant topics in climate change and encourage them to do interactive projects</p>
                   <p><b>Resources for Students (Elementary/Middle School</b></p>
                   <p><a href="http://www.google.com/url?q=http%3A%2F%2Fclimate.nasa.gov%2Fkids%2FbigQuestions%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEsgh1GBoMrVgzP5mCfdVLDE_gI6g">FAQs</a>: general facts about climate change</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fclimate.nasa.gov%2Fkids%2Fgames%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEcX1fquAW4nGNEsQLOSx2i8yxFwA">Games &amp; Activities</a>: computer games and at-home activities that facilitate growth in knowledge about Climate Change</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fclimate.nasa.gov%2Fkids%2Fnews%2Findex.cfm%3FFuseAction%3DShowNews%26NewsID%3D11&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEz4OPO0oD3-U5DSB8jOT05AVTniQ">Earth Now</a>: a miniature archive of easy to understand articles that discuss a wide range of climate change topics</p>
                  <p><b>Resources for Educators (Elementary/Middle School)</b>: </p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fclimate.nasa.gov%2Fkids%2FeducatorResources%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEKjSuShngCogIMDyJq4TCq52BiTA">Resources</a>: an archive of websites that contain anything from basic information to lesson planning</p>
')
    ),
    tabPanel("Climate Literacy & Energy Awareness Network (CLEAN)",
             HTML('<p><a href="http://cleanet.org/index.html"><h3>Climate Literacy &amp; Energy Awareness Network (CLEAN)</h3></a></p>
                   <p><b>Mission</b>: “The CLEAN project, a part of the National Science Digital Library, provides a reviewed collection of resources coupled with the tools to enable an online community to share and discuss teaching about climate and energy science.”</p>
                   <p><b>Resources for Educators (all ages)</b>:</p>
                   <p><a href="http://www.google.com/url?q=http%3A%2F%2Fcleanet.org%2Fclean%2Fliteracy%2Fconcept_maps.html&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFygmHJ9J3IpSsbMrzMvUYILJ3uYA">Maps of Climate and Energy Concepts</a>: a general outline of what to topics to teach students based on age</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fcleanet.org%2Fclean%2Fliteracy%2Findex.html&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFhXKhbt_lfOzXDE4rxo5j5ZWcy7g">Guide to Climate &amp; Energy Literacy</a>: a guide that helps to produce efficient educators by listing principles, energy awareness etc.</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fcleanet.org%2Fclean%2Feducational_resources%2Findex.html&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHuyZ4JlWyHcSGsaRubQ4svVv-f6w">Resources</a>: an archive of tools that educators from all backgrounds may access to facilitate their teaching</p>')
    ),
    tabPanel("National Oceanic and Atmospheric Association (NOAA)",
             HTML('<p><a href="http://www.education.noaa.gov/Climate/Climate_Change_Impacts.html"><h3>National Oceanic &amp; Atmospheric Administration (NOAA)</h3></a></p>
<p><b>Mission</b>: “Our primary goal is to provide accurate, relevant information about the science we conduct to help educate the public.</p>
                  <p><b>Resources for Students (all ages)</b>:</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.education.noaa.gov%2FClimate%2FClimate_Change_Impacts.html&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFDxHqC0PBKrFoeeSrdc6Oa-n7kIg">Learning Tools</a>: on the sidebar (located on the left side of the page) there are several lessons, activities, videos as well as more background information to help educate students k-12</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.education.noaa.gov%2FSpecial_Topics%2Fstudentopps.html&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFbM-YGX-Gmz4W01pLbFkLJffGonw">Student Opportunities </a>: scholarships, internships, fellowships and other opportunities for undergraduate and graduate students</p>
                  <p><b>Resources for Educators (all ages)</b>:</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Foceanservice.noaa.gov%2Feducation%2Fpd%2Fclimate%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHtOAGZC_mHmalHNl8KtbGq0UEgEA">Fact Sheets</a>: general facts about climate change</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Foceanservice.noaa.gov%2Feducation%2Fpd%2Fclimate%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHtOAGZC_mHmalHNl8KtbGq0UEgEA">Lesson Plans</a>: a wide range of lesson plans that cover climate change topics</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.education.noaa.gov%2FEducator_Opportunities%2Findex.html%23self&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEZHWtnCeJo8yEwzSgmb9m-H0HLcw">Online Workshops</a>: online workshops and self-directed learning</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.pmel.noaa.gov%2Fco2%2Fstory%2FOA%2BEducational%2BTools&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHZ5Z3y0dc7GkEo7co3DxZd9aYnKw">Ocean Acidification Educational Tools</a>: a collection of visualizations and lectures to facilitate an understanding of ocean acidification for teachers</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.pmel.noaa.gov%2Fco2%2Fstory%2FCarbon%2BEducational%2BTools&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEQnryo7c8akIvPnvaOJGUu5T2-mQ">Carbon Educational Tools</a>: a collection of visualizations and lectures to facilitate an understanding of the Carbon Cycle for teachers</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Foceanservice.noaa.gov%2Feducation%2Fpd%2Fclimate%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHtOAGZC_mHmalHNl8KtbGq0UEgEA">Case Studies</a>: a compilation of various climate change case studies, good for finding relevant hot topics in climate change</p>
                  <p>PowerPoint Presentations: featuring regional climate change impacts on different regions within the United States</p>
                  <p>- <a href="http://www.google.com/url?q=http%3A%2F%2Flearningcenter.nsta.org%2Fproducts%2Fsymposia_seminars%2Ffall09%2FNOAA%2Fwebseminar2.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEIm1eSjMIwmb3JLlDp1qCVsaYgsA"> </a><a href="http://www.google.com/url?q=http%3A%2F%2Flearningcenter.nsta.org%2Fproducts%2Fsymposia_seminars%2Ffall09%2FNOAA%2Fwebseminar2.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEIm1eSjMIwmb3JLlDp1qCVsaYgsA">Eastern United States</a></p>
                  <p>- <a href="http://www.google.com/url?q=http%3A%2F%2Flearningcenter.nsta.org%2Fproducts%2Fsymposia_seminars%2Ffall09%2FNOAA%2Fwebseminar1.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFNOBUG2lSfpkcUWp7dpX2p0UXOXw">Western United States</a></p>')
             ),
    tabPanel("Joint Institute for the Study of the Atmosphere and Ocean (JISAO)",
             HTML('<p><a href="http://jisao.washington.edu/"><h3>Joint Institute for the Study of the Atmosphere and Ocean (JISAO)</h3></a></p>

<p><b>Mission</b>: “…fostering research collaboration between the University of Washington (UW) and the National Oceanic and Atmospheric Administration (NOAA). JISAO research is at the forefront of investigations on climate change, ocean acidification, fisheries assessments, and tsunami forecasting.”</p>                  
                    <p><b>Resources for Students (all ages)</b>: </p>
                    <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.jisao.washington.edu%2Feducation-outreach%2Feducation%2Fk-12%2Fsciencecamp_activities&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGNO3-ku8unyU68inkfXYUxVPW8AQ">Summer Camp Activities</a> : in collaboration with Pacific Marine Environmental Lab (PMEL), these summer camp activities are focused on the chemical and physical aspects of the ocean environment</p>
                    <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.washington.edu%2Fstudents%2Fcrscat%2Fenvst.html%23envir100&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEFu3fePO0Mhphn0lTwonIW-FwzTQ">Undergraduate Courses</a> : read about the course offerings from the Program on the Environment that University of Washington periodically offers</p>
                    <p><b>Resources for Educators (all ages)</b>:</p>
                    <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.cmmap.org%2FscienceEd%2Fteachers.html&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFudoliz3gKrfdNztGpq9uNV0Fm8g">Science Education &amp; Diversity</a>: through the Center for Multiscale Modeling of Atmospheric Processes (CMMAP) – seminars, colloquiums, workshops and conferences to help enhance teaching</p>
                    <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww2.vims.edu%2Fbridge%2Fnoaa%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFARWj9uYwzVKBM5zA0XFiGvc71Hw">Teaching Resources</a>: teacher-approved online resources - through BRIDGE - for learning about the world of water, the sidebar to the top right allows you to search for resources using key words and grade</p>
                    <p>Tours of the Applied Physics Lab (APL): the APL reserves funds to help educate k-12 students by allowing them to explore the variety of project the lab works on. Many of these projects are related to climate change or gathering data that are useful in researching climate change. If you would like to schedule an appointment to tour the lab with or without students email <a href="mailto:odom@apl.washington.edu">Bob Odom</a>. </p>')
             ),
    tabPanel("Climate, Adaptation, Mitigation, E-Learning (CAMEL)",
             HTML('<p><a href="http://www.camelclimatechange.org/"><h3>Climate, Adaptation, Mitigation, E-Learning (CAMEL)</h3></a></p>
<p><b>Summary</b>: “A free, comprehensive, interdisciplinary, multi-media resource for educators. Teach, create and share curricular resources on climate change.”</p>
                  <p><b>Resources for Students (all ages)</b>:</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Fresults%2Fall%2F%3Fgroup%3D7764%26all%3D0%26q%3D%26narrow%3D13186&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEPguX2KtYJCHTB_EXXshDuQ9KAUg">Simulations</a>: a collection of various climate change models, visual learning</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Fresults%2Fall%2F%3Fgroup%3D7764%26all%3D0%26q%3D%26narrow%3D13598&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEWEKZ3HsiZUR4h4l_uFHtDShhoNA">Modules</a>: an archive of self-directed, hands on learning</p> 
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Fresults%2Fall%2F%3Fgroup%3D7764%26all%3D0%26q%3D%26narrow%3D18614&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGSjgYd-t_pAzhnR8skTIl_joO6XQ">Games &amp; Activities</a>: computer games and at-home activities that facilitate growth in knowledge about Climate Change</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Farticles%2Fview%2F170172%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGyVGcMjh6wASVdKHNv1lwb5KmiXA">Resources</a>: an archive of organizations, current research initiatives, scholarships, grant opportunities, graduate programs, career opportunities and training programs</p>
                  <p><b>Resources for Educators (all ages)</b>: </p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Ftopics%2Fview%2F77920%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGsFe5eb2LhlOLZlxtEPIbCIDjIVQ">Topics</a>: an archive of climate change topics</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Fresults%2Fall%2F%3Fgroup%3D7764%26all%3D0%26q%3D%26narrow%3D13600&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEm2T70hhfaezIpnswDgjII8-JZ5g">Lesson Plans</a>: a wide range of lesson plans that cover climate change topics</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Fresults%2Fall%2F%3Fgroup%3D7764%26all%3D0%26q%3D%26narrow%3D13594&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEs6vgoIT1EKZDBHtoxberdr6zeHw">Undergraduate Lab Projects</a>: different lab activities for college students</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Fresults%2Fall%2F%3Fgroup%3D7764%26all%3D0%26q%3D%26narrow%3D13591&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGPJOcnJ6W58OgHJj4LCoqJJcefXw">Assignments</a>: a collection of premade assignments to aid educators</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Fresults%2Fall%2F%3Fgroup%3D7764%26all%3D0%26q%3D%26narrow%3D162&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFNmEe-rZcH9s5UEqdWJdvBWu0fwg">Articles</a> : academic articles on prevalent climate change topics</p>
                  <p><a href="http://www.google.com/url?q=http%3A%2F%2Fwww.camelclimatechange.org%2Fresults%2Fall%2F%3Fgroup%3D7764%26all%3D0%26q%3D%26narrow%3D13595&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGxa0wd6MaL2nvZmXZ3kHa6LJHe5w">PowerPoint Presentations</a>: featuring global climate change impacts</p>')
    )
  ),
  # Show a plot of the generated distribution
  mainPanel(
  )
))
