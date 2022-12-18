<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String id=request.getParameter("id");
    String branch=request.getParameter("branch");
    String name="",mail="",phno="",clgname="",rollno="";
    String ev_names_cul[]=new String[1000];
    String ev_names_dep[]=new String[1000];
    int noofdep=0,noofcul=0;
    String dep="",cul="";
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
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
            res=st.executeQuery("select * from dhanush.dhanush_id where id='"+id+"'");
            if(res.next())
            {
               branch=res.getString("branch");
               name=res.getString("name");
               mail=res.getString("mail");
               phno=res.getString("phno");
               clgname=res.getString("college");
               rollno=res.getString("rollno");
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
    finally
    {
    con.close();
    }
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
            res=st.executeQuery("select * from dhanush.eventlist where (branch='"+branch+"' or branch='GAME' or branch='GBI' or branch='BSNH') and flag=0");
            int i=1;
            while(res.next())
            {
               ev_names_dep[i]=""+res.getString("eventname");
               dep = dep+"#"+ev_names_dep[i];
               noofdep++;
               i++;
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
    finally
    {
    con.close();
    }
    
    try
    {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection(url+db, user, pass);
        try
        {
            con = DriverManager.getConnection(url+db, user, pass);
            Statement st = con.createStatement();
            res=st.executeQuery("select * from dhanush.eventlist where branch='CUL' and flag=0");
            int i=1;
            while(res.next())
            {
               ev_names_cul[i]=""+res.getString("eventname");
               cul=cul+"#"+ev_names_cul[i];
               noofcul++;
               i++;
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
    finally
    {
    con.close();
    }
    int loop=0;
    if(noofdep>=noofcul)
    {
        loop=noofdep;
    }
    else
    {
        loop=noofcul;
    }
    
%>

                        <div class="mu-title-area">
                            <h2 class="mu-title">Welcome to <font face="Rock Salt" size="5" color="#ff56d4"> Dhanush 2K22</font></h2>
                            <p>Please fill the following details for confirming your registration</p>
                        </div>
                        <div class="mu-register-content">
                            <form class="mu-register-form" action="register_db.jsp">
                                <input type="text" name="noofcul" value="<%=noofcul%>" hidden/>
                                <input type="text" name="noofdep" value="<%=noofdep%>" hidden/>
                                <input type="text" name="dep" value="<%=dep%>" hidden/>
                                <input type="text" name="cul" value="<%=cul%>" hidden/>
                                <input type="text" name="id" value="<%=id%>" hidden/>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">                
                                            <input type="text" class="form-control" value="<%=name%>" id="name" name="name" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">                
                                            <input type="email" class="form-control" value="<%=mail%>" id="email" name="email" required="">
                                        </div>     
                                    </div>
				</div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">                
                                            <input type="text" class="form-control" value="<%=clgname%>" id="clgname" name="clgname" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">                
                                            <input type="text" class="form-control" value="<%=rollno%>" id="email" name="rollno" required="">
                                        </div>     
                                    </div>
				</div>        
				<div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">                
                                            <input type="text" class="form-control" value="<%=phno%>" id="telephone" name="phno" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">			
                                        <div class="form-group">
                                            <select class="form-control" name="branch" id="branch" readonly>
                                                <option value="">select Branch</option>
                                                <%
                                                    if(branch.equalsIgnoreCase("CIV"))
                                                    {
                                                        %><option value="CIV" selected="selected">CIVIL ENGINEERING</option><%
                                                    }
                                                    else
                                                    {
                                                        %><option value="CIV">CIVIL ENGINEERING</option><%
                                                    }
                                                    if(branch.equalsIgnoreCase("EEE"))
                                                    {
                                                        %><option value="EEE"  selected="selected">ELECTRICAL & ELECTRONICS ENGINEERING</option><%
                                                    }
                                                    else
                                                    {
                                                        %><option value="EEE">ELECTRICAL & ELECTRONICS ENGINEERING</option><%
                                                    }
                                                    if(branch.equalsIgnoreCase("MEC"))
                                                    {
                                                        %><option value="MEC" selected="selected">MECHANICAL ENGINEERING</option><%
                                                    }
                                                    else
                                                    {
                                                        %><option value="MEC">MECHANICAL ENGINEERING</option><%
                                                    }
                                                    if(branch.equalsIgnoreCase("ECE"))
                                                    {
                                                        %><option value="ECE" selected="selected">ELECTRONICS & COMMUNICATIONS ENGINEERING</option><%
                                                    }
                                                    else
                                                    {
                                                        %><option value="ECE">ELECTRONICS & COMMUNICATIONS ENGINEERING</option><%
                                                    }
                                                    if(branch.equalsIgnoreCase("CSE"))
                                                    {
                                                        %><option value="CSE" selected="selected">COMPUTER SCIENCE & ENGINEERING</option><%
                                                    }
													if(branch.equalsIgnoreCase("IT"))
                                                    {
                                                        %><option value="IT" selected="selected">INFORMATION TECHNOLOGY</option><%
                                                    }
													if(branch.equalsIgnoreCase("CUL"))
                                                    {
                                                        %><option value="CUL" selected="selected">OTHERS</option><%
                                                    }
                                                    else
                                                    {
                                                        %><option value="CSE">COMPUTER SCIENCE & ENGINEERING</option><%
                                                    }
                                                %>
                                            </select>
                                        </div>      
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div style="color:white;font-size:1.5em;">                
                                            Please tick the respective events you want to participate
                                        </div>
                                    </div>
                                </div>    <br>       
                                <div class="row">
								<%
									if(!branch.equalsIgnoreCase("CUL"))
									{
								%>
                                    <div class="col-md-6">
                                        <div class="myheading">                
                                            Technical Events
                                        </div>
                                    </div>
								<%
									}
								%>
                                    <div class="col-md-6">
                                        <div class="myheading">                
                                            Cultural Events
                                        </div>
                                    </div>
                                </div><br>            
                                <%
                                    int i=1;
                                    for(int j=1;j<=loop;j++)
                                    {
                                        int flagd=0;
                                        int flagc=0;
                                        if(ev_names_dep[j]==null)
                                        {
                                            flagd=1;
                                        }
                                        if(ev_names_cul[j]==null)
                                        {
                                            flagc=1;
                                        }
                                        %>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mycheckbox">
                                                        <%
															if(!branch.equalsIgnoreCase("CUL"))
															{
																if(flagd!=1)
																{
																	%>
																	<div class="row">
																		<div class="col-md-2" align="right"><input type="checkbox"  name="d<%=j%>">&nbsp;&nbsp;</div>
																		<div class="col-md-10" align="left">&nbsp;&nbsp;<%=ev_names_dep[j]%></div>
																	</div>
																	
																	<%
																}
																else
																{
																	%>&nbsp;<%
																}
															}
                                                        %>
                                                        
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mycheckbox">
                                                        <%
                                                            if(flagc!=1)
                                                            {
                                                                %>
                                                                <div class="row">
                                                                    <div class="col-md-2" align="right"><input type="checkbox"  name="c<%=j%>">&nbsp;&nbsp;</div>
                                                                    <div class="col-md-10" align="left">&nbsp;&nbsp;<%=ev_names_cul[j]%></div>
                                                                </div>
                                                                <%
                                                            }
                                                            else
                                                            {
                                                                %>&nbsp;<%
                                                            }
                                                        %>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        <%
                                    }
                                %>
                                </div>           
                                <center><button type="submit" class="mu-reg-submit-btn">SUBMIT</button></center>
