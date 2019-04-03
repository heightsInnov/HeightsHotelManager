<%-- 
    Document   : register_staff
    Created on : 24-Mar-2019, 10:09:51
    Author     : aojinadu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
							Register New Staff
						</header>
						<div class="panel-body" style="padding-top: 0px">
							<div class="form">
								<form class="form-validate form-horizontal " id="register_form" method="post" action="">
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
													<label for="dob" class="control-label">Date of Birth<span class="required">*</span></label>
													<input class=" form-control" id="dob" name="dob" type="text" placeholder="Enter date of birth"/>
												</div>
												<div class="col-lg-4">
													<label for="soo" class="control-label">State of Origin<span class="required">*</span></label>
													<input class=" form-control" id="soo" name="soo" type="text" placeholder="Enter state of origin"/>
												</div>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-lg-12">
											<div class="row">
												<div class="col-lg-4">
													<label for="country" class="control-label">Nationality<span class="required">*</span></label>
													<input class=" form-control" id="country" name="country" type="text" placeholder="Enter nationality"/>
												</div>
												<div class="col-lg-4">
													<label for="contract" class="control-label">Contract Years<span class="required">*</span></label>
													<select class="form-control m-bot15" id="contract" name="contract">
														<option value="0">Select</option>
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
													</select>
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
