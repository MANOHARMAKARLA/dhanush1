<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String uname=session.getAttribute("uname").toString();
    String passcode=session.getAttribute("passcode").toString();
    
    String oldpass=request.getParameter("oldpass");
    String newpass=request.getParameter("newpass");
    String conpass=request.getParameter("conpass");
    
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "examclick";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res=null;
    try
    {
    Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url+db, user, pass);

        try
        {
            Statement st = con.createStatement();
            res=st.executeQuery("select passcode from dhanush.login where uname='"+uname+"'");
            System.out.println("select passcode from dhanush.login where uname='"+uname+"'");
            
            System.out.println(oldpass);
            System.out.println(newpass);
            System.out.println(conpass);
            
            if(res.next())
            {
                System.out.println("came");
                if(oldpass.equals(res.getString("passcode")) && newpass.equals(conpass))
                {
                    System.out.println("entered");
                    PreparedStatement pstmt = con.prepareStatement("update dhanush.login set passcode='"+newpass+"' where uname='"+uname+"'");
                    System.out.println(pstmt);
                    pstmt.execute();
                }
            }
            response.sendRedirect("showchange.jsp");
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
