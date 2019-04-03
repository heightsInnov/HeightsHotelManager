<%-- 
    Document   : checkin
    Created on : 24-Mar-2019, 10:24:03
    Author     : aojinadu
--%>

<%@page import="com.heights.model.SessionDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
							New Guest Check-In
						</header>
						<div class="panel-body" style="padding-top: 0px">
							<div class="form">
								<form class="form-validate form-horizontal " id="register_form" method="post" action="/CheckInServlet">
									<div class="form-group">
										<div class="col-lg-12">
											<div class="row">
												<div class="col-lg-4">
													<label for="firstname" class="control-label">First Name<span class="required">*</span></label>
													<input class=" form-control" id="firstname" name="firstname" type="text" placeholder="Enter firstname"/>
												</div>
												<div class="col-lg-4">
													<label for="middlename" class="control-label">Middle Name <span class="required">*</span></label>
													<input class=" form-control" id="middlename" name="middlename" type="text" placeholder="Enter middlename" />
												</div>
												<div class="col-lg-4">
													<label for="lastname" class="control-label">Last Name<span class="required">*</span></label>
													<input class=" form-control" id="lastname" name="lastname" type="text" placeholder="Enter lastname" />
												</div>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="col-lg-12">
											<div class="row">
												<div class="col-lg-4">
													<label for="phonenumber" class="control-label">Phone Number<span class="required">*</span></label>
													<input class=" form-control" id="phonenumber" name="phonenumber" type="tel" placeholder="Enter phonenumber"/>
												</div>
												<div class="col-lg-4">
													<label for="email" class="control-label">Email<span class="required">*</span></label>
													<input class=" form-control" id="email" name="email" type="email" placeholder="Enter email"/>
												</div>
												<div class="col-lg-4">
													<label for="maritalstatus" class="control-label">Marital Status<span class="required">*</span></label>
													<select class="form-control m-bot15" name="maritalstatus" id="maritalstatus">
														<option value="0">Select</option>
														<option>Single</option>
														<option>Married</option>
														<option>Divorced</option>
														<option>Widowed</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-lg-12">
											<div class="row">
												<div class="col-lg-4">
													<label for="sex" class="control-label">Gender<span class="required">*</span></label>
													<select class="form-control m-bot15" name="sex" id="sex">
														<option value="0">Select</option>
														<option>Male</option>
														<option>Female</option>
													</select>
												</div>
												<div class="col-lg-4">
													<label for="checkindate" class="control-label">Check-in Date<span class="required">*</span></label>
													<div class="input-append date" id="checkindate" name="checkindate" data-date="18-06-2013"
														 data-date-format="dd-mm-yyyy" data-date-viewmode="years">
														<input class="form-control" size="16" type="text" value="28-06-2013">
													</div>
												</div>
												<div class="col-lg-4">
													<label for="checkoutdate" class="control-label">Check-out Date<span class="required">*</span></label>
													<div class="input-append date" id="checkoutdate" name="checkoutdate" data-date="18-06-2013"
														 data-date-format="dd-mm-yyyy" data-date-viewmode="years">
														<input class="form-control" size="16" type="text" value="28-06-2013">
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="col-lg-12">
											<div class="row">
												<div class="col-lg-4">
													<label for="nok" class="control-label">Next of Kin<span class="required">*</span></label>
													<input class=" form-control" id="nok" name="nok" type="text" placeholder="Enter name of next of kin"/>
												</div>
												<div class="col-lg-4">
													<label for="nokphone" class="control-label">Phone number<span class="required">*</span></label>
													<input class=" form-control" id="nokphone" name="nokphone" type="tel" placeholder="Enter phone of next of kin"/>
												</div>
												<div class="col-lg-4">
													<label for="nokrelationship" class="control-label">Relationship<span class="required">*</span></label>
													<select class="form-control m-bot15" name="nokrelationship" id="nokrelationship">
														<option value="0">Select</option>
														<option>Sister</option>
														<option>Brother</option>
														<option>Mother</option>
														<option>Father</option>
														<option>Children</option>
														<option>Others</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-lg-12">
											<div class="row">
												<div class="col-lg-6">
													<label for="address" class="control-label">Guest Address<span class="required">*</span></label>
													<textarea class=" form-control" rows="4" draggable="false" id="address" name="address" placeholder="Enter address"></textarea>
												</div>
												<div class="col-lg-6">
													<label for="nokaddress" class="control-label">Next of Kin Address<span class="required">*</span></label>
													<textarea class=" form-control" rows="4" draggable="false" id="nokaddress" name="nokaddress" placeholder="Enter next of kin address"></textarea>
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-lg-4 pull-right">
										<div class="pull-right">
											<button class="btn btn-primary" type="submit">Save</button>
											<button class="btn btn-default" type="button">Cancel</button>
										</div>
									</div>
							</div>
							</form>
						</div>
				</div>
		</section>
	</div>
</div>
<!-- page end-->
</section>
<%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>