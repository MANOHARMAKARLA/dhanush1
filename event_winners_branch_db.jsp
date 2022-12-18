<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.StringTokenizer"%>
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
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dhanush 2K22</title>
    <!--<link href="https://fonts.googleapis.com/css?family=Allura|Rock+Salt|Leckerli+One" rel="stylesheet">-->
    <link rel="shortcut icon" type="image/icon" href="assets/images/logo.ico"/>
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/slick.css" rel="stylesheet">
    <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700,800" rel="stylesheet">-->
    <!--<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">-->
   
        <style>
            .center{
                margin: auto;
                width: 80%;
                border: 3px solid white;
                padding: 30px;
              }
        </style>
</head>
<body style="background:black;">
        
        <div class="row" align="right">
            <a href="<%=home%>"><button class="mu-reg-submit-btn">HOME</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
        </div>

<%
    String branch=request.getParameter("branch");
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    ResultSet res1=null;
    ResultSet res2=null;
    ResultSet res3=null;
    
    String win1="";
    String run1="";
    String winner_id="";
    String runner_id="";
	
	String events[]=new String[100];
    
    String winids[]=new String[100];
    String winname[]=new String[100];
    String wincollege[]=new String[100];
    String winmailid[]=new String[100];
    String winphn[]=new String[100];
    
    String runids[]=new String[100];
    String runname[]=new String[100];
    String runcollege[]=new String[100];
    String runmailid[]=new String[100];
    String runphn[]=new String[100];
    
    StringTokenizer st1=null;
    StringTokenizer st2=null;
    
    int i=0,j=0,l=0;
    int noofevents;
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {            
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
			
			res=st.executeQuery("select event from dhanush.winner_list where branch='"+branch+"'");
			out.println("select event from dhanush.winner_list where branch='"+branch+"'");
			l=0;
			while(res.next())
			{
				events[l]=res.getString("event");	
				out.println(events[l]);
				Statement st3 = con.createStatement();
				res1=st3.executeQuery("select winners,runners from dhanush.winner_list where event='"+events[l]+"' and branch='"+branch+"'");
				out.println("select winners,runners from dhanush.winner_list where event='"+events[l]+"' and branch='"+branch+"'");
                while(res1.next())
				{
					winner_id=res1.getString("winners");
					runner_id=res1.getString("runners");
					
					st1=new StringTokenizer(winner_id,";");

                    Statement sta = con.createStatement();
                    Statement sta1 = con.createStatement();
                    
                    while(st1.hasMoreTokens())
                    {       
                        win1=st1.nextToken();
                        res2=sta.executeQuery("select * from dhanush.dhanush_id where id='"+win1+"'");
                        while(res2.next())
                        {
                            winids[i]=res2.getString("id");
                            winname[i]=res2.getString("name");
                            wincollege[i]=res2.getString("college");
                            winmailid[i]=res2.getString("mail");
                            winphn[i]=res2.getString("phno");
                            i++;
                        }
                    }

                    st2=new StringTokenizer(runner_id,";");
                    while(st2.hasMoreTokens())
                    {       
                        run1=st2.nextToken();
                        res3=sta1.executeQuery("select * from dhanush.dhanush_id where id='"+run1+"'");
                        while(res3.next())
                        {
                            runids[j]=res3.getString("id");
                            runname[j]=res3.getString("name");
                            runcollege[j]=res3.getString("college");
                            runmailid[j]=res3.getString("mail");
                            runphn[j]=res3.getString("phno");
                            j++;
                        }
                    }
				}
					%>
                    <div class="center" align="center">
                       <table style="color:white;border-color: white;" align="center" border="1">
                                <font color="white">
                                    <tr>
									<th align='center'>WINNERS</th>
                                        <th align="center">NAME</th>
                                        <th align="center">COLLEGE NAME</th>
                                    </tr>
                                    <%
                                        for(int k=0;k<i;k++)
                                        {
                                            %>
                                            <tr>
												<td><%=events[l]%></td>
                                                <td><%=winname[k]%></td>
                                                <td><%=wincollege[k]%></td>
                                            </tr>
                                            <%
                                        }
                                    %>
                                </font>
                            </table>
                                <br><br>
                            <table style="color:white;border-color: white;" align="center" border="1">
                                <font color="white">
                                <tr>
										<th align='center'>RUNNERS</th>
                                        <th align="center">NAME</th>
                                         <th align="center">COLLEGE NAME</th>
                                    </tr>
                                    <%
                                        for(int k=0;k<j;k++)
                                        {
                                            %>
                                            <tr>
												<td><%=events[l]%></td>
                                                <td><%=runname[k]%></td>
                                                <td><%=runcollege[k]%></td>
                                            </tr>
                                            <%
                                        }
                                    %>
                                </font>
                            </table>
                    </div><br>
                    <%
					l++;
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
</body>
</html>