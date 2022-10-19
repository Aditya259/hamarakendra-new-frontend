<%@ page import="java.util.List"%>
<div id="main-content" class="uidai-mainbodyblock">
	<div class="container">
		<div id="maincontent" class="col-xs-12 col-sm-8" role="main">
			<div class="row mt-20">
				<div id="dvHomeBody" class="col-xs-12 mb-0 pb-10">

					<h2>Feedback</h2>
					<br>
					<p>
					<h5>Please provide your valuable feedback below.</h5>
					</p>

					<p>
						<br>
					<form method="post" action="submitFeedback">
						<div class="box" q_type="6">
							<input type="hidden" class="q_mandatory" value="1">
							<h4 class="ques_head">
								<span>Q1<span class="red">*</span>.
								</span> Please Rate our Feedback Service?
							</h4>
							<span class="star-rating"> <input type="radio"
								name="Q1" value="1"><i></i> <input type="radio"
								name="Q1" value="2"><i></i> <input type="radio"
								name="Q1" value="3"><i></i> <input type="radio"
								name="Q1" value="4"><i></i> <input type="radio"
								name="Q1" value="5"><i></i>
							</span>
						</div>
	<br>
		<br>

						<div class="box" q_type="6">
							<input type="hidden" class="q_mandatory" value="1">
							<h4 class="ques_head">
								<span>Q2<span class="red">*</span>.
								</span> How's the hamara kendra employee behavior?
							</h4>
							<textarea type="text" name="Q2" class="form-control"
								id="description" placeholder="Short Description"> Type here.</textarea>
						</div>

<br>
	<br>

						<div class="box" q_type="6">
							<input type="hidden" class="q_mandatory" value="1">
							<h4 class="ques_head">
								<span>Q3<span class="red">*</span>.
								</span> How much time they take to give you the service. 
							</h4>
							<textarea type="text" name="Q3" class="form-control"
								id="description" placeholder="Short Description"> Type here</textarea>
						</div>
<br>
	<br>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
					</p>

					<p>
					<hr>
					<h4>
						<b></b>
					</h4>

					<b> </b> <br> <b> </b> <br> <b> </b> <br>

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