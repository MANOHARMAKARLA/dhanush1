<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String id1=request.getParameter("id");
    int id=Integer.parseInt(id1);
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    try
    {
    Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+db, user, pass);

    try
    {
        Statement st = con.createStatement();

        ResultSet res = st.executeQuery("select distinct event from dhanush.registerevents where id="+id);
        %>
        <select class="form-control" name="eventname" id="eventname">
            <option>select Event</option>
            <%
                while(res.next())
                {
                %> 
                    <option value="<%=res.getString("event")%>"><%=res.getString("event")%></option>  
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
    finally
    {
        con.close();
    }   
%>