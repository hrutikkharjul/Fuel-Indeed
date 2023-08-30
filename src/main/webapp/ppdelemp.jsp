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
<%
	ConnectDB.connect();
	String id = request.getParameter("id");
	try {
		PreparedStatement ps = ConnectDB.con.prepareStatement("delete from emp where id=?");
		ps.setString(1, id);
		int i = ps.executeUpdate();
		if(i>0) {
			response.sendRedirect("ppshowemp.jsp");	
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>