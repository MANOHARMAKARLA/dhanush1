<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<tr>
   <td align='left'>
        <a href="#" onclick="printform()"><b><font color="red">Print</font></b></a>
   </td>
</tr>
<%
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    
    Date curdate = new Date();
    SimpleDateFormat sfd = new SimpleDateFormat("dd MMM yyyy hh:mm a");
    String timestamp=sfd.format(curdate);
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String phno=request.getParameter("phno");
    String branch=request.getParameter("branch");
    String rollno=request.getParameter("rollno");
    String clgname=request.getParameter("clgname");
    int noofcul=Integer.parseInt(request.getParameter("noofcul"));
    int noofdep=Integer.parseInt(request.getParameter("noofdep"));
    String ev_names_cul[]=new String[1000];
    String ev_names_dep[]=new String[1000];
    String dep=request.getParameter("dep");
    String cul=request.getParameter("cul");
    StringTokenizer st1=null;
    String d[]=new String[100];
    String c[]=new String[100];
    String eventlist="";
    String events[]=new String[100];
    int noofeve=0;
    
    for(int i=1;i<=noofdep;i++)
    {
        d[i]=request.getParameter("d"+i);
        if(d[i]==null)
        {
            d[i]="off";
        }
        //out.println(d[i]);
    }
    for(int i=1;i<=noofcul;i++)
    {
        c[i]=request.getParameter("c"+i);
        if(c[i]==null)
        {
            c[i]="off";
        }
        //out.println(c[i]);
    }
    
    st1=new StringTokenizer(dep,"#");
    int i=1;
    while(st1.hasMoreTokens())
    {
        ev_names_dep[i]=st1.nextToken();
        i++;
    }
    
    st1=new StringTokenizer(cul,"#");
    i=1;
    while(st1.hasMoreTokens())
    {
        ev_names_cul[i]=st1.nextToken();
        i++;
    }
    
    for(i=1;i<=noofdep;i++)
    {
        if(d[i].equalsIgnoreCase("on"))
        {
            eventlist=eventlist+"#"+ev_names_dep[i];
        }
    }
    for(i=1;i<=noofcul;i++)
    {
        if(c[i].equalsIgnoreCase("on"))
        {
            eventlist=eventlist+"#"+ev_names_cul[i];
        }
    }
    
    eventlist = eventlist.substring(1,eventlist.length());
    //out.println(eventlist);
    
    st1=new StringTokenizer(eventlist,"#");
    while(st1.hasMoreTokens())
    {
        events[noofeve+1]=st1.nextToken();
       // out.println(events[noofeve+1]);
        noofeve++;
    }
    
    try
    {
      Class.forName(driver).newInstance();
      con = DriverManager.getConnection(url+db, user, pass);
      try
      {
            PreparedStatement pstmt = null;
            for(int k=1;k<=noofeve;k++)
            {
                pstmt = con.prepareStatement("replace into dhanush.paymentdone values(?,?,?,?,?)");

                pstmt.setString(1,id);
                pstmt.setString(2,events[k]);
                pstmt.setString(3,"online");
                pstmt.setString(4,timestamp);
                pstmt.setString(5,"NP");
                pstmt.execute();
            } 
               // response.sendRedirect("success.jsp?id="+id);
           con.close();
      } 
      catch (SQLException ks)
      {
        System.out.println("SQL code does not execute1."+ks);
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
%>    
<html>
    <head>
        
    </head>
    <body>
        <div id="prnt">
            <table align="center">
                <tr>
                    <th colspan="3" align="center">
                        <font face="Parisienne" size="4">Dhanekula Institute of Engineering & Technology</font><br>
                        <img src="assets/images/dietlogo2.png" width='20%'>
                    </th>
                </tr>
            </table>
            <table align="center">
                <tr>
                    <td><b>Id</b></td>
                    <td>:</td>
                    <td><b><%=id%></b></td>
                </tr>
                <tr>
                    <td><b>Name</b></td>
                    <td>:</td>
                    <td><%=name%></td>
                </tr>
                <tr>
                    <td><b>Roll No</b></td>
                    <td>:</td>
                    <td><%=rollno%></td>
                </tr>
                <tr>
                    <td><b>Mobile No</b></td>
                    <td>:</td>
                    <td><%=phno%></td>
                </tr>
                <tr>
                    <td><b>Mail Id</b></td>
                    <td>:</td>
                    <td><%=email%></td>
                </tr>
                <tr>
                    <td><b>College</b></td>
                    <td>:</td>
                    <td><%=clgname%></td>
                </tr>
            </table>
            <br>
            <table align="center" style='border-collapse: collapse' border="1">
                <tr>
                    <td colspan="3" align="center"><b>List of events registered</b></td>
                </tr>
                <tr>
                    <th align="center">S.No</th>
                    <th align="left">Event Name</th>
                    <th width='40%'>Remarks</th>
                </tr>
                <%
                    i=1;
                    while(i<=noofeve)
                    {
                        %>
                        <tr>
                            <td align="center"><%=i %></td>
                            <td><%=events[i]%></td>
                            <td>&nbsp;</td>
                        </tr>
                        <%
                            i++;
                    }
                     int v = (i-1)/6;
                     int m = (i-1)%6;
                     int value = v*150;
                     int am= m*50;
                     int sum = am+value;
                %>           
            </table>
            <p align="center">
                Total amount to be paid :<%=sum%>
                <br>
                 <img align="center"  src="assets\images\feepayment.jpg" alt="fee_payment">
            </p>
            <p> MAIL  US  FOLLOWING ATTACHED DOCUMENT TO  <B>  dhanush2k22@diet.ac.in</B> (WITH GENERATED ID ) <BR>
                DOCUMENT TO BE ATTACHED <BR> 1. SCREENSHOT OF THE PAGE <BR> 2. TRANSACATION SCREENSHOT <BR>
            </P>
            
           
            <p align="right">
                Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
        </div>
        <center>
            <a href="index.jsp">Register another user</a>
        </center>
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