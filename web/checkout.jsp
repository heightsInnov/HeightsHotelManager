<%-- 
    Document   : checkout
    Created on : 24-Mar-2019, 12:34:57
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

			<!-- Inline form-->
			<div class="row">
				<div class="col-lg-6">
					<section class="panel">
						<header class="panel-heading">
							Guest Check Out
						</header>
						<div class="panel-body">
							<form role="form">
								<div class="form-group">
									<label for="guestno">Guest number</label>
									<input type="text" class="form-control" name="guestno" id="guestno" placeholder="Enter guest number">
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</section>
				</div>
				<div class="col-lg-6">
					<div class="row">
						<!-- profile-widget -->
						<div class="col-lg-12">
							<div class="profile-widget profile-widget-info">
								<div class="panel-body">
									<div class="col-lg-4 col-sm-4">
										<h4>Jenifer Smith</h4>               
										<div class="follow-ava">
											<img src="img/profile-widget-avatar.jpg" alt="">
										</div>
										<h6>Guest</h6>
									</div>
									<div class="col-lg-8 col-sm-8 follow-info">
										<p>Hello I’m Jenifer Smith, a leading expert in interactive and creative design.</p>
										<p>@jenifersmith</p>
										<p><i class="fa fa-twitter">jenifertweet</i></p>
										<h6>
											<span><i class="icon_clock_alt"></i>11:05 AM</span>
											<span><i class="icon_calendar"></i>25.10.13</span>
											<span><i class="icon_pin_alt"></i>NY</span>
										</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- page start-->
					<div class="row">
						<div class="col-lg-12">
							<section class="panel">
								<div class="panel-body">
									<section class="panel">
										<div class="panel-body bio-graph-info">
											<div class="row">
												<div class="bio-row">
													<p><span>First Name </span>: Jenifer </p>
												</div>
												<div class="bio-row">
													<p><span>Last Name </span>: Smith</p>
												</div>                                              
												<div class="bio-row">
													<p><span>Birthday</span>: 27 August 1987</p>
												</div>
												<div class="bio-row">
													<p><span>Country </span>: United</p>
												</div>
												<div class="bio-row">
													<p><span>Occupation </span>: UI Designer</p>
												</div>
												<div class="bio-row">
													<p><span>Email </span>:jenifer@mailname.com</p>
												</div>
												<div class="bio-row">
													<p><span>Mobile </span>: (+6283) 456 789</p>
												</div>
												<div class="bio-row">
													<p><span>Phone </span>:  (+021) 956 789123</p>
												</div>
											</div>
										</div>
                                    </section>
								</div>
							</section>
						</div>
					</div>
					<!-- page end-->
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
