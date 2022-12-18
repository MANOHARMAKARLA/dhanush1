<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

<div class="row" align="right">
    <a href="<%=home%>"><button class="mu-reg-submit-btn">HOME</button></a>
</div>
<a href="#" onclick="printform()"><b><font color="red">Print</font></b></a>
<html>
    <head>
    </head>
    <body>
        <div id="prnt">
            <table align="center">
                <tr>
                    <th colspan="3" align="center">
                        <font face="Parisienne" size="4">Dhanekula Institute of Engineering & Technology</font><br>
                        <img src="assets/images/dietlogo2.png" width='20%'>
                    </th>
                </tr>
            </table>
<%
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    
    String id=request.getParameter("id");
    String timestamp=request.getParameter("timestamp");
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
            res=st.executeQuery("select * from dhanush.registerevents re, dhanush.dhanush_id did where re.id=did.id and re.id="+id+" and re.timestamp='"+timestamp+"'");
            if(res.next())
            {
            %>
                <table align="center">
                    <tr>
                        <td><b>Id</b></td>
                        <td>:</td>
                        <td><b><%=res.getString("id")%></b></td>
                    </tr>
                    <tr>
                        <td><b>Name</b></td>
                        <td>:</td>
                        <td><%=res.getString("name")%></td>
                    </tr>
                    <tr>
                        <td><b>Roll No</b></td>
                        <td>:</td>
                        <td><%=res.getString("rollno")%></td>
                    </tr>
                    <tr>
                        <td><b>Mobile No</b></td>
                        <td>:</td>
                        <td><%=res.getString("phno")%></td>
                    </tr>
                    <tr>
                        <td><b>Mail Id</b></td>
                        <td>:</td>
                        <td><%=res.getString("mail")%></td>
                    </tr>
                    <tr>
                        <td><b>College</b></td>
                        <td>:</td>
                        <td><%=res.getString("college")%></td>
                    </tr>
                </table>
                <br>
                <table align="center" style='border-collapse: collapse' border="1">
                    <tr>
                        <td colspan="3" align="center"><b>List of events registered</b></td>
                    </tr>
                    <tr>
                        <th align="center">S.No</th>
                        <th align="left">Event Name</th>
                        <th width='40%'>Remarks</th>
                    </tr>
                    <%
                    }
                        int i=1;
                        do
                        {
                            %>
                            <tr>
                                <td align="center"><%=i %></td>
                                <td><%=res.getString("event")%></td>
                                <td>&nbsp;</td>
                            </tr>
                            <%
                                i++;
                        }while(res.next());
                    %>           
                </table>
                <p align="center">
                    Total amount to be paid : <b><%=(i-1)*50 %>/-</b>
                </p>
                <p align="right">
                    Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
            </div>    
            <%

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
%>
        <center>
            <a href="displayevents.jsp">Back</a>
        </center>
    </body>
</html>
<script>
    function printform()
    {
            var tables=document.getElementsByTagName('table');
        for(i=0;i<tables.length;i++)
        {
           tables[i].setAttribute("style","border-collapse:collapse;") ;
        }
        var prntcon=document.getElementById('prnt');
        var printwind=window.open('','PrintForm','width=100%,height=100%');
        printwind.document.write(prntcon.innerHTML);
        printwind.document.close();
        printwind.focus();
        printwind.print();
        printwind.close();
    }
</script>