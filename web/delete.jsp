<%@page import="java.sql.*" %> 



<% 
        String id= request.getParameter("id");
           Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
        pst = con.prepareStatement("delete from record  where id = ?");
        pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
        
        
    <script>   
        alert("Record Deleted Successfully");     
    </script>
    
    <div align="center">
                        <p><a href="index.jsp"> Back</a></p>
                    </div>
    
    
    
