<%
    String uname=session.getAttribute("uname").toString();
    String passcode=session.getAttribute("passcode").toString();
    String type=session.getAttribute("type").toString();
    if(!type.equalsIgnoreCase("reg_desk")&&!type.equalsIgnoreCase("admin")&&!type.equalsIgnoreCase("reg_admin"))
    {
        response.sendRedirect("logout.jsp");
    }
    String home="";
    if(type.equalsIgnoreCase("reg_desk"))
    {
        home="reg_desk.jsp";                
    }
    if(type.equalsIgnoreCase("reg_admin"))
    {
        home="reg_regadmin.jsp";                
    }
    else if(type.equalsIgnoreCase("admin"))
    {
        home="reg_admin.jsp";
    }
%>
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
    <body style="background-color: black;color:white;">
        <div class="row" align="right">
            <a href="<%=home%>"><button class="mu-reg-submit-btn">HOME</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
        </div>
        <br><br>
        <div>
            <div align="center">
                <h2 class="mu-title" style="color:white;font-size:30px;">Welcome to <font face="Rock Salt" size="6" color="#ff56d4"> Dhanush 2K22</font></h2>
                <h2 class="mu-title" style="color:white;font-size:30px;">Display the events of a student</h2>
            </div><br><br>
            <div class="mu-register-content">
                <form class="mu-register-form" action="displayevents_db.jsp">
                    <div class="row">
                        <div class="col-md-4">&nbsp;</div>
                        <div class="col-md-4">
                            <input id="id" class="form-control" placeholder="Enter Student ID" type="text" name="id">
                        </div>
                        <div class="col-md-4">&nbsp;</div>
                    </div>
                    <button type="submit" class="mu-reg-submit-btn">SUBMIT</button>
                </form>    
            </div> 
        </div>
    </body>
</html>