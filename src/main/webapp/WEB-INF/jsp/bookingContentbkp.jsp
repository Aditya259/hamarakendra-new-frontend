<%@ page import="java.util.List" %>
<%@ page import="com.hamara.kendra.model.BookingServicesDetails" %>
<div id="main-content" class="uidai-mainbodyblock" >
	<div class="container">
	<br>
		<div id="maincontent" class="col-xs-12 col-sm-8" role="main" >
		
		<%  List<BookingServicesDetails> bookingService = (List<BookingServicesDetails>)request.getAttribute("pageContent"); 
					if(bookingService!=null && !bookingService.isEmpty()){
						
				%>
				
				
			<div class="row mt-20" >
				<div id="dvHomeBody" class="col-xs-12 mb-0 pb-10">
				
					<h2><%=bookingService.get(0).getHeading() %></h2>
					<p>
						<%=bookingService.get(0).getDescription1()%>
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
										<input type="submit" name="Button1"
											value="Proceed to Book Appointment"
											onclick="OpennewURL(<%=bookingService.get(0).getUrlName() %>);" id="Button1"
											class="btn btn-primary ripple my-10 full-width" />
									</div>
								</div>
								<hr class="hrWithBorder" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<%} %>
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