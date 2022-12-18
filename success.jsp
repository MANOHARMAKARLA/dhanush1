<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.StringTokenizer"%>
<%
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    
   String id1=request.getParameter("id");
   String name="",mail="",rollno="",mbno="",clg="";
   String arroflist[]=new String[1000];
   int i=1;
   int id=Integer.parseInt(id1);
   int noofevents=0;
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            Statement st = con.createStatement();

            ResultSet res = st.executeQuery("select * from dhanush.dhanush_id did,dhanush.registerevents drg where did.id=drg.id and drg.id="+id);
            while(res.next())
            {
                name=res.getString("name");
                mail=res.getString("mail");
                rollno=res.getString("rollno");
                mbno=res.getString("phno");
                clg=res.getString("college");
                arroflist[i]=res.getString("event");
                i=i+1;
            }
            noofevents=i-1;
                            %>
                <html>
                    <head></head>
                    <body>
                        <table align="center">                            
                            <tr>
                                <td><b>Id</b></td>
                                <td>:</td>
                                <td><%=id%></td>
                            </tr>
                            <tr>
                                <td><b>Name</b></td>
                                <td>:</td>
                                <td><%=name%></td>
                            </tr>
                            <tr>
                                <td><b>Roll No</b></td>
                                <td>:</td>
                                <td><%=rollno%></td>
                            </tr>
                            <tr>
                                <td><b>Mobile No</b></td>
                                <td>:</td>
                                <td><%=mbno%></td>
                            </tr>
                            <tr>
                                <td><b>Mail Id</b></td>
                                <td>:</td>
                                <td><%=mail%></td>
                            </tr>
                            <tr>
                                <td><b>College</b></td>
                                <td>:</td>
                                <td><%=clg%></td>
                            </tr>
                            <tr><td><br></td><td></td><td></td></tr>
                            <tr><td><b>List of events registered</b></td></tr>
                            <%
                                i=1;
                                while(i<=noofevents)
                                {
                                    %>
                                    <tr><td align="center" colspan="3"><%=arroflist[i]%></td></tr>
                                    <%
                                        i++;
                                }
                            %>
                            
                        </table>
                    </body>
                </html>
                <%
            }
        catch (SQLException s)
        {
            System.out.println("SQL code does not execute."+s);

        }
    }
    catch (Exception e)
    {
        e.printStackTrace();
    }
%>