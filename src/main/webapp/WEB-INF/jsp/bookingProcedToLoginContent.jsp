<div id="main-content" class="uidai-mainbodyblock">
<div class="container">
   <div id="maincontent" class="col-xs-12 col-sm-8 " role="main">
      <div class="row mt-20">
         <div id="dvHomeBody" class="col-xs-12 mb-0 pb-10 ">
            <br>
            <h3  class="login-title text-black text-center mb-3">Login</h3>
            <div >
               <label  for="">Login by - <span  class="required-star" style="color:red">*</span>
               </label>
               <table>
                  <tr>
                     <td>
                        <input class="form-check-input" name="myCheckbox" type="checkbox" value="mobileNo" onclick="selectOnlyThis(this,'mobile')"> 
                        <label class="form-check-label" for="flexCheckDefault"> Mobile Number </label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="form-check-input" checked name="myCheckbox" type="checkbox" value="emailId" onclick="selectOnlyThis(this,'email')"> 
                        <label class="form-check-label" for="flexCheckDefault"> Email Id </label>
                     </td>
                  </tr>
               </table>
            </div>
            <form method="post" action="submitDetails">
               <div class="form-group" id="email">
                  <label for="exampleInputEmail1">Email address</label> <input
                     type="text" name="email" class="form-control" id="exampleInputEmail1"
                     placeholder="Email" >
               </div>
               <div class="form-group" id="password">
                  <label for="exampleInputEmail1">Password</label> <input
                     type="password" name="password" class="form-control" id="password"
                     placeholder="" >
               </div>
               <div class="form-group" id="mobile" style="display: none">
                  <label for="exampleInputEmail1">MobileNo</label> <input
                     type="text" name="mobileno" class="form-control" id="MobileNo"
                     placeholder="Mobile Number" >
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
            <!-- <h6><font size="3px"><a href="forgotUserId?serv='signup'"><b>Forgot UserId / Email Id</b></a></font></h6>
               --><br>
            <h6><font size="3px"><a href="forgotPassword?serv='signup'"><b>Forgot Password</b></a></font></h6>
            <br>
            <h6>Not an existing user?. <font size="3px"><a href="signupNow?serv='signup'"><b>SignUp Now</b></a></font></h6>
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
   	  document.getElementById("password").style.display = 'none';
   	  document.getElementById("password").value = '';
   
   
   	  
     }else{
   	  document.getElementById("email").style.display = 'block';
   	  document.getElementById("mobile").style.display = 'none';
   	  document.getElementById("password").style.display = 'block';
   	  
   	  document.getElementById("MobileNo").value = '';
     }
   }
</script>