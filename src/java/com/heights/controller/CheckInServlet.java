/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.heights.controller;

import com.heights.model.SessionDetails;
import com.heights.utils.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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
public class CheckInServlet extends HttpServlet {

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
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			HttpSession session = request.getSession(false);
			SessionDetails detail = (SessionDetails) session.getAttribute("login");
			if (detail != null && detail.getStaff_id() != null) {

				String fname, mname, lname, phone, email, mStatus, sex, cindate, coutdate, nokname, nokphone, nokrship,
						add, nokadd, booking_days, gno, roomNo = "";
				String message = "Error encountered!";
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

				fname = request.getParameter("firstname");
				mname = request.getParameter("middlename");
				lname = request.getParameter("lastname");
				phone = request.getParameter("phonenumber");
				email = request.getParameter("email");
				mStatus = request.getParameter("maritalstatus");
				sex = request.getParameter("sex");
				cindate = request.getParameter("checkindate");
				coutdate = request.getParameter("checkoutdate");
				nokname = request.getParameter("nok");
				nokphone = request.getParameter("nokphone");
				nokrship = request.getParameter("nokrelationship");
				add = request.getParameter("address");
				nokadd = request.getParameter("nokaddress");
				roomNo = request.getParameter("roomId");

				LocalDate cin = LocalDate.parse(cindate);
				LocalDate cout = LocalDate.parse(coutdate);
				booking_days = String.valueOf(cin.until(cout, ChronoUnit.DAYS));

				String[] fields = {fname, mname, lname, phone, email, mStatus, sex, cindate, coutdate, nokname, nokphone, nokrship,
					add, nokadd};

				for (String s : fields) {
					if (s.isEmpty()) {
						message = s + " field cannot be empty";
						request.setAttribute("message", message);
						RequestDispatcher rd = request.getRequestDispatcher("checkin.jsp");
						rd.include(request, response);
					}
				}
				gno = generateNumber();
				Connection con = null;
				PreparedStatement pst = null;
				ResultSet rs = null;
				PreparedStatement pst2 = null;
				ResultSet rs2 = null;
				try {
					con = DBConnection.getConn();
					con.setAutoCommit(false);
					Savepoint save1 = con.setSavepoint();
					String query = "insert into guest(address,"
							+ "booking_days,"
							+ "date_created,"
							+ "date_of_birth,"
							+ "email,"
							+ "firstname,"
							+ "guest_no,"
							+ "lastname,"
							+ "marrital_status,"
							+ "middlename,"
							+ "next_of_kin,"
							+ "nok_phone,"
							+ "phone_no,"
							+ "sex,"
							+ "staff_id,"
							+ "state,)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

					pst = con.prepareStatement(query);
					int i = 0;
					pst.setString(++i, add);
					pst.setString(++i, booking_days);
					pst.setString(++i, LocalDate.now().toString());
					pst.setString(++i, "");
					pst.setString(++i, email);
					pst.setString(++i, fname);
					pst.setString(++i, gno);
					pst.setString(++i, lname);
					pst.setString(++i, mStatus);
					pst.setString(++i, mname);
					pst.setString(++i, nokname);
					pst.setString(++i, nokphone);
					pst.setString(++i, phone);
					pst.setString(++i, sex);
					pst.setString(++i, detail.getStaff_id());
					pst.setString(++i, "Lagos");

					if (pst.execute()) {
						Date today = new Date();
						long booking_ref = today.getTime();
						String bookingQuery = "insert into bookings(booking_ref,"
								+ "booking_date,"
								+ "guest_no,"
								+ "hotel_id,"
								+ "room_id,"
								+ "staff_id)values(?,?,?,?,?,?)";

						int j = 0;
						pst = con.prepareStatement(bookingQuery);
						pst.setString(++j, String.valueOf(booking_ref));
						pst.setString(++j, sdf.format(today));
						pst.setString(++j, gno);
						pst.setString(++j, "");
						pst.setString(++j, roomNo);
						pst.setString(++j, detail.getStaff_id());

						if (pst.execute()) {
							con.commit();
							message = "Guest Checked successfully into room " + roomNo;
						} else {
							con.rollback(save1);
							message = "Error creating booking, Try again with correct values.";
						}
					}else{
						con.rollback(save1);
						message = "Error Saving Record, Try again with correct values.";
					}
				} catch (SQLException e) {
					e.getMessage();
				}
				request.setAttribute("message", message);
				RequestDispatcher rd = request.getRequestDispatcher("checkin.jsp");
				rd.forward(request, response);
			}else{
				request.setAttribute("message", "Unauthorized access, kindly login to proceed!");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
				
			}
		}
	}

	private static String generateNumber() {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		int nxtid = 0;
		try {
			con = DBConnection.getConn();
			String query = "select id from guest order by id desc limit 1";
			pst = con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				nxtid = id++;
			}
		} catch (Exception e) {
		} finally {
			DBConnection.closeConnections(con, pst, rs);
		}
		return "HT" + String.valueOf(nxtid);
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

	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date today = new Date();
		long time = today.getTime();
		Timestamp t = new Timestamp(time);
		System.out.println(sdf.format(today));
	}
}
