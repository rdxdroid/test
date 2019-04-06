<%@page import="java.sql.*,java.io.*,p.*" %>

<%
	String uid = request.getParameter("userUID");

	InputStream is = null;
  
    System.out.println(uid);


try{
    Connection con= Connect_db.getCon();
    System.out.println("1");
    PreparedStatement pst= con.prepareStatement("insert into userdb values(?,?,?,?,?,?,?,?,?,?)");
    pst.setString(1,uid);
    pst.setString(2,null);
    pst.setString(3,null);
    pst.setString(4,null);
    pst.setString(5,null);
    pst.setInt(6,0);
    pst.setString(7,null);
    pst.setString(8,null);
    pst.setInt(9,0);
    pst.setInt(10,0);

    pst.execute();
    
   /* PreparedStatement ps= con.prepareStatement("insert into aadhardb values(?,?,?,?)");
    ps.setString(1,uid);
    ps.setString(2,null);
    ps.setBlob(3,is);
    ps.setBoolean(4, false);
    
    ps.execute();
    */

    System.out.println("2");

    response.sendRedirect("regComplete.html");
    System.out.println("3");
    con.close();
  }

  catch(Exception e){
	  e.printStackTrace(response.getWriter()); 
    
  }







%>