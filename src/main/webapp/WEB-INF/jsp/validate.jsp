<div id="main-content" class="uidai-mainbodyblock">
 <div class="container">
 	 <div id="maincontent" class="col-xs-12 col-sm-8" role="main">
 	 	<div class="row mt-20">
 	 		<div id="dvHomeBody" class="col-xs-12 mb-0 pb-10">
				    <br>
				    
				    <h3  class="login-title text-black text-center mb-3">Validate OTP</h3>
				  
				    <div >
                       
                     
                    </div>
					<form method="post" action="validate">
						<div class="form-group" id="otp" onload="callOtp();">
							<label for="exampleInputEmail1">Enter OTP</label> <input
								type="text" name="otp" class="form-control" id="otp"
								placeholder="Enter OTP" required>
						</div>
						 <% String serv = (String) request.getAttribute("serv"); 
							String mobileNo = (String) request.getAttribute("mobileNo");
							String lastdigit = (String) request.getAttribute("lastdigit");
							String userName = (String) request.getAttribute("userName");
							String custName = (String) request.getAttribute("custName");
									
						if(serv!=null){ 
						%>
						<input type="hidden" value="<%=serv %>" name="serv">
						<%} %>
						<%
						if(userName!=null){ 
						%>
						<input type="hidden" value="<%=userName %>" name="userName">
						<%} %>
						<%
						if(custName!=null){ 
						%>
						<input type="hidden" value="<%=custName %>" name="custName">
						<%} %>
						<%if(mobileNo!=null){  %>
						<input type="hidden" value="<%=mobileNo %>" name="mobileNo">
						<%} %>
						<button type="submit" class="btn btn-default" >Submit OTP & Proced</button>
					</form>
					<br>
					<h4 style="color:red">${msg}</h4>
	
				<br>

			</div>
 	 	</div>
 	 </div>
 </div>
 
 <script type="text/javascript">
 function requestProcess(lastDigit){
	 alert(lastDigit);
	 
	 var settings = {
			  "url": "https://my.bulksmsplans.com/api/send_sms?api_id=API5YwmxE7C100099&api_password=%25242y%252410%2524FobnjjjLaZhkiiSQIU6he.v%252FINB2swqCThEOogpo9D9HZigCl1mRm&sms_type=Transactional&sms_encoding=text&sender=HAMKND&number=9359381611&message=HAMARA%20KENDRA%20OTP%20IS%20"+lastDigit+".%20THANK%20YOU%20HAMKND%20(HAMARA%20KENDRA)&template_id=121569",
			  "method": "GET",
			  "timeout": 0,
			};

			$.ajax(settings).done(function (response) {
			  console.log(response);
			});
	 
	 
 }
 
 
 </script>