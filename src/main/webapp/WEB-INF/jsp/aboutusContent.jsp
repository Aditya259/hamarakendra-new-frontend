<%@ page import="java.util.List" %>
<div id="main-content" class="uidai-mainbodyblock">
	<div class="container">
		<div id="maincontent" class="col-xs-12 col-sm-8" role="main">
			<div class="row mt-20">
				<div id="dvHomeBody" class="col-xs-12 mb-0 pb-10">
				
					<h2>ABOUT US</h2>
					<br>
					
					<p>
					<h4>The government service offered through us</h4>
					
					
					</p>
					<p>
					Our center provides you with all the features. Such as Cast Certificate, Income Certificate, New Aadhaar, Aadhaar Correction, Aadhaar Smart Card, PAN Card, Passport, Gumasta, Smart Voting Card, Driving License, Cast Certificate, Non-Crimillier, Pratidnya Patra, Marriage Certificate, Gazette, Ration Card, Income Certificate, Food License, DomCL.
					</p>
					
					
					
					<p>
					<hr>
					<h4><b>Owner</b></h4>
					
					<b>Name: </b> Pritam Madhukar Khalode 
					M.Com (Royal Level Player) <br>
					<b>Mob.</b>9579004139 <br>
					<b>Email:</b> pritamkhalode@gmail.com <br>
					
					</p>
					<p >
						Pritam khalode completed M.Com and national Athletic Player of Baseball starter HAMRA KENDRA in 1-06-16 at Bhandewadi.
					</p>
					 
					<p >
						Now Growing Consistently by Opening two more branches at Padole Nagar and Bhandewadi.
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