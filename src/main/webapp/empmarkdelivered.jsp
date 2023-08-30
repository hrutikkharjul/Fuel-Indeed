<!DOCTYPE html>
<%@page import="com.fuel.indeed.services.EmpActive"%>
<html lang="en">
<head>
  <title>Hrutik Industries</title>
</head>

<body >
           <%
           	String bid = request.getParameter("bid");
           	EmpActive.setBid(bid);
           	response.sendRedirect("empmarkd.html");
           %>
            
</body>
</html>
