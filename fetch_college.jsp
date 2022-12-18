<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String clgdist=request.getParameter("clgdist");
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
        ResultSet res = st.executeQuery("select distinct college from dhanush.college where district='"+clgdist+"'");
        %>
        <select class="form-control" name="clgname" id="clgname" required>
            <option value="">select College Name</option>
            <%
                while(res.next())
                {
                %> 
                    <option value="<%=res.getString("college")%>"><%=res.getString("college")%></option>  
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