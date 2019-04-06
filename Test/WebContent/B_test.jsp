<%@page import="java.sql.*,java.util.*,p.*" %>
<%@page import="com.google.gson.Gson" %>

<%
	String uid = (String)session.getAttribute("uid");
	System.out.println(uid);
	User currUser = new User();
	currUser.setUid("uid");

	try{
		Connection con= Connect_db.getCon();
		System.out.println("test2");
		//PreparedStatement pst= con.prepareStatement("select name, dob, city, state, reqcount, postcount from userdb where u_id=uid");
		// System.out.println("test3");
		//ResultSet rs = pst.executeQuery();
		ResultSet rs= con.createStatement().executeQuery("select name, dob, email, city, state, reqcount, postcount from userdb where u_id='"+uid+"'");
		System.out.println("test3");

		while(rs.next()) {
			currUser.setName(rs.getString("name"));
			currUser.setDob(rs.getString("dob"));
			currUser.setEmail(rs.getString("email"));
			currUser.setCity(rs.getString("city"));
			currUser.setState(rs.getString("state"));
			currUser.setReqCount(rs.getInt("reqcount"));
			currUser.setPostCount(rs.getInt("postcount"));
		}

		System.out.println("test5");
		System.out.println(currUser.getName());

		String reqCount = new String();
		reqCount.valueOf(currUser.getReqCount());

		String postCount = new String();
		reqCount.valueOf(currUser.getPostCount());

		final ArrayList<String> user= new ArrayList<String>();
		user.add(currUser.getName());
		user.add(currUser.getDob());
		user.add(currUser.getCity());
		user.add(currUser.getState());
		user.add(reqCount);
		user.add(postCount);

		Gson gson = new Gson();
		String json = gson.toJson(user);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		response.sendRedirect("profile.html");
	}

	catch(Exception e){
		e.printStackTrace(response.getWriter());
	}
%>