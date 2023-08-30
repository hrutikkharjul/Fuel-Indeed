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
		PreparedStatement ps = ConnectDB.con.prepareStatement("delete from PetrolPump where id=?");
		ps.setInt(1,Integer.parseInt(id));
		int i = ps.executeUpdate();
		if(i>0) {
			response.sendRedirect("admindash.jsp");
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>