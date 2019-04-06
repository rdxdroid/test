<%@ page import="java.sql.*,p.*"%>
<%
    try{
    	String dbAdmin= null;
    	String dbPassword=null;
    	
        String admin= request.getParameter("admin"); 
        String password= request.getParameter("password");
  
        Connection con= Connect_db.getCon();  
        ResultSet rst= con.createStatement().executeQuery("select * from admindb where admin='"+admin+"' and password='"+password+"'");
        
        while(rst.next()) {
        	dbAdmin=rst.getString("username");
        	dbPassword=rst.getString("password");
        	
		}
        
        System.out.println(dbAdmin+"\n"+dbPassword+"\n"+admin+"\n"+password);
        
    	 if(admin.equals(dbAdmin) && password.equals(dbPassword)){
        	System.out.println(dbAdmin+"\n"+dbPassword+"\n");
        	out.println(dbAdmin+"<br>"+dbPassword+"<br>");
        	out.println("Valid login credentials");
        }else{
            out.println("Invalid login credentials");   
            } 
    }
    
    catch(Exception e){       
        out.println("Something went wrong. Please try again.");  
        e.printStackTrace(response.getWriter());
    }      
%>