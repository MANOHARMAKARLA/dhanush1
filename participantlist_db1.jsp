<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
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

<tr>
   <td align='left'>
        <a href="#" onclick="printform()"><b><font color="yellow">Print</font></b></a>
   </td>
</tr>
<%
    String branch=request.getParameter("branch");
    String event=request.getParameter("eventname");
    
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
                
				if(branch.equalsIgnoreCase("CUL"))
				{
					res=st.executeQuery("select did.id,did.name,did.rollno,did.mail,did.phno,did.college from dhanush.dhanush_id did,dhanush.registerevents drg where did.id=drg.id and drg.event='"+event+"'");
					out.println("select did.id,did.name,did.rollno,did.mail,did.phno,did.college from dhanush.dhanush_id did,dhanush.registerevents drg where did.id=drg.id and drg.event='"+event+"'");
                
                }
				else
				{
					res=st.executeQuery("select did.id,did.name,did.rollno,did.mail,did.phno,did.college from dhanush.dhanush_id did,dhanush.registerevents drg where did.id=drg.id and did.branch='"+branch+"' and drg.event='"+event+"'");
                }
				%>
                     <div class="row" align="right">
                            <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>

                        </div>
                        <div align="center" id="prnt"> 

                        <br><br><br><br><br><br>
                    <center><h2 class="mu-title"><font color="white">Welcome to </font><font face="Rock Salt" size="5" color="#ff56d4"> Dhanush 2K22</font></h2></center>
                    <center><h2 class="mu-title"><font color="white">List of Participating Students</font></h2></center>
                    <table style="color:yellow;" align="center">
                        <tr>
                                <td align="left">Branch : <%=branch%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td align="right">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    Event Name : <%=event%>
                                </td>
                        </tr>
                    </table>
                        <table style="color:yellow;" align="center" border="1">
                        <tr>
                            <td>S. No</td>
                            <td>Student id</td>
                            <td>Name of the Student</td>
                            <td align="center">Roll No</td>
                            <td align="center">Mail Id</td>
                            <td align="center">Phone No</td>
                            <td align="center">College Name</td>
							<td align="center">Signature</td>
                        </tr>
                        <%
                            int i=1;
                            while(res.next())
                            {
                                %>
                                <tr>
                                    <td align="center"><%=i%></td>
                                    <td align="center"><%=res.getString("id")%></td>
                                    <td><%=res.getString("name")%></td>
                                    <td align="center"><%=res.getString("rollno")%></td>
                                    <td><%=res.getString("mail")%></td>
                                    <td align="center"><%=res.getString("phno")%></td>
                                    <td><%=res.getString("college")%></td>
									<td>&nbsp;</td>
                                </tr>
                                <%i++;
                            }
                        %>
                        </table></div>
                        <table align="center">
                            <tr>
                                <td align="center"><a href="participantlist.jsp"><b><font color="blue">back</font></b></a></td>
                            </tr>
                        </table>
                    
                <%

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
    
%>
    </body>
</html>
<script>
    function printform()
    {
            var tables=document.getElementsByTagName('table');
        for(i=0;i<tables.length;i++)
        {
           tables[i].setAttribute("style","border-collapse:collapse;") ;
        }
        var prntcon=document.getElementById('prnt');
        var printwind=window.open('','PrintForm','width=100%,height=100%');
        printwind.document.write(prntcon.innerHTML);
        printwind.document.close();
        printwind.focus();
        printwind.print();
        printwind.close();
    }
</script>