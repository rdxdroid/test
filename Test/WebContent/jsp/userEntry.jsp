<%@page import="java.sql.*,p.*,java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat" %>

<%
 
  String uid = request.getParameter("userUID");
  String name = request.getParameter("name");
  String dob= request.getParameter("dateOfBirth");
  String state= request.getParameter("state");
  String city= request.getParameter("city");
  String email= request.getParameter("email");
  
  try{
    Connection con= Connect_db.getCon();
    PreparedStatement pst= con.prepareStatement("insert into userdb values(?,?,?,?,?,?,?,?,?,?)");
    pst.setString(1,uid);
    pst.setString(2,name);
    pst.setString(3,dob);
    pst.setString(4,email);
    pst.setString(5,"0");
    pst.setString(6,"0");
    pst.setString(7,city);
    pst.setString(8,state);
    pst.setString(9,"0");
    pst.setString(10,"0");

    pst.execute();
    response.sendRedirect("profile.jsp");
    con.close();    
  }

  catch(Exception e){
    out.println(e); 
    
  }
%>

