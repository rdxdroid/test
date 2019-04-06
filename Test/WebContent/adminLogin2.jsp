<%@ page import="java.sql.*,p.*"%>

  <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //String userType = request.getParameter("usertype");
        //String driver = "oracle.jdbc.driver.OracleDriver";
        //String dbURL = "jdbc:oracle:thin:@localhost:1521:xe","system","oracle";
        String dbuser = "admin";
        String dbpassword = "password";
        //Connection theConnection = null;
        PreparedStatement theStatement = null;


            try{  
                //Class.forName(driver);
                //theConnection=DriverManager.getConnection(dbURL,dbuser,dbpassword);  
                Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
                theStatement = con.prepareStatement("select * from admindb where username=? and password=?");
                theStatement.setString(1,request.getParameter("username"));
                theStatement.setString(2,request.getParameter("password"));
                ResultSet theResult = theStatement.executeQuery();
                System.out.println(username+""+password);

                if(theResult.next())
                    System.out.println("Success");
                else
                    System.out.println("Failed");

                }catch(Exception e){
                    System.out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
                }
   %>