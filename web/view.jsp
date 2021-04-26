<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
        <% 
 
    if(request.getParameter("submit")!=null)
    {
        String name = request.getParameter("name");
        String game = request.getParameter("game");
        String fee = request.getParameter("fee");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
        pst = con.prepareStatement("insert into record(name,game,fee)values(?,?,?)");
        pst.setString(1, name);
        pst.setString(2, game);
        pst.setString(3, fee);
        pst.executeUpdate();  
        
        %>
            <script>
                alert("Record Addded Successfully");
            </script>
            <%             
    }
   %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>JSP Page</title>
                    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
                    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
                    <link rel="stylesheet" href="style.css">;
                </head>

               
                <nav>
        <div class="logo">
            <h2>CLUB REGISTRATION SYSTEM </h2>
        </div>

        <ul>

            <li><a href="index.jsp">HOME</a></li>
            <li><a href="view.jsp">VIEW</a></li>
            <li>
                <a href="registration.jsp">REGISTRATION</a>
            
            
        </ul>
    </nav>
                    
                    <section class="Hero1">
                          
                    <br>
                   
                        <div class="col-sm-8">
                           
                            <div class="panel-body">
                                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%" height="50%">

                                    <thead>
                                        <tr>
                                            <th class="r20">NAME</th>
                                            <th class="r20">GAME</th>
                                            <th class="r20">FEE</th>
                                            <th class="r20">EDIT</th>
                                            <th class="r20">DELETE</th>
                                        </tr>

                                    </thead>

                                    <%
                            
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
        
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
                            pst = con.prepareStatement("insert into record(name,game,fee)values(?,?,?)");
                              
                             String query="select * from record";
                             Statement st= con.createStatement();
                             rs=st.executeQuery(query);
                             while(rs.next())
                             {
                             String id=rs.getString("id");
                   
                        %>
                                        <tr>
                                            <td class="r12">
                                                <%=rs.getString("name")%>
                                            </td>
                                            <td class="r12">
                                                <%=rs.getString("game")%>
                                            </td>
                                            <td class="r12">
                                                <%=rs.getString("fee")%>
                                            </td>
                                            <td class="r12"><a href="update.jsp?id=<%=id %>"><h4>Edit</h4></a></td>
                                            <td class="r12"><a href="delete.jsp?id=<%=id %>"><h4>Delete</h4></a></td>

                                        </tr>

                                        <%
                                }
                            %>
                                </table>

                            </div>


                        </div>
                    </div>
                        
                    </section>           
                 
                                
                                
                                
                                
                </body>

                </html>
