<div id="main-content" class="uidai-mainbodyblock">
 <div class="container">
 	 <div id="maincontent" class="col-xs-12 col-sm-8" role="main">
 	 	<div class="row mt-20">
 	 		<div id="dvHomeBody" class="col-xs-12 mb-0 pb-10">
				    <br>
				    
				    <h3  class="login-title text-black text-center mb-3">Login</h3>
				   
				
					<form method="post" action="insertServiceMappedServie">
						<div class="form-group" id="email">
							<label for="exampleInputEmail1">URL NAME</label> <input
								type="text" name="urlName" class="form-control" id="urlName"
								placeholder="URL NAME" >
						</div>
						
						<div class="form-group" id="heading" >
							<label for="exampleInputEmail1">Heading</label> <input
								type="text" name="heading" class="form-control" id="heading"
								placeholder="Heading" >
						</div>
						
						<div class="form-group" id="description1" >
							<label for="exampleInputEmail1">description1</label> <textarea
								type="text" name="description1" class="form-control" id="description1"
								placeholder="description1" > </textarea>
						</div>
						
						<div class="form-group" id="description2" >
							<label for="exampleInputEmail1">description2</label> <textarea
								type="text" name="description2" class="form-control" id="description2"
								placeholder="description2" > </textarea>
						</div>
						
						<div class="form-group" id="description3" >
							<label for="exampleInputEmail1">description3</label> <textarea
								type="text" name="description3" class="form-control" id="description3"
								placeholder="description3" > </textarea>
						</div>
						
						
						<div class="form-group" id="description4" >
							<label for="exampleInputEmail1">description4</label> <textarea
								type="text" name="description4" class="form-control" id="description4"
								placeholder="description4" > </textarea>
						</div>
						
						
						<div class="form-group" id="description5" >
							<label for="exampleInputEmail1">description5</label> <textarea
								type="text" name="description5" class="form-control" id="description5"
								placeholder="description5" > </textarea>
						</div>
						
						
						<div class="form-group" id="description1" >
							<label for="exampleInputEmail1">description6</label> <textarea
								type="text" name="description6" class="form-control" id="description6"
								placeholder="description6" > </textarea>
						</div>
						
						<div class="form-group" id="description7" >
							<label for="exampleInputEmail1">description7</label> <textarea
								type="text" name="description7" class="form-control" id="description7"
								placeholder="description7" > </textarea>
						</div>
						
						<button type="submit" class="btn btn-default" >Submit</button>
					</form>
					
				<br>
				<%
				String msgRes = (String) request.getAttribute("msgRes"); 
				
				%>
				<div></div>
					<h4>${msg}</h4>
				</div>

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