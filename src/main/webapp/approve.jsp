<%@ page import="java.sql.*" %>
<%@ page import="com.fuel.indeed.services.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
<%
	String id = request.getParameter("id");
	ConnectDB.connect();
	try {
		PreparedStatement ps = ConnectDB.con.prepareStatement("Select * from NewRegPetrolPump where id=?");
		ps.setInt(1,Integer.parseInt(id));
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			String name = rs.getString("name");
			String email = rs.getString("email");
			String pwd = rs.getString("pwd");
			String address = rs.getString("address");
			String latitude = rs.getString("latitude");
			String longitude = rs.getString("longitude");
			PreparedStatement ps2 = ConnectDB.con.prepareStatement("insert into PetrolPump values(?,?,?,?,?,?,?,?)");
			ps2.setInt(1, 0);
			ps2.setString(2, name);
			ps2.setString(3, email);
			ps2.setString(4, pwd);
			ps2.setString(5, address);
			ps2.setString(6, latitude);
			ps2.setString(7, longitude);
			ps2.setDouble(8, 0.0);
			
			int i = ps2.executeUpdate();
			if(i>0) {
				PreparedStatement ps3 = ConnectDB.con.prepareStatement("delete from NewRegPetrolPump where id=?");
				ps3.setInt(1,Integer.parseInt(id));
				int a = ps3.executeUpdate();
				response.sendRedirect("ApprovePP.jsp");	
			}
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>