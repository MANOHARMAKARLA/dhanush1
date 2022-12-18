<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String rollno=request.getParameter("rollno");
    String id="";
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    if(rollno!=null)
    {
        try
        {
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url+db, user, pass);
            try
            {
                con = DriverManager.getConnection(url+db, user, pass);
                Statement st = con.createStatement();
                res=st.executeQuery("select id from dhanush.dhanush_id where rollno='"+rollno+"'");
                if(res.next())
                {
                   id=""+res.getInt("id");
                }
            } 
            catch (SQLException s)
            {
              System.out.println("SQL code does not execute1."+s);
            }

        }
        catch (Exception e)
        {
          e.printStackTrace();
        }
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dhanush 2K22</title>
    <link href="https://fonts.googleapis.com/css?family=Allura|Rock+Salt|Leckerli+One" rel="stylesheet">
    <link rel="shortcut icon" type="image/icon" href="assets/images/logo.ico"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/slick.css" rel="stylesheet">
    <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
</head>
<body>
    <section id="mu-register">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="mu-register-area">
                    <div class="mu-title-area">
                        <h2 class="mu-title">Welcome to <font face="Rock Salt" size="5" color="#ff56d4"> Dhanush 2K22</font></h2>
                        <p>Please note the ID below</p>
                    </div>
                    <div class="mu-register-content">
                        <form action="forgotid.jsp">
                            <div class="row">
                                <div class="col-md-4">&nbsp;</div>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" placeholder="Please enter your ROLL NO" id="rollno" name="rollno" required="">
                                </div>
                                <div class="col-md-4">&nbsp;</div>
                            </div>    
                            <button type="submit" class="mu-reg-submit-btn">SUBMIT</button>
                            <br><br>
                            <p>Your respective ID &nbsp;&nbsp;&nbsp;&nbsp;<font face="Leckerli One" size="7" color="#ff56d4"><%=id%></font></p>
                            <br><br><br>&nbsp;<a href="index.jsp"><font color="white">BACK</font></a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </section>    
</body>
</html>