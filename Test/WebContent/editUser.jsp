<%@page import="java.sql.*,p.Connect_db" %>

<%
 
  String uid = request.getParameter("userUID");
  String name = request.getParameter("name");
  String dob= request.getParameter("dateOfBirth");
  String state= request.getParameter("state");
  String city= request.getParameter("city");
  String email= request.getParameter("email");
  System.out.println(uid);
  
  try{
    Connection con= Connect_db.getCon();
    PreparedStatement pst= con.prepareStatement("update userdb set name=?, dob=?, email=?, city=?, state=? where u_id=?");
    pst.setString(1,name);
    pst.setString(2,dob);
    pst.setString(3,email);
    pst.setString(4,city);
    pst.setString(5,state);
    pst.setString(6,uid);
    

    pst.execute();
    
    session.setAttribute("uid",uid);
     
    System.out.println(uid);
    
    response.sendRedirect("B_test.jsp");
    con.close();    
  }

  catch(Exception e){
	  e.printStackTrace(response.getWriter()); 
    
  }
%>

