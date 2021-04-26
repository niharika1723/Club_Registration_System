<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<% 
 
    if(request.getParameter("submit")!=null)
    {
            String id= request.getParameter("id");
        String name = request.getParameter("name");
        String game = request.getParameter("game");
        String fee = request.getParameter("fee");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
        pst = con.prepareStatement("update record set name = ?,game = ? ,fee = ? where id = ?");
        pst.setString(1, name);
        pst.setString(2, game);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Updated Successfully");     
    </script> 
    <%             
    }
   %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Update Page</title>
         <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <h1>UPDATE DATA</h1>
        <br>
        <div class="row">
            
             <div class="col-sm-4">
                <form  method="POST" action="#">
                     <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
                        String id=request.getParameter("id");
                        pst = con.prepareStatement("select * from record where id = ?");
                       
                       pst.setString(1, id);
                        rs = pst.executeQuery();
                        while(rs.next())
                        {
                        
                    
                        
                    
                    %>
                    
                    
                    
                    <div align="left">
                        <label class=""form-label>NAME</label>
                        <input type="text" class="form-control" placeholder="name" value="<%= rs.getString("name")%>" name="name" id="name" required="required">
                    </div>
                    
                    <div align="left">
                        <label class=""form-label>GAME</label>
                        <input type="text" class="form-control" placeholder="game" value="<%= rs.getString("game")%>" name="game" id="game" required="required">
                    </div>
                    
                    <div align="left">
                        <label class=""form-label>FEE</label>
                        <input type="text" class="form-control" placeholder="fee" value="<%= rs.getString("fee")%>" name="fee" id="fee" required="required">
                    </div>
                    
                    <% } %>
                    
                    <br>
                    
                    <div align="right">
                      
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>
                    
                    
                    
                    
                    
                    <div align="right">
                        <p><a href="index.jsp"> Back</a></p>
                    </div>
                    
                </form>
            </div>
        </div>
    </body>
</html>