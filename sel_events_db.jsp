<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.StringTokenizer"%>
   
<%
    String sel_branch=request.getParameter("sel_branch");
    String eve_branch=request.getParameter("eve_branch");
    System.out.println(eve_branch);
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    ResultSet res1= null;
    ResultSet res2= null;
    
    String win1="";
    String run1="";
    String winner_id="";
    String runner_id="";
    
    String winname[]=new String[10];
    String wincollege[]=new String[10];
    String winmailid[]=new String[10];
    String winphn[]=new String[10];
    
    String runname[]=new String[10];
    String runcollege[]=new String[10];
    String runmailid[]=new String[10];
    String runphn[]=new String[10];
    
    StringTokenizer st1=null;
    StringTokenizer st2=null;
    
    int i=0,j=0;
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
            res=st.executeQuery("select winners,runners from dhanush.winner_list where event='"+eve_branch+"' and branch='"+sel_branch+"' or branch='GBI'");
            System.out.println("select winners,runners from dhanush.winner_list where event='"+eve_branch+"' and branch='"+sel_branch+"' or branch='GBI'");
            if(res.next())
            {
                win1=res.getString("winners");
                run1=res.getString("runners");
            }
            st1=new StringTokenizer(win1,";");
            
            Statement sta = con.createStatement();
            Statement sta1 = con.createStatement();
            
            while(st1.hasMoreTokens())
            {       
                winner_id=st1.nextToken();
                System.out.println(winner_id);
                res1=sta.executeQuery("select * from dhanush.dhanush_id where id='"+winner_id+"'");
                while(res1.next())
                {
                    winname[i]=res1.getString("name");
                    wincollege[i]=res1.getString("college");
                    winmailid[i]=res1.getString("mail");
                    winphn[i]=res1.getString("phno");
                    System.out.println(winname[i]+wincollege[i]+winmailid[i]+winphn[i]);
                    i++;
                }
            }
 
            st2=new StringTokenizer(run1,";");
            while(st2.hasMoreTokens())
            {       
                runner_id=st2.nextToken();
                System.out.println("runner"+runner_id);
                res2=sta1.executeQuery("select * from dhanush.dhanush_id where id='"+runner_id+"'");
                while(res2.next())
                {
                    runname[j]=res2.getString("name");
                    runcollege[j]=res2.getString("college");
                    runmailid[j]=res2.getString("mail");
                    runphn[j]=res2.getString("phno");
                    System.out.println(winname[j]+wincollege[j]+winmailid[j]+winphn[j]);
                    j++;
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
</head>
<body style="background:black;">
        <div class="row" align="right">
            <a href="index.jsp"><button class="mu-reg-submit-btn">HOME</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div>
            <h1 align="center" style="color:yellow;">WINNERS</h1>
            <table style="color:white;border-color: white;" align="center" border="1">
                <font color="white">
                    <tr>
                         <th align="center">NAME</th>
                         <th align="center">COLLEGE NAME</th>
                         <th align="center">MAIL ID</th>
                    </tr>
                    <%
                        for(int k=0;k<i;k++)
                        {
                            %>
                            <tr>
                                <td><%=winname[k]%></td>
                                <td><%=wincollege[k]%></td>
                                <td><%=winmailid[k]%></td>
                            </tr>
                            <%
                        }
                    %>
                </font>
            </table>
                <br><br>
            <h1 align="center" style="color:yellow;">RUNNERS</h1>
            <table style="color:white;border-color: white;" align="center" border="1">
                <font color="white">
                <tr>
                         <th align="center">NAME</th>
                         <th align="center">COLLEGE NAME</th>
                         <th align="center">MAIL ID</th>
                    </tr>
                    <%
                        for(int k=0;k<j;k++)
                        {
                            %>
                            <tr>
                                <td><%=runname[k]%></td>
                                <td><%=runcollege[k]%></td>
                                <td><%=runmailid[k]%></td>
                            </tr>
                            <%
                        }
                    %>
                </font>
            </table>
        </div>
</body>
</html>