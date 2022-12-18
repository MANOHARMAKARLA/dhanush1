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
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String cashier=request.getParameter("cashier");
    System.out.println("cashier");
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    double total=0;
    
    String rollno[]=new String[10000];
    int noofstu=0;
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            Statement st = con.createStatement();
            ResultSet res = st.executeQuery("select distinct id from dhanush.registerevents where cashier='"+cashier+"'");
            while(res.next())
            {
                rollno[noofstu+1]=res.getString("id");
                noofstu++;
            }
        }
        catch (SQLException se)
        {
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
<!DOCTYPE html>
<html>
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
    <body style="background:black;color:white;align:center">
        <div class="row" align="right">
            <a href="<%=home%>"><button class="mu-reg-submit-btn">HOME</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
        </div>
        <br><br>
    <center><font face="Open Sans" size="6" color="white">Showing results for the Cashier<br><b><%=cashier%></b></font></center>
        <br>
        <table class="mu-table" align="center">
            <tr>
                <td align="center">S.No</td>
                <td align="center">&nbsp;&nbsp;ID&nbsp;&nbsp;</td>
                <td align="center">Events Participated</td>
                <td align="center">Total Amount</td>
            </tr>
    <%
        for(int i=1;i<=noofstu;i++)
        {
            int j=0;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rollno[i]%></td>
                <td align="left">
            <%
            try
            {
                Class.forName(driver).newInstance();
                con = DriverManager.getConnection(url+db, user, pass);
                try
                {
                    Statement st = con.createStatement();
                    ResultSet res = st.executeQuery("select distinct event from dhanush.registerevents where cashier='"+cashier+"' and id='"+rollno[i]+"'");
                    while(res.next())
                    {
                        %><%=res.getString("event")%>,<%
                        j++;
                    }
                    total=total+(((j/6)*150) + ((j%6)*50));
                }
                catch (SQLException se)
                {
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
                </td>
                <td><%=((j/6)*150) + ((j%6)*50)%></td>
            </tr>
            <%
        }
        
    %>
        <tr>
            <td colspan="3">Overall Total</td>
            <td><%=total%></td>
        </tr>
    </table>
        <br>
        <center>
            <a href="cost_reg.jsp"><button class="mu-register-btn">Go Back</button></a>
        </center>
    </body>
</html>
