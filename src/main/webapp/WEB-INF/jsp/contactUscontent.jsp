<%@ page import="java.util.List" %>
<div id="main-content" class="uidai-mainbodyblock">
	<div class="container">
		<div id="maincontent" class="col-xs-12 col-sm-8" role="main">
			<div class="row mt-20">
				<div id="dvHomeBody" class="col-xs-12 mb-0 pb-10">
				
					<h2>Contact Us</h2>
					<br>
					<p >
 						<h5>For any query, Do write to us.</h5>
 					</p>
					
					<p >

					<form method="post" action="submitContactUsDetails">
						<div class="form-group" id="email">
							<label for="exampleInputEmail1">Full Name</label> <input
								type="text" name="fullName" class="form-control" id="fullname"
								placeholder="Full Name" >
						</div>
						
						<div class="form-group" id="subject" >
							<label for="exampleInputEmail1">Subject</label> <input
								type="text" name="subject" class="form-control" id="subject"
								placeholder="Heading / Subject" >
						</div>
						
						<div class="form-group" id="mobileNo" >
							<label for="exampleInputEmail1">Mobile Number</label> <input
								type="text" name="mobileNo" class="form-control" id="mobileNo"
								placeholder="Mobile Number Without +91 & 0" >
						</div>
						
						<div class="form-group" id=emailId >
							<label for="exampleInputEmail1">Email Id</label> <input
								type="text" name="emailId" class="form-control" id="emailId"
								placeholder="Email Id" >
						</div>
						
						<div class="form-group" id="description1" >
							<label for="exampleInputEmail1">Description</label> <textarea
								type="text" name="description" class="form-control" id="description"
								placeholder="Short Description" > Short Description / Content / Query</textarea>
						</div>
						
						<button type="submit" class="btn btn-default" >Submit</button>
					</form>
					</p>
					
					<p>
					<hr>
					<h4><b></b></h4>
					
					<b> </b> <br>
					<b> </b> <br>
					<b> </b>  <br>
					
					</p>

				</div>
				<div id="statetab" class="radio-tab-content active">
					<div class=" col-xs-12 mb-10 pl-0 pr-0">
						<div class="col-xs-12 custom-form-style">
							<div class="form-group mb-20">
								<div class="selectbox-state">
									<h5 class="mb-10"></h5>
								</div>
								<div class="row buttons-groups text-center">
									<div class="col-xs-12 col-sm-12 col-md-5 text-center">
										<!-- <input type="submit" name="Button1"
											value="Proceed to Book Appointment"
											onclick="OpennewURL(/);" id="Button1"
											class="btn btn-primary ripple my-10 full-width" /> -->
									</div>
								</div>
								<hr class="hrWithBorder" />
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Main content below widgets -->

		</div>

		<%@include file="sidebar.jsp"%>

	</div>
	
	<script>
	function OpennewURL(serv){
		///alert("serv "+serv)
		var url = "bookingProceedToLogin?serv="+serv;
		window.location.href = url;
	}
	</script>