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
                alert("Added Successfully");
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
            <h2>CLUB REGISTRATION SYSTEM</h2>
        </div>

        <ul>

            <li><a href="index.jsp">Home</a></li>
            <li><a href="view.jsp">View</a></li>
            <li><a href="registration.jsp">Registration</a></li>
            
            
        </ul>
    </nav>
                    <section class="Hero">
                          
                    <br>
                    <div class="row">
                       
                        <div class="col-sm-4">
                            <fieldset style="width: 50%;" >
                                <center>
                                <form method="POST" action="#" > 
                                <div align="left">
                                    <label class="r22" form-label>NAME</label>
                                    <input type="text" class="form-control" placeholder="name" name="name" id="name" required="required">
                                </div>
                                    <br>
                                <div align="left">
                                    <label class="r22" form-label>GAME</label>
                                    <input type="text" class="form-control" placeholder="game" name="game" id="game" required="required">
                                </div>
                                    <br>
                                <div align="left">
                                    <label class="r22" form-label>FEE</label>
                                    <input type="text" class="form-control" placeholder="fee" name="fee" id="fee" required="required">
                                </div>
                                <br>

                                <div align="right">

                                    <input type="submit" id="submit" value="submit" name="submit" class="btn btn-primary">
                                    <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                                </div>


                            </form>
                                </center>
                            </fieldset>
                        </div>
                  
                    </div>
                        
                    </section>           
                 
                                
                                
        
                                
          </body>
          
                </html>