<%@ page import="java.sql.*,p.*"%>
<%
    try{
        String admin= request.getParameter("admin");   
        String password= request.getParameter("password");
        Connection con= Connect_db.getCon();  
        ResultSet rs= con.createStatement().executeQuery("select * from admindb where username='"+admin+"' and pass='"+password+"'");
        if(rs.next())          
            out.println("Valid login credentials");        
         else
            out.println("Invalid login credentials");            
    }
    catch(Exception e){       
        out.println("Something went wrong. Please try again.");       
    }      
%>