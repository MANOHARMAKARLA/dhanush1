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
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
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
                            <h2 class="mu-title">Amount Collection</h2>
                        </div>
                        <form action="fetch_cash.jsp" method="post">
                        <div class="mu-register-content">
                            <div class="row">
                                <div class="col-md-3">&nbsp;</div>
                                <div class="col-md-6">
                                    <select class="form-control" name="cashier" id="cashier">
                                                        <option value="">Select Cashier</option>
                                                        <%
                                                            try
                                                            {
                                                            Class.forName(driver).newInstance();
                                                            con = DriverManager.getConnection(url+db, user, pass);

                                                            try
                                                            {
                                                                Statement st = con.createStatement();
                                                                ResultSet res = st.executeQuery("select distinct cashier from dhanush.registerevents");
                                                                %>
                                                                    <%
                                                                        while(res.next())
                                                                        {
                                                                        %> 
                                                                            <option value="<%=res.getString("cashier")%>"><%=res.getString("cashier")%></option>  
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
                                </div><br>
                                <div class="col-md-3">&nbsp;</div>
                            </div>

                            <button type="submit" class="mu-reg-submit-btn">SUBMIT</button>
                        </div>
                        </form>        
                    </div>
                </div>
            </div>
        </div>
    </section>    
</body>
</html>