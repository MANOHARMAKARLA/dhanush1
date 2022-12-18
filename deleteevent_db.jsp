
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String id1=request.getParameter("id");
    String eventname=request.getParameter("eventname");
    String timestamp=request.getParameter("timestamp");
    int id=Integer.parseInt(id1);
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "ecadmissions";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass   =  "root";
    
    try
    {
      Class.forName(driver).newInstance();
      con = DriverManager.getConnection(url+db, user, pass);
      try
      {
        Statement st=con.createStatement();
        int si=st.executeUpdate("DELETE FROM dhanush.registerevents WHERE event='"+eventname+"' and timestamp='"+timestamp+"' and id="+id);
        con.close();
        response.sendRedirect("displayevents_db.jsp?id="+id);
      }
      catch(Exception s)
      {
        System.out.println("SQL code does not execute1."+s);
      }
      //con.close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
%>