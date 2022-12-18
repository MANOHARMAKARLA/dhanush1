<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dhanush 2K22</title>
        <!--<link href="https://fonts.googleapis.com/css?family=Allura|Rock+Salt|Parisienne|Cookie|Satisfy" rel="stylesheet">-->
        <link rel="shortcut icon" type="image/icon" href="assets/images/logo.ico"/>
        <link href="assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/slick.css" rel="stylesheet">
        <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <!--<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700,800" rel="stylesheet">-->
        <!--<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">-->
        <script>
    function loadclginput()
    {
        var id = document.getElementById("manualclg");
        id.innerHTML = "<input type='text' placeholder='Enter your college name' required name='clgname_man' class='form-control'/><br>\
        <input style='color:black;'  onclick='unloadcollege()' value='click here if college listed' type='button'/>\n\
        <input type='text' value='1' hidden name='flag'/>";
		var clgdist1 = document.getElementById("clgdist");
		var clgname1 = document.getElementById("clgname");
		clgdist1.removeAttribute("required");
		clgname1.removeAttribute("required");
    }
    function unloadcollege()
    {
        var id = document.getElementById("manualclg");
        id.innerHTML = "";
		var clgdist1 = document.getElementById("clgdist");
		var clgname1 = document.getElementById("clgname");
		clgdist1.setAttribute("required");
		clgname1.setAttribute("required");
    }
</script>
    </head>
    <body>
        <!-- Start Header -->
	<header id="mu-hero" class="" role="banner">
            <!-- Start menu  -->
            <nav class="navbar navbar-fixed-top navbar-default mu-navbar">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Logo -->
                        <a class="navbar-brand" href="index.jsp"><img src="assets/images/dietlogo1.png" width="180px;"/></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav mu-menu navbar-right">
                            <li><a href="#mu-hero">Home</a></li>
                            <li><a href="#mu-about">About Us</a></li>
                            <li><a href="#mu-schedule">Schedule</a></li>
                            <li><a href="#mu-pricing">Price</a></li>
                            <li><a href="#mu-register">Register</a></li>
                            <li><a href="outer_view_winners.jsp">Achievers</a></li>
                            <li><a href="#mu-contact">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End menu -->
            <!--start wrapper-->
            <div class="mu-hero-overlay">
		<div class="container">
                    <div class="mu-hero-area">
                        <!-- Start hero featured area -->
                            <div class="mu-hero-featured-area">
				<!-- Start center Logo -->
				<div class="mu-logo-area">
                                    <h1><font face="Parisienne" color="#a82059">Dhanekula invites you all</font><!-- <b><font face="Allura" color="#060214">Dhanush 2K18</font></b>--></h1>
                                    <!-- text based logo -->
                                    <a class="mu-logo" href="#"><img src="assets/images/dietlogo1.png" width="650px"/></a>
                                    <!-- image based logo -->
                                    <!-- <a class="mu-logo" href="#"><img src="assets/images/logo.jpg" alt="logo img"></a> -->
                                    <br><font face="Cookie" color="#242bf0" size="7.5">21 MAY, 2022</font><br>
                                    <div class="row">
										<h4 align="center" >Sponsored by </h4>
										<img src="./assets/images/sponsored.png" width="200" height="100">
									</div>     
                                    <div class="row">
                                        <div class="col-md-4">
                                            <font face="Satisfy" size="5" color="#f0f024">Cherish the Experience..</font>
                                        </div>
                                        <div class="col-md-4">&nbsp;</div>
                                        <div class="col-md-4">&nbsp;</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">&nbsp;</div>
                                        <div class="col-md-5">
                                            <font face="Satisfy" size="5" color="#f0f024"> Learn & Compete...</font>
                                        </div>
                                        <div class="col-md-4">&nbsp;</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">&nbsp;</div>
                                        <div class="col-md-3">&nbsp;</div>
                                        <div class="col-md-5">
                                           <font face="Satisfy" size="5" color="#f0f024"> A blend of Techno-Cultural events....</font>
                                        </div>
                                    </div>
                                    <div class="mu-hero-featured-content">
                                    <!--<h2>A Two Day National Level Techno Cultural Symposium</h2>-->
                                    
                                     
                                    <div class="mu-event-counter-area" align="left">
                                        <p align="center"><font face="Allura" color="white" size="5"><b>Starts In</b></font></p>
                                            <div id="mu-event-counter">
                                                

                                            </div>
                                    </div>
									<div class="row">
                                        <div class="col-md-3">&nbsp;</div>
                                        <div class="col-md-5">
                                            <br><br>
											<font face="Satisfy" size="5" color="#f0f024">
											<a href='./assets/images/poster.jpg'>Download Poster</a><br>
											<a href='./assets/images/brochure.pdf'>Download Brochure</a><br>
											</font>
                                        </div>
                                        <div class="col-md-4">&nbsp;</div>
                                    </div>
                                </div>
                            </div>
                            <!-- End center Logo -->
                        </div>
                        <!-- End hero featured area -->
                    </div>
                </div>
            </div>
            <!--End Wrapper-->
        </header>
	<!-- End Header -->
	<!-- Start main content -->
	<main role="main">
            <!-- Start About -->
            <section id="mu-about">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mu-about-area">
                                <!-- Start Feature Content -->
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mu-about-left">
                                            <div id="slider">
                                                <figure>
                                                    <img src="assets/images/9.jpg" />&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/5.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/1.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/2.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/3.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/4.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/6.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/7.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/8.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/10.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/11.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/12.jpg"/>&nbsp;&nbsp;&nbsp;
                                                    <img src="assets/images/13.jpg"/>&nbsp;&nbsp;&nbsp;
                                                </figure>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="margin-top:30px;">
                                        <div class="mu-about-right">
                                            <h2>About The Event</h2>
                                            <p align="justify"> Dhanush is a Nonstop Techno Cultural Feast for the students of Engineering to unleash their imagination and power. The national level fest which presents an opportunity for building techno crats to show their skills in Technical & Cultural events. To share expertise and knowledge of the current advancements and to deliberate the problems of the future. To provide better understanding of the recent developments for the benifit of students.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Feature Content -->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End About -->
            <!-- Start Schedule  -->
            <section id="mu-schedule">
                <div class="container">
                    <div class="row">
                        <div class="colo-md-12">
                            <div class="mu-schedule-area">
                                <div class="mu-title-area">
                                    <h2 class="mu-title">Schedule Detail</h2>
                                    <p>The <b><font face="Allura" size="5">Dhanush 2K22</font></b> is going to be held on <b><font face="Allura" size="5">21</font></b> of may, 2022</p>
                                </div>
                                <div class="mu-schedule-content-area">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs mu-schedule-menu" role="tablist">
                                        <li role="presentation" class="active" ><a href="#ce" aria-controls="ce" role="tab" data-toggle="tab">Civil</a></li>
                                        <li role="presentation"><a href="#eee" aria-controls="eee" role="tab" data-toggle="tab">EEE</a></li>
                                        <li role="presentation"><a href="#mech" aria-controls="mech" role="tab" data-toggle="tab">Mech</a></li>
                                        <li role="presentation"><a href="#ece" aria-controls="ece" role="tab" data-toggle="tab">ECE</a></li>
                                        <li role="presentation"><a href="#cse" aria-controls="cse" role="tab" data-toggle="tab">CSE</a></li>
                                       <li role="presentation"><a href="#common" aria-controls="common" role="tab" data-toggle="tab">IT</a></li>
                                        <li role="presentation"><a href="#cultural" aria-controls="cultural" role="tab" data-toggle="tab">Cultural</a></li>
                                       
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content mu-schedule-content">
                                        <div  role="tabpanel" class="tab-pane fade mu-event-timeline in active" id="ce">
                                            <center>email : <b>cedhanush@diet.ac.in</b></center><br>
                                            <ul>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Paper Presentation</h3>
                                                        <span>
                                                             </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Tech Thought</h3>
                                                        <span></span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Theme Ballet</h3>
                                                        <span>
                                                            
                                                        </span>
                                                    </div>
                                                </li>
                                                 <li>
                                                    <div class="mu-single-event">
                                                        <h3>Auto Cad</h3>
                                                        <span>
                                                             </span>
                                                    </div>
                                                </li>
                                                 <li>
                                                    <div class="mu-single-event">
                                                        <h3>Model Making </h3>
                                                        <span>
                                                             </span>
                                                    </div>
                                                </li>
                                                 <li>
                                                    <div class="mu-single-event">
                                                        <h3>Techical Quiz</h3>
                                                        <span>
                                                             </span>
                                                    </div>
                                                </li>
                                            </ul>
                                            <br>
                                            <center>
                                                
                                            </center><br>
                                        </div>
                                        
                                        <div  role="tabpane2" class="tab-pane fade mu-event-timeline" id="eee">
                                            <center>email : <b>eeedhanush@diet.ac.in</b></center><br>
                                            <ul>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Paper Presentation</h3>
                                                        <span>
                                                            ..
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Theme Ballet </h3>
                                                        <span>
                                                            ...
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Best Innovation Idea</h3>
                                                        <span>
                                                            ...
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Tech Trix</h3>
                                                        <span>
                                                            ...
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Techinal Quiz </h3>
                                                        <span>
                                                            ...
                                                        </span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div  role="tabpane3" class="tab-pane fade mu-event-timeline" id="mech">
                                            <center>email : <b>medhanush@diet.ac.in</b></center><br>
                                            <ul>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Paper Presentation</h3>
                                                        <span>
                                                            .
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Theme Ballet</h3>
                                                        <span>
                                                            
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Engine Assembly</h3>
                                                        <span>
                                                            ..
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Techical Quiz</h3>
                                                        <span>
                                                            ...
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Best Bike Design</h3>
                                                        <span>
                                                            
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Model /Scrap Sculpture</h3>
                                                        <span>
                                                          
                                                        </span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div  role="tabpane4" class="tab-pane fade mu-event-timeline" id="ece">
                                            <center>email : <b>ecedhanush@diet.ac.in</b></center><br>
                                            <ul>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Theme Ballet(Poster Presentation)</h3>
                                                        <span>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Tech Trix(Technical Exhibition)</h3>
                                                        <span>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Find Me Know</h3>
                                                        <span>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Montage</h3>
                                                       
                                                    </div>
                                                </li>
                                            </ul><br>
                                            <center>
                                                
                                            </center><br>
                                        </div>
                                        <div  role="tabpane5" class="tab-pane fade mu-event-timeline" id="cse">
                                            <center>email : <b>csedhanush@diet.ac.in</b></center><br>
                                            <ul>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Paper Presentation</h3>
                                                        
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Techinal JAM</h3>
                                                       
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Blind Coding</h3>
                                                        
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Shark Tank</h3>
                                                        
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Techinal Quiz</h3>
                                                        
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        
                                        <div  role="tabpane1" class="tab-pane fade mu-event-timeline" id="common">
                                            <center>email : <b>itdhanush@diet.ac.in</b></center><br>
                                            <ul>                                        
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Quiz</h3>
                                                                                                            </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Poster Presentation</h3>
                                                       
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Paper Presentation </h3>
                                                        </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Debugging</h3>
                                                                                                            </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Language Identification</h3>
                                                           </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div  role="tabpane1" class="tab-pane fade mu-event-timeline" id="cultural">
                                            <center>email : <b>samskruthi@diet.ac.in</b><br>
                                            </center><br>
                                            <ul>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Dance(Solo & Group)</h3>
                                                        <span>
                                                            <b></b><br>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Singing(Solo & Group</h3>
                                                        <span>
                                                            <b></b>  <br>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Theme Logo Painting</h3>
                                                        <span>
                                                            <b></b> <br>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Rapid fire</h3>
                                                        <span>
                                                            <b></b> <br>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Stand up  Comedy</h3>
                                                        <span>
                                                            <b></b>  <br>
                                                        </span>
                                                    </div>
                                                </li>
                                                                                 
                                               
                                                <li>
                                                    <div class="mu-single-event">
                                                        <h3>Spot Photography</h3>
                                                        <span>
                                                            <b></b> <br>
                                                        </span>
                                                    </div>
                                                </li>
                                            </ul><br>
                                            <center>
                                                
                                            </center><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Schedule -->
            <!-- Start Venue -->
            <section id="mu-venue">
                <div class="mu-venue-area">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mu-venue-map">
                                <iframe src="https://maps.google.com/maps?q=dhanekula%20institute%20of%20engineering%20and%20technology&t=&z=15&ie=UTF8&iwloc=&output=embed" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mu-venue-address">
                                <h2>VENUE <i class="fa fa-chevron-right" aria-hidden="true"></i></h2>
                                <h3>Dhanekula Institute of Engineering & Technology</h3>
                                <h4>near Ganguru power office, Ganguru - 521139</h4>
                                <p>Make sure you bring your college ID card before attending to the event.</p>
                            </div>
                        </div>
                    </div>
		</div>
            </section>
            <!-- End Venue -->
            <!-- Start Pricing  -->
            <div align="center">
		<section align="center" id="mu-pricing">
                    <div align="center" class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mu-pricing-area">
                                    <div class="mu-title-area">
                                        <h2 class="mu-title">Pricing & Winning</h2>
                                        <p></p>
                                    </div>
                                    <section align="center">
                                   
                                            <!-- single price item -->
                                            <div align="center" class="col-md-3">
                                                <div class="mu-single-price mu-popular-price">
                                                    <span class="mu-price-tag">Pricing</span><br>
                                                    <div class="mu-single-price-head">
                                                        <span class="mu-currency">Rs</span>
                                                        <span class="mu-rate">150</span>
                                                        <span class="mu-time"> per   6  event</span>
                                                    </div>
                                                    <h3 class="mu-price-title">&nbsp;</h3>
                                                    <p>Entry fee for every event is Rs.150/-.<br> One can participate in 6 number of events.</p>
                                                </div>
                                            </div>
											<div class="col-md-3">
                                                <div align="center"class="mu-single-price mu-popular-price">
                                                    <span class="mu-price-tag">Pricing</span><br>
                                                    <div class="mu-single-price-head">
                                                        <span class="mu-currency">Rs</span>
                                                        <span class="mu-rate">50</span>
                                                        <span class="mu-time"> per event</span>
                                                    </div>
                                                    <h3 class="mu-price-title">&nbsp;</h3>
                                                    <p>Entry fee for every event is Rs.50/-.<br> One can participate in any number of events.</p>
                                                </div>
                                            </div>
                                            <!-- / single price item -->
                                            <!-- single price item -->
                                            <div align="center" class="col-md-3">
                                                <div class="mu-single-price mu-popular-price">
                                                    <span class="mu-price-tag">Winning</span><br>
                                                    <div class="mu-single-price-head">
                                                        <img src="assets/images/about2.png"/>
                                                    </div>
                                                    <h3 class="mu-price-title">&nbsp;</h3>
                                                </div>
                                            </div>
                                            <!-- / single price item -->
                                          
                                        </div>
                                    </div>
                                </div>
                        
                  
                    
                    <div align="center" class="col-md-3">
                                               
                            </div>
                          </div>
            </div>
		</section>
            </div>
		<!-- End Pricing -->
                </section>
                <!-- Start Register  -->
                
		<section id="mu-register">
                    
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mu-register-area">  
                                    <img src="assets/images/Register-Now.gif" width="100" height="100">
                                    <div class="mu-title-area">
                                        <h2 class="mu-title">Registration Form</h2>
                                        <p>Fill the following form for registering into the <font face="Rock Salt" size="5" color="#ff56d4">Dhanush 2K22</font></p>
                                    </div>
                                    
                                     <div class="mu-register-content">
					<form class="mu-register-form" action="genid.jsp">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Your Full Name" id="name" name="name" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"> 
                                                        <input type="email" class="form-control" placeholder="Enter Your Email" id="email" name="email" required>
                                                    </div>     
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">  
                                                        <input type="text" class="form-control" pattern='[6789][0-9]{9}' maxlength="10" placeholder="Your Phone Number" id="telephone" name="phno" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select class="form-control" name="branch" id="ticket" required>
                                                            <option value="">Select Branch</option>
                                                            <option value="CIV">CIVIL ENGINEERING</option>
                                                            <option value="EEE">ELECTRICAL & ELECTRONICS ENGINEERING</option>
                                                            <option value="MEC">MECHANICAL ENGINEERING</option>
                                                            <option value="ECE">ELECTRONICS & COMMUNICATIONS ENGINEERING (ECE,EIE, ECS)</option>
                                                            <option value="CSE">COMPUTER SCIENCE & ENGINEERING (CSE, CSM)</option>
                                                            <option value="IT">INFORMATION TECHNOLOGY</option>
                                                            <option value="CUL">OTHERS</option>
                                                        </select>
                                                    </div>      
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Your Roll No" id="rollno" name="rollno" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select class="form-control" name="clgdist" id="clgdist" required>
                                                            <option value="">Select District</option>
                                                            <%
                                                                try
                                                                {
                                                                Class.forName(driver).newInstance();
                                                                con = DriverManager.getConnection(url+db, user, pass);

                                                                try
                                                                {
                                                                    Statement st = con.createStatement();
                                                                    ResultSet res = st.executeQuery("select distinct district from dhanush.college");
                                                                    %>
                                                                        <%
                                                                            while(res.next())
                                                                            {
                                                                            %> 
                                                                                <option value="<%=res.getString("district")%>"><%=res.getString("district")%></option>  
                                                                            <%}
                                                                        %>
                                                                    </select>
                                                                    <%
                                                                  }
                                                                  catch (SQLException se){
                                                                    System.out.println("SQL code does not execute."+se);

                                                                  }
                                                                }
                                                                catch (Exception e)
                                                                {
                                                                    e.printStackTrace();
                                                                }
                                                            %>
                                                        </select>
                                                        <!--<input type="text"  class="form-control" placeholder="Your College District" id="clgname" name="clgdist" required="">-->
                                                    </div>      
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group" id="clgnameget">
                                                        <select class="form-control" name="clgname" id="clgname" required>
                                                            <option value="">Select College Name</option>
                                                        </select>
                                                    </div>
                                                    <input style="color:black;" type="button" value="click here if your college not listed" onclick="loadclginput()">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group" id="manualclg">
                                                        
                                                    </div>
                                                </div>
                                            </div>  
                                                        
                                             
                                            <button type="submit" class="mu-reg-submit-btn">SUBMIT</button>
                                        </form><br><br>
                                    </div>
                                    <center>
                                        <a href="forgotid.jsp" style="color:white;">Forgot Registration ID?</a><br><br><br>
                                        <a href="login.jsp" style="color:white;">Login</a>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
		</section>
		<!-- End Register -->
                <!-- Start contact -->
		<section id="mu-contact">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mu-schedule-area">
                                    <div class="mu-title-area">
                                        <h2 class="mu-title">Contact Us</h2><br>
                                        <p></p>
                                    </div>
                                    <div class="mu-schedule-content-area">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs mu-schedule-menu" role="tablist">
                                        <li role="presentation" class="active" ><a href="#ce_cu" aria-controls="ce_cu" role="tab" data-toggle="tab">Civil</a></li>
                                        <li role="presentation"><a href="#eee_cu" aria-controls="eee_cu" role="tab" data-toggle="tab">EEE</a></li>
                                        <li role="presentation"><a href="#mec_cu" aria-controls="mec_cu" role="tab" data-toggle="tab">Mech</a></li>
                                        <li role="presentation"><a href="#ece_cu" aria-controls="ece_cu" role="tab" data-toggle="tab">ECE</a></li>
                                        <li role="presentation"><a href="#cse_cu" aria-controls="cse_cu" role="tab" data-toggle="tab">CSE</a></li>
                                        <li role="presentation"><a href="#it_cu" aria-controls="it_cu" role="tab" data-toggle="tab">IT</a></li>
                                        <li role="presentation"><a href="#cultural_cu" aria-controls="cultural_cu" role="tab" data-toggle="tab">Cultural</a></li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content mu-schedule-content">
                                        <div  role="tabpane2" class="tab-pane fade in active" id="ce_cu">
                                            <center>email : <b>cedhanush@diet.ac.in</b></center><br>
                                            <div class="row">
                                                <div class="col-md-4">&nbsp;</div>
                                                <div  class="col-md-4" align="center">
                                                    <div  class="image_staff">
                                                        <img src="assets/images/civil_staff.jpg" height="100px" width="100px"/><br><br>
                                                        <b align="center">Mr.N.Jagadeesh </b><br>
                                                        <b>812574421</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">&nbsp;</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">&nbsp;</div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/civil_stu1.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">B.Pratap Reddy</b><br>
                                                        <b>9000900569</b>
                                                    </div>
                                                </div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/civil_stu2.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">I.Meghana</b><br>
                                                        <b>8977223846</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">&nbsp;</div>
                                            </div>
                                        </div>
                                        <div  role="tabpane2" class="tab-pane fade" id="eee_cu">
                                            <center>email : <b>eeedhanush@diet.ac.in</b></center><br>
                                            <div class="row">
                                                <div class="col-md-4">&nbsp;</div>
                                                <div  class="col-md-4" align="center">
                                                    <div  class="image_staff">
                                                        <img src="assets/images/eee_staff.jpg" height="100px" width="100px"/><br><br>
                                                        <b align="center">Mrs.G. Sree Lakshmi</b><br>
                                                        <b>9702257719</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">&nbsp;</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">&nbsp;</div> 
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_staff">
                                                        <img src="assets/images/eee_stu1.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">P.Santhi Priya</b><br>
                                                        <b>9502257719</b>
                                                    </div>
                                                </div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_staff">
                                                        <img src="assets/images/eee_stu2.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">P.Sainadh</b><br>
                                                        <b>9346618532</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">&nbsp;</div>
                                            </div>
                                        </div>
                                        <div  role="tabpane2" class="tab-pane fade" id="mec_cu">
                                            <center>email : <b>medhanush@diet.ac.in</b></center><br>
                                            <div class="row">
                                                <div class="col-md-4">&nbsp;</div>
                                                <div  class="col-md-4" align="center">
                                                    <div  class="image_staff">
                                                        <img src="assets/images/mec_staff.jpg" height="100px" width="100px"/><br><br>
                                                        <b align="center">Mr.D.BalaNagesh</b><br>
                                                        <b>9989129920</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">&nbsp;</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">&nbsp;</div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/mec_stu1.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">M.SaiSeshu</b><br>
                                                        <b>808894515</b>
                                                    </div>
                                                </div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/mec_stu2.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">V.Sai Aswin Reddy</b><br>
                                                        <b>8309237421</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">&nbsp;</div>
                                            </div>
                                        </div>
                                        <div  role="tabpane2" class="tab-pane fade" id="ece_cu">
                                            <center>email : <b>ecedhanush@diet.ac.in</b></center><br>
                                            <div class="row">
                                                <div class="col-md-4">&nbsp;</div>
                                                <div  class="col-md-4" align="center">
                                                    <div  class="image_staff">
                                                        <img src="assets/images/ece_staff.jpg" height="100px" width="100px"/><br><br>
                                                        <b align="center">Mrs.M.varalakshmamma</b><br>
                                                        <b>9959999636</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">&nbsp;</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">&nbsp;</div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/ece_stu1.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">B.Harshitha</b><br>
                                                        <b>7702642997</b>
                                                    </div>
                                                </div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/ece_stu2.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">k.Kanakaraju</b><br>
                                                        <b>7075797611</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">&nbsp;</div>
                                            </div>
                                        </div>
                                        <div  role="tabpane2" class="tab-pane fade" id="cse_cu">
                                            <center>email : <b>csedhanush@diet.ac.in</b></center><br>
                                            <div class="row">
                                                <div class="col-md-4">&nbsp;</div>
                                                <div  class="col-md-4" align="center">
                                                    <div  class="image_staff">
                                                        <img src="assets/images/cse_staff.jpg" height="100px" width="100px"/><br><br>
                                                        <b align="center">Dr.M.Aruna Safali</b><br>
                                                        <b>8501887997</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">&nbsp;</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">&nbsp;</div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/cse_stu1.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">G.Eeshwak Reddy</b><br>
                                                        <b>7995325452</b>
                                                    </div>
                                                </div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/cse_stu2.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">v.Sri Bhavana</b><br>
                                                        <b>7059549999</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">&nbsp;</div>
                                            </div>
                                        </div>
                                        <div  role="tabpane2" class="tab-pane fade" id="it_cu">
                                            <center>email : <b>itdhanush@diet.ac.in</b></center><br>
                                            <div class="row">
                                                <div class="col-md-4">&nbsp;</div>
                                                <div  class="col-md-4" align="center">
                                                    <div  class="image_staff">
                                                        <img src="assets/images/it_staff.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">Mrs.Rohini</b><br>
                                                        <b>8486947095</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">&nbsp;</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">&nbsp;</div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/it_stu1.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">P.Indhu Sri</b><br>
                                                        <b>7995246409</b>
                                                    </div>
                                                </div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/it_stu2.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">G.Chaitanya</b><br>
                                                        <b>9491648888</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">&nbsp;</div>
                                            </div>
                                        </div>
                                        <div  role="tabpane2" class="tab-pane fade" id="cultural_cu">
                                            <center>email : <b>samskruthi@diet.ac.in</b></center><br>
                                            <div class="row">
                                                <div class="col-md-4">&nbsp;</div>
                                                <div  class="col-md-4" align="center">
                                                    <div  class="image_staff">
                                                        <img src="assets/images/cul_staff.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">Dr.M.Slipa </b><br>
                                                        <b>9441584390</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">&nbsp;</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">&nbsp;</div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/cul_stu1.jpg" height="100px" width="100px"/><br><br>
                                                        <b align="center">T.Guru Charan</b><br>
                                                        <b>7995162550</b>
                                                    </div>
                                                </div>
                                                <div  class="col-md-3" align="center">
                                                    <div  class="image_student">
                                                        <img src="assets/images/cul_stu2.jpeg" height="100px" width="100px"/><br><br>
                                                        <b align="center">K.Sai Sree </b><br>
                                                        <b>8008610961</b>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">&nbsp;</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
		</section>
		<!-- End contact -->

	</main>
                                                         
        <!-- End main content -->
        <!-- Start footer-->
	<footer id="mu-footer" role="contentinfo">
            <div class="container">
                <div class="mu-footer-area">
                    <div class="mu-footer-top">
                        <div class="mu-social-media">
                            <a href="https://www.facebook.com/DhanekulaOfficial"><i class="fa fa-facebook"></i></a>
                            <a href="https://twitter.com/DhanekulaO"><i class="fa fa-twitter"></i></a>
                            <a href="https://www.instagram.com/accounts/login/?next=/dhanekulaofficial/"><i class="fa fa-instagram"></i></a>
                          
                            <a href="https://www.youtube.com/channel/UCVTDVzh3nYFdPFVfhFgkS4g"><i class="fa fa-youtube"></i></a>
                        </div>
                    </div>
                    <div class="mu-footer-bottom">
                        <p class="mu-copy-right">Developed by <a rel="nofollow" href="https://www.facebook.com/mohammedinamullahmdi">Md. Inamullah</a> & <a rel="nofollow" href="https://www.facebook.com/sumanth.suman.90">P. Sumanth</a>,<br>
							Extended by <a rel="nofollow" href="">B. Lakshmi Sowjanya</a>,<a rel="nofollow" href="https://www.instagram.com/guru.charan.tanneeru/"> T. GuruCharan &amp;</a>,<a rel="nofollow" href="https://portifolio.manoharmakarla.com/">  M. N. S. Manohar</a>, <br>under the assistance of <b>Mr. R. Phani Kishore</b></p>
                        <p class="mu-copy-right">&copy; Copyright <a rel="nofollow" href="https://www.diet.ac.in">Dhanekula</a>. All right reserved.</p>
                    </div>
                </div>
            </div>
        </footer>
	<!-- End footer -->
        <!-- JS Files -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/slick.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.countdown.min.js"></script>
	<script type="text/javascript" src="assets/js/custom.js"></script>
    </body>
</html>
<script>
    $(document).ready(function(){
    $("#clgdist").change(function(){
        var clgdist=document.getElementById("clgdist").value;
        $.ajax({
           url : "fetch_college.jsp",
           data : {clgdist:clgdist},
           method : "POST",
           success : function(data)
           {
               $("#clgnameget").html(data);
           }
        });
    });
});
</script>
