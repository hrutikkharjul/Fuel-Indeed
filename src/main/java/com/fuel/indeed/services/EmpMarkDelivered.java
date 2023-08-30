package com.fuel.indeed.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class EmpMarkDelivered
 */
public class EmpMarkDelivered extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpMarkDelivered() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String dcode = request.getParameter("dcode");
		String bid = EmpActive.getBid();
		ConnectDB.connect();
		try {
			PreparedStatement ps = ConnectDB.con.prepareStatement("select * from Booking where bid=? and dcode=?");
			ps.setString(1, bid);
			ps.setString(2, dcode);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				PreparedStatement ps2 = ConnectDB.con.prepareStatement("update Booking set isdelivered='yes' where bid=?");
				ps2.setString(1, bid);
				int i = ps2.executeUpdate();
				if(i>0) {
					response.sendRedirect("empdash.jsp");
				}
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
