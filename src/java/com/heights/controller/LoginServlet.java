/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.heights.controller;

import com.heights.model.SessionDetails;
import com.heights.model.StaffDetails;
import com.heights.utils.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aojinadu
 */
public class LoginServlet extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			/* TODO output your page here. You may use following sample code. */
			String username = request.getParameter("username").trim();
			String password = request.getParameter("password").trim();

			if (!username.isEmpty() && !password.isEmpty() && password.length() >= 6) {
				HttpSession session = request.getSession(true);
				System.out.println("++++++ session " + session + " +++++++");
				Connection con = null;
				PreparedStatement pst = null;
				ResultSet rs = null;

				PreparedStatement pst2 = null;
				ResultSet rs2 = null;
				StaffDetails st = new StaffDetails();
				String staffNo = null;

				try {
					con = DBConnection.getConn();
					pst = con.prepareStatement("select staff_id from login_tbl where username = " + username + " and password = " + password + " limit 1");
					rs = pst.executeQuery();
					if (rs != null) {
						while (rs.next()) {
							staffNo = rs.getString("Staff_id");
							pst2 = con.prepareStatement("select * from staff where staff_id = " + staffNo);
							rs2 = pst2.executeQuery();

							if (rs2 != null) {
								while (rs2.next()) {

									st.setStaff_id(rs2.getString("id"));
									st.setAdded_by(rs2.getString("added_by"));
									st.setAddress(rs2.getString("address"));
									st.setContract_years(rs2.getString("contract_years"));
									st.setDate_added(rs2.getString("date_added"));
									st.setDate_of_birth(rs2.getString("date_of_birth"));
									st.setEmail(rs2.getString("email"));
									st.setFirstname(rs2.getString("firstname"));
									st.setLastname(rs2.getString("lastname"));
									st.setMarrital_status(rs2.getString("marrital_status"));
									st.setMiddlename(rs2.getString("middlename"));
									st.setNext_of_kin(rs2.getString("next_of_kin"));
									st.setNok_phone(rs2.getString("nok_phone"));
									st.setPhone_no(rs2.getString("phone_no"));
									st.setPicture(rs2.getString("picture"));
									st.setSex(rs2.getString("sex"));
									st.setState(rs2.getString("state"));
								}
							}
						}
					}
					if (staffNo != null && st.getStaff_id()!= null) {
						SessionDetails std = new SessionDetails(username, staffNo);
						session.setAttribute("login", std);
						request.setAttribute("loginObject", st);
						RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
						rd.forward(request, response);
					} else {
						request.setAttribute("loginObject", "Invalid login credentials!");
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.include(request, response);
					}
				} catch (IOException | SQLException | ServletException e) {
				} finally {
					DBConnection.closeConnections(con, pst2, rs2);
					DBConnection.closeConnections(con, pst, rs);
				}
			}else{
				request.setAttribute("loginObject", "Username and password cannot be empty and password must be greater than 6 characters!");
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.include(request, response);
			}
		}catch(Exception e){
			request.setAttribute("loginObject", "Username and password cannot be empty and password must be greater than 6 characters!");
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.include(request, response);
		}
		finally {
			out.close();
		}
	}
	
	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}
