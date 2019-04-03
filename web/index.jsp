<%@page import="com.heights.model.SessionDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	SessionDetails details = (SessionDetails)session.getAttribute("login");
	if(details == null || details.getUsername().isEmpty()){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
	<%@include file="WEB-INF/jspf/header.jspf" %>
	<body>
		<!-- container section start -->
		<section id="container" class="">

			<%@include file="WEB-INF/jspf/nav.jspf" %>

			<!--main content start-->

			<%@include file="WEB-INF/jspf/records.jspf" %>
			<div class="row">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading">
							Hotel Record
						</header>

						<table class="table table-striped table-advance table-hover">
							<tbody>
								<tr>
									<th width="20%"><i class="icon_profile"></i> Guest Name</th>
									<th width="10%"><i class="icon_rook"></i> Room No</th>
									<th width="15%"><i class="icon_mobile"></i> Mobile</th>
									<th width="10%"><i class="icon_check"></i> Days</th>
									<th width="15%"><i class="icon_calendar"></i> Check In</th>
									<th width="15%"><i class="icon_calendar"></i> Check Out</th>
									<th width="15%"><i class="icon_cogs"></i> Check Out</th>
								</tr>
								<tr>
									<td>Angeline Mcclain</td>
									<td>2004-07-06</td>
									<td>07037952273</td>
									<td>2</td>
									<td>Rosser</td>
									<td>176-026-5992</td>
									<td>
										<div class="btn-group">
											<!--<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>-->
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<!--<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>-->
										</div>
									</td>
								</tr>
								<tr>
									<td>Sung Carlson</td>
									<td>2011-01-10</td>
									<td>07037952273</td>
									<td>2</td>
									<td>Robert Lee</td>
									<td>724-639-4784</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
								<tr>
									<td>Bryon Osborne</td>
									<td>2006-10-29</td>
									<td>07037952273</td>
									<td>2</td>
									<td>York</td>
									<td>180-456-0056</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
								<tr>
									<td>Dalia Marquez</td>
									<td>2011-12-15</td>
									<td>07037952273</td>
									<td>2</td>
									<td>Alton</td>
									<td>690-601-1922</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
								<tr>
									<td>Selina Fitzgerald</td>
									<td>2003-01-06</td>
									<td>07037952273</td>
									<td>2</td>
									<td>Waelder</td>
									<td>922-810-0915</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
								<tr>
									<td>Abraham Avery</td>
									<td>2006-07-14</td>
									<td>07037952273</td>
									<td>2</td>
									<td>Harker Heights</td>
									<td>511-175-7115</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
								<tr>
									<td>Caren Mcdowell</td>
									<td>2002-03-29</td>
									<td>07037952273</td>
									<td>2</td>
									<td>Blackwell</td>
									<td>970-147-5550</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
								<tr>
									<td>Owen Bingham</td>
									<td>2013-04-06</td>
									<td>07037952273</td>
									<td>2</td>
									<td>Rule</td>
									<td>934-118-6046</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
								<tr>
									<td>Ahmed Dean</td>
									<td>2008-03-19</td>
									<td>07037952273</td>
									<td>2</td>
									<td>Darrouzett</td>
									<td>338-081-8817</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>
								<tr>
									<td>Mario Norris</td>
									<td>2010-02-08</td>
									<td>07037952273</td>
									<td>2</td>
									<td>Amarillo</td>
									<td>945-547-5302</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
											<a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
											<a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
										</div>
									</td>
								</tr>                              
							</tbody>
						</table>
					</section>
				</div>
			</div>
			<!-- page end-->
		</section>
		<%@include file="WEB-INF/jspf/footer.jspf" %>
	</body>
</html>
