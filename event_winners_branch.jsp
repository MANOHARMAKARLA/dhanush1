<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.StringTokenizer"%>
   
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
        <style>
            .center{
                margin-top: 300px;
                margin-left: 400px;
                width: 50%;
                border: 5px solid white;
                padding: 30px;
              }
        </style>
    </head>
    <body style="background-color: black;">
            <div class="row" align="right">
                <a href="<%=home%>"><button class="mu-reg-submit-btn">HOME</button></a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
            </div>
            <div class="center">
                <form name="f" action="event_winners_branch_db.jsp" method="post">
                <table style="color:white;border-color: white;" align="center">
                    <tr>
                        <td>Branch</td>
                        <td>:</td>
                        <td>
                                <select name="branch" required>
                                    <option value="">Select Branch</option>
                                    <option value="CIV">CIV</option>
                                    <option value="EEE">EEE</option>
                                    <option value="MEC">MEC</option>
                                    <option value="ECE">ECE</option>
                                    <option value="CSE">CSE</option>
                                    <option value="IT">IT</option>
                                    <option value="CUL">CUL</option>
								</select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center"><button type="submit" id="submit_1" class="mu-reg-submit-btn">SUBMIT</button></td>
                        </tr>
                    </table>    
                </form>
            </div>
                
</body>
</html>