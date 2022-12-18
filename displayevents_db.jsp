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
    <style>
        a{
            color:green;
            font-family: Montserrat;
            font-size:1.0em;
        }
    </style>
    <body style="background-color:black;">
        <div class="row" align="right">
            <a href="<%=home%>"><button class="mu-reg-submit-btn">HOME</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
        </div>
        <%
            String id1=request.getParameter("id");
            int id=Integer.parseInt(id1);
            Connection con = null;
            String url    =  "jdbc:mysql://localhost:3306/";
            String db     =  "dhanush";
            String driver =  "com.mysql.jdbc.Driver";
            String user   =  "root";
            String pass = "root";
            try
            {
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url+db, user, pass);

            try
            {
                Statement st = con.createStatement();

                ResultSet res = st.executeQuery("select * from dhanush.registerevents where id="+id);
                %>
                <br><br>
                <div align="center">
                    <h2 class="mu-title" style="color:white;font-size:30px;">Welcome to <font face="Rock Salt" size="6" color="#ff56d4"> Dhanush 2K22</font></h2>
                    <h2 class="mu-title" style="color:white;font-size:30px;">Events of a student</h2><br><br>
                    <h2 class="mu-title" style="color:white;font-size:30px;">Student ID : &nbsp;&nbsp;&nbsp;&nbsp; <%=id%></h2>
                </div><br>
                <div style="color:white;">
                    <div class="row" style="font-family:Satisfy;font-size:1.5em;">
                        <div class="col-md-1">&nbsp;</div>
                        <div class="col-md-1">S.No</div>
                        <div class="col-md-2">Event Name</div>
                        <div class="col-md-2">Time of Registration</div>
                        <div class="col-md-2">User ID Registered<br>the Event</div>
                        <div class="col-md-1">Delete</div>
                        <div class="col-md-1">Reprint</div>
                    </div><br>
                    <%
                        int i=1;
                        while(res.next())
                        {
                            %>
                            <div class="row" >
                                <div class="col-md-1">&nbsp;</div>
                                <div class="col-md-1"><%=i%></div>
                                <div class="col-md-2"><%=res.getString("event")%></div>
                                <div class="col-md-2"><%=res.getString("timestamp")%></div>
                                <div class="col-md-2"><%=res.getString("cashier")%></div>
                                <div class="col-md-1"><a href="deleteevent_db.jsp?id=<%=id%>&eventname=<%=res.getString("event")%>&timestamp=<%=res.getString("timestamp")%>">Remove</a></div>
                                <div class="col-md-1"><a href="reprint_db.jsp?id=<%=id%>&timestamp=<%=res.getString("timestamp")%>">Reprint</a></div>
                            </div>
                            <%
                             i++;
                        }
                        int noofevents=i-1;
                    %>
                    <br><br><div class="row">
                        <div class="col-md-8" align="center">Total amount paid by the student</div>
                        <div class="col-md-2">Rs.<%=noofevents*50%> /-</div>
                    </div>
                </div><br><br>
                
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
            finally
            {
                con.close();
            }   
        %>
    </body>
</html>
