<%@ page import="java.sql.*,p.*"%>
<%
	String uid = request.getParameter("userUID");
	session.setAttribute("uid", uid);
	System.out.println(uid);
	response.sendRedirect("index.html");
       
%>



