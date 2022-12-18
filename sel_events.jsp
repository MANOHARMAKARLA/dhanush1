<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
    
<%
    String sel_branch=request.getParameter("sel_branch");
    
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    
    %>
    <div class="row" align="center">
            <font color="white">
                <form name="f" action="sel_events_db.jsp" method="get">
                    <table style="color:black;border-color: white;" align="center">
                           <tr>
                            <td style="color:white;">EVENT</td>
                            <td style="color:white;">:</td>
                            <td>
                                <select name="eve_branch" required>
                                    <option value="">Select Event</option>
        <%

        try
        {
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url+db, user, pass);
            try
            {
                con = DriverManager.getConnection(url+db, user, pass);
                Statement st = con.createStatement();
                res=st.executeQuery("select eventname from dhanush.eventlist where branch='"+sel_branch+"' or branch='GBI'");
                while(res.next())
                {
                    %>
                        <option value='<%=res.getString("eventname")%>'><%=res.getString("eventname")%></option>
                    <%
                        System.out.println(res.getString("eventname"));
                }
            } 
            catch (SQLException s)
            {
                s.printStackTrace();
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
                                <input type="hidden" value="<%=sel_branch%>" name="sel_branch">
                                <tr>
                                    <td colspan="3"><button type="submit" class="mu-reg-submit-btn">SUBMIT</button></td>
                                </tr>
                            </select>
                        </td>
                    </table>  
                </form>
            </font>
        </div>