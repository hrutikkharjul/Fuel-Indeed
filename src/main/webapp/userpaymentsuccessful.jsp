<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.razorpay.RazorpayClient, com.razorpay.RazorpayException, com.razorpay.Payment " %>
<%@ page import="com.fuel.indeed.services.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Amount</title>
</head>
<body>
<%
	ConnectDB.connect();
	String paymentId = request.getParameter("payment_id");
	int amount = ActiveUser.checkPayment(paymentId);
	amount/=100;
	int quantity = amount/125;
	int pid = PPActive.getId() ;
	int uid = ActiveUser.getId();
	String destlat = "";
	String destlng = "";
	String address = OrderDetails.getAddress();
	try {
		
		PreparedStatement ps = ConnectDB.con.prepareStatement("select * from users where id=?");
		ps.setInt(1, uid);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			destlat = OrderDetails.getLatitude();
			destlng = OrderDetails.getLongitude();
		}
		PreparedStatement ps2 = ConnectDB.con.prepareStatement("insert into Booking values(?,?,?,?,?,?,?,?,?,?,?)");
		ps2.setInt(1, 0);
		ps2.setInt(2, uid);
		ps2.setInt(3, pid);
		ps2.setString(4, destlat);
		ps2.setString(5, destlng);
		ps2.setInt(6, quantity);
		ps2.setString(7,paymentId);
		ps2.setString(8, address);
		ps2.setInt(9, OrderDetails.getRandInt());
		ps2.setString(10, "no");
		ps2.setInt(11, 0);
		int i = ps2.executeUpdate();
		if(i>0) {
			response.sendRedirect("userbookings.jsp");
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
</body>
</html>