<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.*"%>

<%
    String name=request.getParameter("name").toUpperCase();
    String email=request.getParameter("email");
    String phno=request.getParameter("phno");
    String branch=request.getParameter("branch").toUpperCase();
    String rollno=request.getParameter("rollno").toUpperCase();
    String clgname="";
	String flag=request.getParameter("flag");
	if(flag==null)
	{
		clgname=request.getParameter("clgname").toUpperCase();
    }
	else
	{
		clgname=request.getParameter("clgname_man").toUpperCase();
	}
	
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
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("insert into dhanush.dhanush_id(rollno,name,branch,college,mail,phno) values(?,?,?,?,?,?)");
           pstmt.setString(1,rollno);
           pstmt.setString(2,name);
           pstmt.setString(3,branch);
           pstmt.setString(4,clgname);
           pstmt.setString(5,email);
           pstmt.setString(6,phno);
           pstmt.execute();
           con.close();
      } 
      catch (SQLException s)
      {
        System.out.println("SQL code does not execute1."+s);
      }
      //con.close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
            res=st.executeQuery("select id from dhanush.dhanush_id where branch='"+branch+"' and name='"+name+"' and mail='"+email+"' and phno='"+phno+"' and college='"+clgname+"'");
            if(res.next())
            {
               
               %>
               <!DOCTYPE html>
                    <html lang="en">
                        <head>
                            <meta charset="utf-8">
                            <meta http-equiv="X-UA-Compatible" content="IE=edge">
                            <meta name="viewport" content="width=device-width, initial-scale=1">
                            <title>Dhanush 2K22</title>
                            <link href="https://fonts.googleapis.com/css?family=Allura|Rock+Salt|Leckerli+One" rel="stylesheet">
                            <link rel="shortcut icon" type="image/icon" href="assets/images/logo.ico"/>
                            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
                            <link href="assets/css/bootstrap.min.css" rel="stylesheet">
                            <link href="assets/css/slick.css" rel="stylesheet">
                            <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">
                            <link href="assets/css/style.css" rel="stylesheet">
                            <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700,800" rel="stylesheet">
                            <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
                        </head>
                        <body style="background:black;">
                            <section id="mu-register">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mu-register-area">
                                            <div class="mu-title-area">
                                                <h2 class="mu-title">Welcome to <font face="Rock Salt" size="5" color="#ff56d4"> Dhanush 2K22</font></h2>
                                                <p>Please note the ID below for future reference</p>
                                            </div>
                                            <div class="mu-register-content">
                                                <p><font face="Leckerli One" size="7" color="#ff56d4"><%=res.getInt("id")%></font><br>&nbsp;</p>
                                                <a href="index.jsp">Back to Home Page</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </section>    
                        </body>
                    </html>
                <%
                    try
                    {
                        String host ="smtp-mail.outlook.com" ;
                        String user1 = "phani@diet.ac.in";
                        String pass1 = "4freefile$";
                        String to = email;
                        String from = "phani@diet.ac.in";
                        String subject = "Dhanekula Fest Registration";
                        String messageText = "you have registered succesfully for the fest .....Your respective id is "+"--"+res.getInt("id")+"."+"Name:"+name+"---"+"phno:"+phno+"--"+"email:"+email;
                        boolean sessionDebug = false;
                        Properties props = System.getProperties();
                        props.put("mail.smtp.starttls.enable", "true");
                        props.put("mail.smtp.host", host);
                        props.put("mail.smtp.port", "587");
                        props.put("mail.smtp.auth", "true");
                        props.put("mail.smtp.starttls.required", "true");
                        java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
                        Session mailSession = Session.getDefaultInstance(props, null);
                        mailSession.setDebug(sessionDebug);
                        Message msg = new MimeMessage(mailSession);
                        msg.setFrom(new InternetAddress(from));
                        InternetAddress[] address = {new InternetAddress(to)};
                        msg.setRecipients(Message.RecipientType.TO, address);
                        msg.setSubject(subject);
                        msg.setSentDate(new Date());
                        msg.setText(messageText);
                        Transport transport=mailSession.getTransport("smtp");
                        transport.connect(host, user1, pass1);
                        transport.sendMessage(msg, msg.getAllRecipients());
                        transport.close();
                        System.out.println("message send successfully");
                    }
                    catch(Exception ex)
                    {
                        System.out.println(ex);
                    }
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
%>