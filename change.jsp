<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String uname=session.getAttribute("uname").toString();
    String passcode=session.getAttribute("passcode").toString();
%>
<html>
    <head>
        <style>
            .center{
                margin-top: 300px;
                margin-left: 300px;
                width: 50%;
                border: 5px solid white;
                padding: 30px;
              }
        </style>
    </head>
    <body style="background-color: black;">
        <center>
            <div class="center">
                <center>
                    <form name="f" action="change_db.jsp" method="post">
                        <font color="white">
                        <table>
                            <tr>
                                <td style="color: white;">OLD PASSWORD</td>
                                <td>:</td>
                                <td><input type="password" name="oldpass" required></td>
                            </tr>
                            <tr>
                                <td style="color: white;">NEW PASSWORD</td>
                                <td>:</td>
                                <td><input type="password" name="newpass" required></td>
                            </tr>
                            <tr>
                                <td style="color: white;">CONFORM PASSWORD</td>
                                <td>:</td>
                                <td><input type="password" name="conpass" required></td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center"><input type="submit" value="CHANGE PASSWORD"></td>
                            </tr>
                        </table>
                        </font>
                    </form>
                </center>
            </div>
        </center>
    </body>
</html>