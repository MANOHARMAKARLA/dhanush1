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
<html>
    <head>
        <style>
            .center{
                margin-top: 300px;
                margin-left: 400px;
                width: 50%;
                border: 5px solid white;
                padding: 30px;
              }
        </style>
    </head>
 <body style="background-color: black;color:white;">
    <div class="row" align="right">
        <a href="<%=home%>"><button class="mu-reg-submit-btn">HOME</button></a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="logout.jsp"><button class="mu-reg-submit-btn">LOGOUT</button></a>
    </div>       
        <div class="center">
            <font color="white">
                <h1 align="center">PASSWORD CHANGED SUCCESSFULLY</h1>
            </font>
        </div>    
    </body>
</html>