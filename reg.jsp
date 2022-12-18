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
					<form class="mu-register-form" action="generated1.jsp">
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
                                                            <option value="ECE">ELECTRONICS & COMMUNICATIONS ENGINEERING</option>
                                                            <option value="CSE">COMPUTER SCIENCE & ENGINEERING (AI & ML)</option>
                                                            <option value="IT">INFORMATION TECHNOLOGY</option>
                                                            <option value="EIE">ELECTRONICS & INSTRUMENTATION ENGINEERING</option>
                                                            <option value="ECS">ELECTRONICS CONTROL SYSTEMS ENGINEERING</option>
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
                                      
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
		</section>
                                                        
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dhanush 2K22</title>
    <!--<link href="https://fonts.googleapis.com/css?family=Allura|Rock+Salt|Leckerli+One" rel="stylesheet">-->
    <link rel="shortcut icon" type="image/icon" href="assets/images/logo.ico"/>
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/slick.css" rel="stylesheet">
    <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700,800" rel="stylesheet">-->
    <!--<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">-->
</head>
<body style="background:black;">
        
        <section id="mu-register">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="mu-register-area">
                        <div class="mu-title-area">
                            <h2 class="mu-title">Welcome to <font face="Rock Salt" size="5" color="#ff56d4"> Dhanush 2K22</font></h2>
                            <h2 class="mu-title">Registration for Events here</h2>
                        </div>
                        <div class="mu-register-content">
                                <div class="row">
                                    <div class="col-md-3">&nbsp;</div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" placeholder="Enter your ID" id="id" name="rollno" required="">
                                    </div>
                                    <div class="col-md-3">&nbsp;</div>
                                </div>
                                <button type="submit" id="submit_1" class="mu-reg-submit-btn">SUBMIT</button>
                                
                        </div>
                        <div class="mu-register-area" >
                            <form action="registerevents_db.jsp" id="fetchedevents">

                            </form>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </section>    
</body>
<script src="assets/js/jquery.min.js"></script>
<script>
    $(document).ready(function(){
    $("#submit_1").click(function(){
        var id=document.getElementById("id").value;
        $.ajax({
           url : "fetchevents.jsp",
           data : {id:id},
           method : "POST",
           success : function(data)
           {
               $("#fetchedevents").html(data);
           }
        });
        
        
    });
});
</script>
</script>    
</html>

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