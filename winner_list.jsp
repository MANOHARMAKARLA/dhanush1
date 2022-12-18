<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
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
    <body style="background:black;">
        <div class="row" align="right">
            <a href="<%=home%>"><button class="mu-reg-submit-btn">HOME</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
        </div>
		<form action='fetchpart_db.jsp' method="post">
        <div class="row">
            <div class="col-md-4">&nbsp;</div>
            <div class="col-md-4" align="center">
                <select class="form-control" name="event" id="event" required>
                    <option value="">Select Event</option>
                    <%
                        try
                        {
                            String u=uname.toUpperCase();
                            System.out.println(u);
                            Class.forName(driver).newInstance();
                            con = DriverManager.getConnection(url+db, user, pass);

                            try
                            {
                                Statement st = con.createStatement();
                                res = st.executeQuery("select eventname from dhanush.eventlist where branch='"+u+"' or branch='GBI'");
                                System.out.println("select eventname from dhanush.eventlist where branch='"+u+"' or branch='GBI'");
                                %>
                                    <%
                                        while(res.next())
                                        {
                                        %> 
                                            <option value="<%=res.getString("eventname")%>"><%=res.getString("eventname")%></option>  
                                        <%
                                            }
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
        </div><br><br>
                <div id="fetchpart" style="color: white;">
            
            </div>
			</form>
    </body>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    $("#event").change(function(){
        var event=document.getElementById("event").value;
        $.ajax({
           url : "fetchparticipants.jsp",
           data : {event:event},
           method : "POST",
           success : function(data)
           {
               $("#fetchpart").html(data);
           }
        });
        
        
    });
});
</script>
</script>   
</html>