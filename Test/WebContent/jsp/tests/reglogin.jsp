
<%
   String firstName= request.getParameter("firstName");
   String lastName= request.getParameter("lastName");
   String middleName= request.getParameter("middleName");
   String zipCode= request.getParameter("zipCode");

   session.setAttribute("firstName", firstName);
   session.setAttribute("lastName", lastName);
   session.setAttribute("middleName", middleName);
   session.setAttribute("z", zipCode);

   response.sendRedirect("registration.html");
%>