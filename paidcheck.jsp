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
    if(!type.equalsIgnoreCase("pay"))
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
        <style>
            .mu-table
            {
                border-collapse:collapse;
                width:90%;
                border:1px solid white;
                font-family: Montserrat;
                font-size:1.2em;
                padding:15px;
                text-align: center;
            }
            .mu-table td,th{
                border:1px solid white;
            }
            .mu-table tr:hover
            {
                background:#5a5d63;
            }
        </style>
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
                <font face="Satisfy">Payment  verification</font>
            </div>
            <div class="col-md-1" style="line-height:30px;font-size:1em;">
                <a href="unverfication.jsp" style="color:pink;">Click Here</a>
            </div>
            <div class="col-md-4">&nbsp;</div>
        </div><br>
    </body>
    <br><br>
        <table class="mu-table" align="center">
            <tr>
                <td bgcolor="#800000" colspan="3"><b>College Wise Registration Count</b></td>
            </tr>
            <tr>
                <td><b>S.No</b></td>
                <td><b>College Name</b></td>
                <td><b>Count of Students</b></td>
            </tr>        
        <%
            Connection con = null;
            String url    =  "jdbc:mysql://localhost:3306/";
            String db     =  "dhanush";
            String driver =  "com.mysql.jdbc.Driver";
            String user   =  "root";
            String pass = "root";
            int i = 1;
            try
            {
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url+db, user, pass);
            try
            {
                Statement st = con.createStatement();
                ResultSet res = st.executeQuery("select college,count(rollno) from dhanush.dhanush_id group by college order by count(rollno) desc");
                
                while(res.next())
                {
                %>
                <tr>
                    <td><%=i %></td>
                    <td align="left"><%=res.getString("college") %></td>
                    <td><%=res.getString("count(rollno)") %></td>
                </tr>
                <%
                    i++;
                }
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
        <tr>
            <td colspan="2" align="center"><font color="red">Total No of Colleges Registered Till Time:</font></td>
            <td align="center"> <font color="red"><b><%=i-1 %></b></font></td>            
        </tr>
        </table>
        
        <br><br>
        
        <table class="mu-table" align="center">
            <tr>
                <td bgcolor="#800000" colspan="3"><b>Branch Wise Registration Count</b></td>
            </tr>
            <tr>
                <td><b>S.No</b></td>
                <td><b>Branch Name</b></td>
                <td><b>Count of Students</b></td>
            </tr>        
        <%
            int sum=0;
            try
            {
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url+db, user, pass);
            try
            {
                Statement st = con.createStatement();
                ResultSet res = st.executeQuery("select branch,count(rollno) from dhanush.dhanush_id group by branch order by count(rollno) desc");
                i=1;
                sum=0;
                while(res.next())
                {
                %>
                <tr>
                    <td><%=i %></td>
                    <td align="left"><%=res.getString("branch") %></td>
                    <td><%=res.getString("count(rollno)") %></td>
                </tr>
                <%
                    sum=sum+Integer.parseInt(res.getString("count(rollno)"));
                    i++;
                }
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
        <tr>
            <td colspan="2" align="center"><font color="red">Total No of Students Registered Till Time:</font></td>
            <td align="center"><font color="red"><b><%=sum %></b></font></td>
            
        </tr>
        </table>
        <br>
        <br>
        
        <table class="mu-table" align="center">
            <tr>
                <td bgcolor="#800000" colspan="4"><b>Login Wise Cash</b></td>
            </tr>
            <tr>
                <td><b>S.No</b></td>
                <td><b>Login</b></td>
                <td><b>Count of events Registered</b></td>
                <td><b>Cash Collected</b></td>
            </tr>        
        <%
            int amount=0;
            int x=0;
            try
            {
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url+db, user, pass);
            try
            {
                Statement st = con.createStatement();
                ResultSet res = st.executeQuery("select cashier,count(event) from dhanush.paymentdone group by cashier order by count(event) desc");
                i=1;
                sum=0;
                while(res.next())
                {
                    x=Integer.parseInt(res.getString("count(event)"));
                %>
                <tr>
                    <td><%=i %></td>
                    <td align="left"><%=res.getString("cashier") %></td>
                    <td><%=x %></td>
                    <td align="right"><%=x*50 %></td>
                </tr>
                <%
					sum=sum+x;
                    amount=amount+(x*50);
                    i++;
                }
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
        <tr>
            <td colspan="2" align="center"><font color="red">Total No of Students Paid The Amount Till Time:</font></td>
            <td align="right"><font color="red"><b><%=sum %></b></font></td>
			<td align="right"><font color="red"><b><%=amount %></b></font></td>
        </tr>
        </table>
        <br>
        <br>
</html>