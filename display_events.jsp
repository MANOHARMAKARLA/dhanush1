<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    
    int noofbranches=0,j=0,k=0,l=0,noofevents=0;
    int countofid[][]=new int[100][100];
    
    int count[]=new int[50];
    String branch[]=new String[20];
    String branch_events[][]=new String[100][100];
    String event[]=new String[100];
    int total[]=new int[100];
    
    %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dhanush 2K22</title>
        <!--<link href="https://fonts.googleapis.com/css?family=Allura|Rock+Salt|Parisienne|Cookie|Satisfy" rel="stylesheet">-->
        <link rel="shortcut icon" type="image/icon" href="assets/images/logo.ico"/>
        <link href="assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/slick.css" rel="stylesheet">
        <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <!--<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700,800" rel="stylesheet">-->
        <!--<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">-->

    <body style="background:black;">
        <br><br>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
    
    <%
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);

        try
        {
            Statement st = con.createStatement();
            res=st.executeQuery("select distinct branch from dhanush.eventlist where branch!='GBI' and branch!='EIE' and branch!='ECS' and branch!='CSM'");
            while(res.next())
            {
                branch[noofbranches]=res.getString("branch");
                //out.println(branch[noofbranches]);
                noofbranches++;
            }
            
            res=st.executeQuery("select distinct eventname from dhanush.eventlist");
            while(res.next())
            {
                event[noofevents]=res.getString("eventname");
                noofevents++;
            }
            
            for(int n=0;n<noofevents;n++)
            {
                total[n]=0;
                for(int p=0;p<noofbranches;p++)
                {
                    if(branch[p].equalsIgnoreCase("CSE"))
                    {
                        res=st.executeQuery("select count(distinct r.id) 'COUNT' from dhanush.registerevents r,dhanush.eventlist e,dhanush.dhanush_id did where did.id=r.id and r.event=e.eventname and (did.branch='CSE' or did.branch='IT') and r.event='"+event[n]+"'");
                    }
                    else if(branch[p].equalsIgnoreCase("ECE"))
                    {
                        res=st.executeQuery("select count(distinct r.id) 'COUNT' from dhanush.registerevents r,dhanush.eventlist e,dhanush.dhanush_id did where did.id=r.id and r.event=e.eventname and (did.branch='ECE' or did.branch='EIE' or did.branch='ECS') and r.event='"+event[n]+"'");
                    }
                    else if(branch[p].equalsIgnoreCase("CUL"))
                    {
                        res=st.executeQuery("select count(distinct r.id) 'COUNT' from dhanush.registerevents r,dhanush.eventlist e where r.event=e.eventname and (e.branch='CUL' or e.branch='GBI') and r.event='"+event[n]+"'");
                    }
                    else
                    {
                        res=st.executeQuery("select count(distinct r.id) 'COUNT' from dhanush.registerevents r,dhanush.eventlist e,dhanush.dhanush_id did where did.id=r.id and r.event=e.eventname and did.branch='"+branch[p]+"' and r.event='"+event[n]+"'");   
                    }
                    if(res.next())
                    {
                        countofid[n][p]=res.getInt("COUNT");
                        total[n]=total[n]+countofid[n][p];
                    }
                }
            }
            
        }
        catch (SQLException se)
        {
          System.out.println("SQL code does not execute."+se);
        }
    }
    catch (Exception e)
    {
        e.printStackTrace();
    }
    %>
	<div class="row" align="right">
            <a href="reg_admin.jsp"><button class="mu-reg-submit-btn">HOME</button></a>
        </div>
        <table style="color:white;border-color: white;" align="center" border="1">
                    <tr>
                        <th>S.NO</th>
                        <th>Name of the Program</th>
                        <%
                            for(int p=0;p<noofbranches;p++)
                            {%>
                            <th><%=branch[p]%></th>
                            <%}
                        %>
                        <th>TOTAL</th>
                    </tr>
                <%
    int sno=1;
    int totalsum=0;
    for(int n=0;n<noofevents;n++)
    {%>
    <tr>
        <td><%=sno%></td>
        <td><%=event[n]%></td>
    <%      for(int p=0;p<noofbranches;p++)
            {%>
            <td><%=countofid[n][p]%></td>
            <%}%>
            <td><%=total[n]%></td>        
    </tr><%
        totalsum=totalsum+total[n];
        sno++;
    }
%>
<tr>
    <td colspan="8"><b>TOTAL</b></td>
    <td><%=totalsum%></td>
</tr>
    
</div></div></div>
</body>
</html>