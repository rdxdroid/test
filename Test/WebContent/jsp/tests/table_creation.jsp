<%@page import="p.*,java.sql.*"%>

<html>
<body>
	<%
			try{
				Connection con= Connect_db.getCon();
				Statement pst= con.createStatement();
				pst.execute("create table user_db( varchar(30), l_name varchar(30), m_name varchar2(30), ph_Num number(10), email varchar(100)");
				System.out.println("Table created successfully.");
				con.close();
			}
			
			catch(Exception e){
				System.out.println("db related problem or tables already exist");
			}
		%>
</body>
</html>