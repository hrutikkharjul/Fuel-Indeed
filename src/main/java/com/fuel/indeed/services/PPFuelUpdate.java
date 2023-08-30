package com.fuel.indeed.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class PPFuelUpdate
 */
public class PPFuelUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PPFuelUpdate() {
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
		ConnectDB.connect();
		String fuel = request.getParameter("fuel");
		try {
			PreparedStatement ps = ConnectDB.con.prepareStatement("update PetrolPump set fuel_available=? where id=?");
			ps.setString(1, fuel);
			ps.setInt(2, PPActive.getId());
			int i = ps.executeUpdate();
			if(i>0) {
				response.sendRedirect("ppdash.jsp");
			}
		} catch(Exception e) {	
			e.printStackTrace();
		}
	}
}
