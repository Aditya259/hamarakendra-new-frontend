<div id="main-content" class="uidai-mainbodyblock">
 <div class="container">
 	 <div id="maincontent" class="col-sm-12" role="main">
 	 	<div class="row mt-20">
 	 		<div id="dvHomeBody" class="col-xs-12 ">
				    <br>
				    
				    <h3  class="login-title text-black text-center mb-3">Booking Details & Payment Details</h3>
				   
				    <div >
                       
                     
                    </div>
					<form method="post" action="processTransaction">
					<% String serv = (String) request.getAttribute("serv"); 
						String serviceName = (String) request.getAttribute("serviceName");
						String userName = (String) request.getAttribute("userName");
						String custName = (String) request.getAttribute("custName");

						String govFee="";
						String serviceCharge="";
						String total="";
						govFee = (String) request.getAttribute("GovFee");
						if(govFee==null || govFee.isEmpty()){
							 govFee="";
						}
						serviceCharge = (String) request.getAttribute("ServiceCharge");
						if(serviceCharge==null || serviceCharge.isEmpty()){
							 serviceCharge="";
						}
						total = (String) request.getAttribute("total");
						if(total==null || total.isEmpty()){
							 total="";
						}
						if(serv!=null){ 
						%>
						<input type="hidden" value="<%=serv %>" name="serv">
						<%} %>
						<%if(userName!=null){ %>
						<input type="hidden" value="<%=userName %>" name="userName">
						<%} %>
						<%if(custName!=null){ %>
						<input type="hidden" value="<%=custName %>" name="custName">
						<%} %>
						
						<hr>
						<div class="form-group" id="selectedService">
							<label for="exampleInputEmail1">Requested Service</label>&nbsp;&nbsp; :&nbsp;&nbsp;
							<label for="exampleInputEmail1"><%=serviceName.toString() %></label>
							
							<input
								type="hidden" name="selectedService" value="<%=serviceName.toString() %>" class="form-control" id="selectedService"
								placeholder="<%=serviceName.toString() %>" readonly="readonly" required>
						</div>
						<hr>
						<div class="form-group" id="name">
							<label for="exampleInputEmail1"></label>
							<table style="width:300px">
							<tr><td><b>Gov Fee : </b></td><td><%=govFee %></td></tr>
							<tr><td><b>Service Charge : </b></td><td><%=serviceCharge %></td></tr>
							<tr><td><b>Total : </b></td><td><%=total %></td></tr>
							</table>
						</div>
						<hr>
						<div class="form-group" id="name" >
							<label for="exampleInputEmail1"></label>
							<select  class="form-select" name="modeOfPayment" style="width:300px" aria-label="Default select example">
							<!-- <option value="" seletect>Select Mode Of Payment</option> -->
							<option value="cod" seletect>COD</option>
							</select>
						</div>
						 
						<button type="submit" class="btn btn-default" >Proceed For Booking</button>
					</form>
	
				<br>

			</div>
 	 	</div>
 	 </div>
 </div>