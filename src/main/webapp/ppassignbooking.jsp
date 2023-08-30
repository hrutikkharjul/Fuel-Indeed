<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.fuel.indeed.services.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	String eid = request.getParameter("eid");
	String bid = request.getParameter("bid");
	ConnectDB.connect();
	try {
		PreparedStatement ps = ConnectDB.con.prepareStatement("update Booking set eid=? where bid=?");
		ps.setString(1, eid);
		ps.setString(2, bid);
		int i = ps.executeUpdate();
		if(i>0) {
			response.sendRedirect("ppunassignedbookings.jsp");
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>