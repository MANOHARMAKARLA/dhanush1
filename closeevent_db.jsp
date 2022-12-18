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
    
    String branch=request.getParameter("branch");
    String event=request.getParameter("eventname");
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    try
    {
      Class.forName(driver).newInstance();
      con = DriverManager.getConnection(url+db, user, pass);
      try
      {
            PreparedStatement pstmt = null;
            pstmt = con.prepareStatement("update dhanush.eventlist set flag=1 where branch="+branch+" and eventname='"+event+"'");
            System.out.println(pstmt);
			pstmt.execute();
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
					<div class="row" align="right">
						<a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
					</div>
					<br><br>
					<center><font face="Satisfy" size="8" color="white"><%=uname%></font></center>
					<br><br><br>
					Branch: <%=branch %> -------> Event: <%=event %>
					<br>
					<br>
			</html>
			<%
            con.close();
      } 
      catch (SQLException ks)
      {
        System.out.println("SQL code does not execute1."+ks);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }	
%>

