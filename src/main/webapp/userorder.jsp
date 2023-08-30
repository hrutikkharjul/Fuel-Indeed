<%@ page import="java.sql.*" %>
<%@ page import="com.fuel.indeed.services.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Title mein kya rakha hai</title>
</head>
<body>

<%
	
	ConnectDB.connect();
	String pid = request.getParameter("id");
	int uid = ActiveUser.getId();
	String destlat = "";
	String destlng = "";
	try {
		
		PreparedStatement ps = ConnectDB.con.prepareStatement("select * from users where id=?");
		ps.setInt(1, uid);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			destlat = rs.getString("latitude");
			destlng = rs.getString("longitude");
		}
		PreparedStatement ps2 = ConnectDB.con.prepareStatement("insert into Booking values(?,?,?,?,?)");
		ps2.setInt(1, 0);
		ps2.setInt(2, uid);
		ps2.setString(3, pid);
		ps2.setString(4, destlat);
		ps2.setString(5, destlng);
		int i = ps2.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
</body>
</html>