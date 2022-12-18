<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.StringTokenizer"%>
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
                width: 70%;
                border: 3px solid white;
                padding: 30px;
              }
        </style>
</head>
<body style="background:black;">
        <div class="row" align="right">
                <a href="outer_view_winners.jsp"><button class="mu-reg-submit-btn">BACK</button></a>
        </div>
<%
    String eventwise=request.getParameter("eventwise");
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
    
    String winids[]=new String[100];
    String winname[]=new String[100];
    String wincollege[]=new String[100];
    String winbranch[]=new String[100];
    String winphn[]=new String[100];
    
    String runids[]=new String[100];
    String runname[]=new String[100];
    String runcollege[]=new String[100];
    String runbranch[]=new String[100];
    String runphn[]=new String[100];
    
    StringTokenizer st1=null;
    StringTokenizer st2=null;
    
    int l=0;
    
    String branch="";
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
            res3=st.executeQuery("select branch from dhanush.eventlist where eventname='"+eventwise+"'");
            %>
            <font color="#44dbd4" size="5"><h1 align="center"><%=eventwise%></h1></font>
            <%
            while(res3.next())
            {
                int i=0,j=0;
                branch=res3.getString("branch");
                Statement staa = con.createStatement();
                res=staa.executeQuery("select winners,runners from dhanush.winner_list where event='"+eventwise+"' and branch='"+branch+"'");
                if(res.next())
                {
                    win1=res.getString("winners");
                    run1=res.getString("runners");
                
                    st1=new StringTokenizer(win1,";");

                    Statement sta = con.createStatement();
                    Statement sta1 = con.createStatement();
                    
                    while(st1.hasMoreTokens())
                    {       
                        winner_id=st1.nextToken();
                        res1=sta.executeQuery("select * from dhanush.dhanush_id where id='"+winner_id+"'");
                        while(res1.next())
                        {
                            winids[i]=res1.getString("id");
                            winname[i]=res1.getString("name");
                            wincollege[i]=res1.getString("college");
                            winbranch[i]=res1.getString("branch");
                            winphn[i]=res1.getString("phno");
                            i++;
                        }
                    }

                    st2=new StringTokenizer(run1,";");
                    while(st2.hasMoreTokens())
                    {       
                        runner_id=st2.nextToken();
                        res2=sta1.executeQuery("select * from dhanush.dhanush_id where id='"+runner_id+"'");
                        while(res2.next())
                        {
                            runids[j]=res2.getString("id");
                            runname[j]=res2.getString("name");
                            runcollege[j]=res2.getString("college");
                            runbranch[j]=res2.getString("branch");
                            runphn[j]=res2.getString("phno");
                            j++;
                        }
                    }
                    %>
                    <div class="center" align="center">
                        <font face="Rock Salt" size="5" color="#ff56d4"><h2 align="center"><%=branch%></h2></font>
                        <h2 align="center" style="color:yellow;">WINNERS</h2>
                            <table style="color:white;border-color: white;" align="center" border="1">
                                <font color="white">
                                    <tr>
                                        <th align="center">ID</th>
                                        <th align="center">NAME</th>
                                        <th align="center">COLLEGE NAME</th>
                                        <th align="center">BRANCH</th>
                                    </tr>
                                    <%
                                        for(int k=0;k<i;k++)
                                        {
                                            %>
                                            <tr>
                                                <td><%=winids[k]%></td>
                                                <td><%=winname[k]%></td>
                                                <td><%=wincollege[k]%></td>
                                                <td><%=winbranch[k]%></td>
                                            </tr>
                                            <%
                                        }
                                    %>
                                </font>
                            </table>
                                <br><br>
                            <h2 align="center" style="color:yellow;">RUNNERS</h2>
                            <table style="color:white;border-color: white;" align="center" border="1">
                                <font color="white">
                                <tr>
                                        <th align="center">ID</th>
                                         <th align="center">NAME</th>
                                         <th align="center">COLLEGE NAME</th>
                                         <th align="center">BRANCH</th>
                                    </tr>
                                    <%
                                        for(int k=0;k<j;k++)
                                        {
                                            %>
                                            <tr>
                                                <td><%=runids[k]%></td>
                                                <td><%=runname[k]%></td>
                                                <td><%=runcollege[k]%></td>
                                                <td><%=runbranch[k]%></td>
                                            </tr>
                                            <%
                                        }
                                    %>
                                </font>
                            </table>
                    </div><br>
                    <%
                }
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