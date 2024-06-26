<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.fuel.indeed.services.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>
  <title>Fuel Indeed</title>
  <!-- loader-->
  <link href="assets/css/pace.min.css" rel="stylesheet"/>
  <script src="assets/js/pace.min.js"></script>
  <!--favicon-->
  <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
  <!-- simplebar CSS-->
  <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
  <!-- Bootstrap core CSS-->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- animate CSS-->
  <link href="assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <!-- Icons CSS-->
  <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <!-- Sidebar CSS-->
  <link href="assets/css/sidebar-menu.css" rel="stylesheet"/>
  <!-- Custom Style-->
  <link href="assets/css/app-style.css" rel="stylesheet"/>
  
</head>

<body class="bg-theme bg-theme2">

<!-- start loader -->
   <div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
   <!-- end loader -->

<!-- Start wrapper-->
 <div id="wrapper">

  <!--Start sidebar-wrapper-->
  <div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
    <div class="brand-logo">
     <a href="index.html">
      <img src="assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
      <h5 class="logo-text">Fuel Indeed/h5>
    </a>
  </div>
<ul class="sidebar-menu do-nicescrol">
      <li class="sidebar-header">MAIN NAVIGATION</li>
      <li>
        <a href="ppdash.jsp">
          <i class="zmdi zmdi-view-dashboard"></i> <span>Update Fuel Available</span>
        </a>
      </li>

      <li>
        <a href="ppassignedbookings.jsp">
          <i class="zmdi zmdi-assignment-check"></i> <span>Assigned Bookings</span>
        </a>
      </li>

      <li>
        <a href="ppunassignedbookings.jsp">
          <i class="zmdi zmdi-assignment"></i> <span>Unassigned Bookings</span>
        </a>
      </li>

      <li>
        <a href="ppshowemp.jsp">
          <i class="zmdi zmdi-grid"></i> <span>Employees</span>
        </a>
      </li>

      <li>
        <a href="ppaddemp.html">
          <i class="zmdi zmdi-face"></i> <span>Add New Employee</span>
        </a>
      </li>

       <li>
        <a href="pplogin.html" target="_self">
          <i class="zmdi zmdi-account-circle"></i> <span>logout</span>
        </a>
      </li>

    </ul>
  
  </div>
   <!--End sidebar-wrapper-->

<!--Start topbar header-->
<header class="topbar-nav">
 <nav class="navbar navbar-expand fixed-top">
  <ul class="navbar-nav mr-auto align-items-center">
    <li class="nav-item">
      <a class="nav-link toggle-menu" href="javascript:void();">
       <i class="icon-menu menu-icon"></i>
     </a>
    </li>
    <li class="nav-item">
      <form class="search-bar">
        <input type="text" class="form-control" placeholder="Enter keywords">
         <a href="javascript:void();"><i class="icon-magnifier"></i></a>
      </form>
    </li>
  </ul>
     
  <ul class="navbar-nav align-items-center right-nav-link">
    <li class="nav-item">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
        <span class="user-profile"><img src="https://via.placeholder.com/110x110" class="img-circle" alt="user avatar"></span>
      </a>
  <!--
     <ul class="dropdown-menu dropdown-menu-right">
       <li class="dropdown-item user-details">
        <a href="javaScript:void();">
           <div class="media">
             <div class="avatar"><img class="align-self-start mr-3" src="https://via.placeholder.com/110x110" alt="user avatar"></div>
            <div class="media-body">
            <h6 class="mt-2 user-title">Sarajhon Mccoy</h6>
            <p class="user-subtitle">mccoy@example.com</p>
            </div>
           </div>
          </a>
        </li>
      </ul>
      --> 
    </li>
  </ul>
</nav>
</header>
<!--End topbar header-->

<div class="clearfix"></div>
	
  <div class="content-wrapper">
    <div class="container-fluid">
     
<!--End Row-->
        <div class="col-lg-15">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Employee Table</h5>
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">id</th>
                      <th scope="col">Name</th>
                      <th scope="col">Email</th>
                      <th scope="col">Mobile No.</th>
                      <th scope="col">Delete</th>
                    </tr>
                  </thead>
                  <tbody>
<%
	ConnectDB.connect();
	try {
		PreparedStatement ps = ConnectDB.con.prepareStatement("select * from emp where pid=?");
		ps.setInt(1, PPActive.getId());
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
%>	
	  	<tr>
          	<th scope="row"><%= rs.getInt("id") %></th>
          	<td><%= rs.getString("name") %></td>
          	<td><%= rs.getString("email") %></td>
          	<td><%= rs.getString("mobno") %></td>
     		<td><a href="ppdelemp.jsp?id=<%= rs.getInt("id")%>">Delete</a></td>
     	</tr>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
}
%>             
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div><!--End Row-->
        
	  
	  <!--start overlay-->
		  <div class="overlay toggle-menu"></div>
		<!--end overlay-->

    </div>
    <!-- End container-fluid-->
    
    </div><!--End content-wrapper-->
   <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
	
	<!--Start footer-->
	<footer class="footer">
      <div class="container">
        <div class="text-center">
          Copyright © 2023 Hrutik - Industries
        </div>
      </div>
    </footer>
	<!--End footer-->
	
	<!--start color switcher-->
   <div class="right-sidebar">
    <div class="switcher-icon">
      <i class="zmdi zmdi-settings zmdi-hc-spin"></i>
    </div>
    <div class="right-sidebar-content">

      <p class="mb-0">Gaussion Texture</p>
      <hr>
      
      <ul class="switcher">
        <li id="theme1"></li>
        <li id="theme2"></li>
        <li id="theme3"></li>
        <li id="theme4"></li>
        <li id="theme5"></li>
        <li id="theme6"></li>
      </ul>

      <p class="mb-0">Gradient Background</p>
      <hr>
      
      <ul class="switcher">
        <li id="theme7"></li>
        <li id="theme8"></li>
        <li id="theme9"></li>
        <li id="theme10"></li>
        <li id="theme11"></li>
        <li id="theme12"></li>
		<li id="theme13"></li>
        <li id="theme14"></li>
        <li id="theme15"></li>
      </ul>
      
     </div>
   </div>
  <!--end color switcher-->
   
  </div><!--End wrapper-->


  <!-- Bootstrap core JavaScript-->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/popper.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
	
  <!-- simplebar js -->
  <script src="assets/plugins/simplebar/js/simplebar.js"></script>
  <!-- sidebar-menu js -->
  <script src="assets/js/sidebar-menu.js"></script>
  
  <!-- Custom scripts -->
  <script src="assets/js/app-script.js"></script>
	
</body>
</html>
