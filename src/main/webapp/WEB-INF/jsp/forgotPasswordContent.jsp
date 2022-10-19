<div id="main-content" class="uidai-mainbodyblock">
 <div class="container">
 	 <div id="maincontent" class="col-xs-12 col-sm-8" role="main">
 	 	<div class="row mt-20">
 	 		<div id="dvHomeBody" class="col-xs-12 mb-0 pb-10">
				    <br>
				    
				    <h3  class="login-title text-black text-center mb-3">Forgot Password</h3>
				   
				
					<form method="post" action="forgotPasswordRequest">
					
					<div class="form-group" id="name" >
							<label for="exampleInputEmail1">Enter Register Email Id or Mobile Number</label> <input
								type="text" name="emailOrMobile" class="form-control" id="name"
								placeholder="Registered Email or Mobile Number" required>
						</div>
						
						
						
						<% 
						String msg = (String) request.getAttribute("msg"); 
									String serv = (String) request.getAttribute("serv"); 
									if(serv!=null){ 
									%>
									<input type="hidden" value="<%=serv %>" name="serv">
									<%} %>
						
						<button type="submit" class="btn btn-default" >Submit</button>
					</form>
					<br>
					<h4 style="color:red">${msg}</h4>
					<br>
					<!-- <h6>Already an existing user?. <font size="3px"><a href="signup"><b>Login</b></a></font></h6>
	 -->
				<br>

			</div>
 	 	</div>
 	 </div>
 </div>
 <script>
 function selectOnlyThis(id,name){
	 var myCheckbox = document.getElementsByName("myCheckbox");
	  Array.prototype.forEach.call(myCheckbox,function(el){
	    el.checked = false;
	  });
	  id.checked = true;
	  if(name === 'mobile'){
		  document.getElementById("mobile").style.display = 'block';
		  document.getElementById("exampleInputEmail1").value = '';
		  document.getElementById("email").style.display = 'none';
		  
	  }else{
		  document.getElementById("email").style.display = 'block';
		  document.getElementById("mobile").style.display = 'none';
		  document.getElementById("MobileNo").value = '';
	  }
	}
 </script>