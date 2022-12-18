<%
    String uname=session.getAttribute("uname").toString();
    String passcode=session.getAttribute("passcode").toString();
    String type=session.getAttribute("type").toString();
    if(!type.equalsIgnoreCase("reg_desk"))
    {
        response.sendRedirect("logout.jsp");
    }
%>
<!DOCTYPE html>
<html>
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
    </head>
    <body style="background:black;color:white;">
		<div class="row" align="left">
            <a href="change.jsp"><button class="mu-reg-submit-btn">CHANGE PASSWORD</button></a>
        </div>
        <div class="row" align="right">
            <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
        </div>
        <br><br>
        <center><font face="Satisfy" size="8" color="white"><%=uname%></font></center>
        <br><br><br>
        <div class="row">
            <div class="col-md-4">&nbsp;</div>
            <div class="col-md-4" align="center" style="background:#00ff19;line-height:50px;font-size:3em;">
                <font face="Cookie">Navigation Panel</font>
            </div>
            <div class="col-md-4">&nbsp;</div>
        </div><br><br>
        <div class="row">
            <div class="col-md-4">&nbsp;</div>
            <div class="col-md-3" style="line-height:30px;font-size:2em;">
                <font face="Satisfy">Register Events</font>
            </div>
            <div class="col-md-1" style="line-height:30px;font-size:1em;">
                <a href="register1.jsp" style="color:pink;">Click Here</a>
            </div>
            <div class="col-md-4">&nbsp;</div>
        </div><br>
    </body>
</html>