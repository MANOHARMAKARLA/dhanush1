<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String uname = request.getParameter("uname");
    String passcode = request.getParameter("passcode");
    String type = "";
    
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
            res=st.executeQuery("select * from dhanush.login where uname='"+uname+"' and passcode='"+passcode+"'");
            if(res.next())
            {
                type=res.getString("type");
            }
			else
			{
				response.sendRedirect("login.jsp");
			}
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
    finally
    {
        con.close();
    }
    
    if(type.equalsIgnoreCase("reg_desk"))
    {
        session.setAttribute("uname",uname);
        session.setAttribute("passcode",passcode);
        session.setAttribute("type",type);

        response.sendRedirect("reg_desk.jsp");
    }
    else if(type.equalsIgnoreCase("reg_admin"))
    {
        session.setAttribute("uname",uname);
        session.setAttribute("passcode",passcode);
        session.setAttribute("type",type);

        response.sendRedirect("reg_regadmin.jsp");
    }
    else if(type.equalsIgnoreCase("admin"))
    {
        session.setAttribute("uname",uname);
        session.setAttribute("passcode",passcode);
        session.setAttribute("type",type);
        
        response.sendRedirect("reg_admin.jsp");
    }
    else if(type.equalsIgnoreCase("pay"))
    {
        session.setAttribute("uname",uname);
        session.setAttribute("passcode",passcode);
        session.setAttribute("type",type);
        
        response.sendRedirect("paidcheck.jsp");
    }
%>
