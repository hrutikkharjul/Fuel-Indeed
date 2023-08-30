package com.fuel.indeed.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
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
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobno = request.getParameter("mobno");
		String pwd = request.getParameter("pwd");
		try {
			PreparedStatement ps = ConnectDB.con.prepareStatement("insert into users values(?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setString(4, mobno);
			ps.setString(5, pwd);
			int i = ps.executeUpdate();
			if(i>0) {
				response.sendRedirect("userlogin.html");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
