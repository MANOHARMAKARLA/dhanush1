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
    
    /*out.println(name);
    out.println(email);
    out.println(phno);
    out.println(branch);*/
    
    Connection con = null;
    String url    =  "jdbc:mysql://localhost:3306/";
    String db     =  "dhanush";
    String driver =  "com.mysql.jdbc.Driver";
    String user   =  "root";
    String pass = "root";
    ResultSet res= null;
    
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
			%>
            <div id="fetchpart" style="border-color: yellow;">
                <center>
                    <table border="1" style="color:yellow;border-color:white;">
                        <font color="white">
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>COLLEGE NAME</th>
                            <th>WINNER</th>
                            <th>RUNNER</th>
                        </tr>
                    <%
                    while(res.next())
                    {
                       %>
                        <tr>
                            <td><%=res.getString("id")%></td>
                            <td><%=res.getString("name")%></td>
                            <td><%=res.getString("college")%></td>
                            <%
                            String c="pro"+i;
                            System.out.println(c);
                            %>
                            <td align='center'><input type="checkbox" class="<%=c%>" name="R<%=res.getString("id")%>#<%=i+1%>W"></td>
                            <td align='center'><input type="checkbox" class="<%=c%>" name="R<%=res.getString("id")%>#<%=i+1%>R"></td>
                        </tr>
                        <%
                       i++;
                    }
                    %> 
                    </font>
					<tr>
						<td colspan='5' align='center'><input type='submit' name='wl' value='Update Winners List'></td>
					</tr>
                    </table>
                </center>
            
        </div>
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
    finally
    {
    con.close();
    }
   
%>
<script>
$(document).ready(function(){
    $('input:checkbox').click(function() {
        $('.c').not(this).prop('checked', false);
    });
});
</script>

