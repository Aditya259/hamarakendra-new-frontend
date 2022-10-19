<div id="main-content" class="uidai-mainbodyblock">
 <div class="container">
 	 <div id="maincontent" class="col-sm-12" role="main">
 	 	<div class="row mt-20">
 	 		<div id="dvHomeBody" class="col-xs-12 ">
				    <br>

				    <h3  class="login-title text-black text-center mb-3">Booking Details </h3>
				   
				    <div >
                       
                     
                    </div>
					<form method="post" action="SaveBookingDetails">
					<% String serv = (String) request.getAttribute("serv"); 
					String serviceName = (String) request.getAttribute("serviceName");
					String userName = (String) request.getAttribute("userName");
					String custName = (String) request.getAttribute("custName");
					
					
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
					
						<div class="form-group" id="name">
							<label for="exampleInputEmail1">Enter Full Name</label> <input
								type="text" name="name" class="form-control" id="name"
								placeholder="Enter Full Name" required>
						</div>
						<div class="form-group" id="mobileNo">
							<label for="exampleInputEmail1">Enter Valid Mobile Number</label> <input
								type="text" name="mobileNo" class="form-control" id="mobileNo"
								placeholder="Enter without +91 and without 0 Ex- 9000000000" required>
						</div>
						<div class="form-group" id="emailId">
							<label for="exampleInputEmail1">Enter Valid Email Id</label> <input
								type="text" name="emailId" class="form-control" id="emailId"
								placeholder="XYZ@ABC.com" required>
						</div>
						<div class="form-group" id="address1">
							<label for="exampleInputEmail1"></label> <input
								type="checkbox" name="checkBoxAddress"  id="checkBoxAddress"
								onclick="enableCreateUser()" checked required> <b> &nbsp;Fetch Location Automatically </b>
						</div>
						<div class="form-group" id="address1">
							<label for="exampleInputEmail1">Note: Verify your location address before proceeding further.<br>
							If find any discrepancy kindly edit before submitting </label> 
						</div>
						<div class="form-group" id="user_register">
							<label for="exampleInputEmail1">Enter Valid Address Line 1 ( Flat No/ Plot No , Apartment/Home Name )</label> <input
								type="text" name="address1" class="form-control" id="address12"
								placeholder="Flat No/ Plot No , Apartment/Home Name" required >
						</div>
						<div class="form-group" id="user_register2">
							<label for="exampleInputEmail1">Enter Valid Address Line 2 (Locality,Area / Nearest Land Mark) </label> <input
								type="text" name="address2" class="form-control" id="address2"
								placeholder="Locality,Area / Nearest Land Mark" required>
						</div>
						<div class="form-group" id="user_register3">
							<label for="exampleInputEmail1">Enter Valid Address Line 3 (City, State, Country, Pincode) </label> <input
								type="text" name="address3" class="form-control" id="address3"
								placeholder="Nagpur, Maharashtra, India Pincode- 440001 " required>
						</div>
						<div class="form-group" id="date">
							<label for="exampleInputEmail1">Enter Available Booking slot Date</label> <input
								type="date" name="date" class="form-control" id="date"
								placeholder="Enter Valid Booking Date" required>
						</div>
						<div class="form-group" id="date">
							<label for="exampleInputEmail1">Enter Available Booking slot Time</label> 
							<br>
							<select  id="selectTimeSlot" name="timeSlot" class="form-control" required>
							<option value="" selected disabled>Please Select Desired Timeslot</option>
							<option value="10.00 AM">10.00 AM</option>
							<option value="10.30 AM">10.30 AM</option>
							<option value="11.00 AM">11.00 AM</option>
							<option value="11.30 AM">11.30 AM</option>
							<option value="12.00 PM">12.00 PM</option>
							<option value="12.30 PM">12.30 PM</option>
							<option value="01.00 PM">01.00 PM</option>
							<option value="01.30 PM">01.30 PM</option>
							<option value="02.00 PM">02.00 PM</option>
							<option value="02.30 PM">02.30 PM</option>
							<option value="03.00 PM">03.00 PM</option>
							<option value="03.30 PM">03.30 PM</option>
							<option value="04.00 PM">04.00 PM</option>
							<option value="04.30 PM">04.30 PM</option>
							<option value="05.30 PM">05.30 PM</option>
							<option value="06.00 PM">06.00 PM</option>
							<option value="06.30 PM">06.30 PM</option>
							<option value="07.00 PM">07.00 PM</option>
							</select>
						</div>
						<div class="form-group" id="selectedService">
							<label for="exampleInputEmail1">Selected Service</label> <input
								type="text" name="selectedService" value="<%=serviceName.toString() %>" class="form-control" id="selectedService"
								placeholder="<%=serviceName.toString() %>" readonly="readonly" required>
						</div>
						 
						 <div class="form-group" id="selectedService">
							<label for="exampleInputEmail1"></label>
							<input type="checkbox" name="consent" required> I abide all the terms and conditions of Hamara Kendra Nagpur, and I'm aware of government charges and hamara kendra Charges and I'm fully agreed to pay this.
						</div>
						
						<button type="submit" class="btn btn-default" >Submit Booking Details</button>
					</form>
	
				<br>

			</div>
 	 	</div>
 	 </div>
 </div>
 
 <script type="text/javascript">
 
		
		function enableCreateUser() {
			if (document.getElementById("checkBoxAddress").checked) {
				//get lat and long
				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(showPosition);
				} else {
					x.innerHTML = "Geolocation is not supported by this browser.";
				}

				//call location api

			} else {
				document.getElementById("address12").value = "";
      			document.getElementById("address2").value = "";
      			document.getElementById("address3").value =  "";
			}

		}

		
		function showPosition(position) {
			/* alert('Latitude: ' + position.coords.latitude + 'Longitude: '
					+ position.coords.longitude); */
			
			//call location api
			$.post('getLocation', {lat:position.coords.latitude, lng:position.coords.longitude}, function(response){ 
      			//alert("success");
      			var valueOfField = response.data.subArea1;
      			document.getElementById("address12").value = valueOfField;
      			document.getElementById("address2").value = valueOfField;
      			document.getElementById("address3").value =  response.data.city+", "+response.data.state+", "+response.data.country+", "+ response.data.postcode ;
      			//$("#mypar").html(response.amount);
			});
			
			
		}
	</script>
 
 