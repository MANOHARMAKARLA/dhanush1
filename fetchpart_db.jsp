<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    String event=request.getParameter("event");
    String uname=session.getAttribute("uname").toString();
    String id1[]=new String[1000];
    String name[]=new String[1000];
    String clgname[]=new String[1000];
    
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    
    String win="";
    String run="";
    int i=0;
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
            if(uname.equalsIgnoreCase("cul"))
			{
				res=st.executeQuery("select d.id,d.name,d.college from dhanush.dhanush_id d,dhanush.registerevents r where r.id=d.id and r.event='"+event+"'");
            
			}
			else if(uname.equalsIgnoreCase("ece"))
			{
				res=st.executeQuery("select d.id,d.name,d.college from dhanush.dhanush_id d,dhanush.registerevents r where r.id=d.id and r.event='"+event+"' and (branch='ece' or branch='eie')");
            
			}
			else
			{
				res=st.executeQuery("select d.id,d.name,d.college from dhanush.dhanush_id d,dhanush.registerevents r where r.id=d.id and r.event='"+event+"' and branch='"+uname.toUpperCase()+"'");
            
			}
			while(res.next())
            {
                id1[i]=res.getString("id");
                String a="R"+id1[i]+"#"+(i+1)+"W";
                if(request.getParameter(a)!=null && request.getParameter(a).equalsIgnoreCase("on"))
                {
                    win=win+id1[i]+";";
                }
                String b="R"+id1[i]+"#"+(i+1)+"R";
                if(request.getParameter(b)!=null && request.getParameter(b).equalsIgnoreCase("on"))
                {
                    run=run+id1[i]+";";
                }
                i++;
            }
            
            PreparedStatement pstmt = null;
            pstmt = con.prepareStatement("replace into dhanush.winner_list values(?,?,?,?)");

            pstmt.setString(1,uname.toUpperCase());
            pstmt.setString(2,event);
            pstmt.setString(3,win);
            pstmt.setString(4,run);
            pstmt.execute();
            
            response.sendRedirect("show_win_result.jsp");
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
   
%>