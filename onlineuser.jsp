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
        <div class="row" align="right">
            <a href="<%=home%>"><button class="mu-reg-submit-btn">HOME</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
        </div>
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