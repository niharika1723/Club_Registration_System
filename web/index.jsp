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
        
        Class.forName("com.mysql.cj.jdbc.Driver");
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
                <body>
               
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
                    
                    
                    
                </body>               
      

  </html>