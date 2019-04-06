<%@page import="java.sql.*,p.*" %>

<%
  String firstName= request.getParameter("firstName");
  String lastName= request.getParameter("lastName");
  String middleName= request.getParameter("middleName");
  String phoneNumber= request.getParameter("phoneNumber");
  String email= request.getParameter("email");

  try{
    Connection con= Connect_db.getCon();
    PreparedStatement pst= con.prepareStatement("insert into user_db values(?,?,?,?,?)");
    pst.setString(1,firstName);
    pst.setString(2,lastName);
    pst.setString(3,middleName);
    pst.setString(4,phoneNumber);
    pst.setString(5,email);

    pst.execute();
    response.sendRedirect("regComplete.html");
    con.close();    
  }

  catch(Exception e){
    out.println(e);   
  }
%>