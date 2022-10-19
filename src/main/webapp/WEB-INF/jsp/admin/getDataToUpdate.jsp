<%@include file="adminHeader.jsp" %>
<%@ page import="com.hamara.kendra.model.BookingServicesDetails" %>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>

<div id="main-content" class="uidai-mainbodyblock">
 <div class="container">
 	 <div id="maincontent" class="col-xs-12 col-sm-8" role="main">
 	 	<div class="row mt-20">
 	 		<div id="dvHomeBody" class="col-xs-12 mb-0 pb-10">
				    <br>
				    
				    <h3  class="login-title text-black text-center mb-3">UPDATE SERVICE</h3>
				   <%
				   
					BookingServicesDetails bookingService = (BookingServicesDetails) request.getAttribute("bookingService");
				   
				   %>
				
					<form method="post" action="updateBookingServiceDetails">
						<div class="form-group" id="email">
							<label for="exampleInputEmail1">URL NAME</label> <input
								type="text" name="urlName" value="<%=bookingService.getUrlName() %>" class="form-control" id="urlName"
								placeholder="URL NAME" readonly>
						</div>
						
						<div class="form-group" id="heading" >
							<label for="exampleInputEmail1">Heading</label> <input
								type="text" name="heading" class="form-control" id="heading"
								value="<%=bookingService.getHeading() %>"
								placeholder="Heading" >
						</div>
						<input type="hidden" value="<%=bookingService.getId() %>" name="id">
					
					 <textarea name="description1" id="editor"  >
           <%=bookingService.getDescription1() %>
        </textarea>
					 
					 
                <script>
                        ClassicEditor
                                .create( document.querySelector( '#editor' ) )
                                .then( editor => {
                                        console.log( editor );
                                } )
                                .catch( error => {
                                        console.error( error );
                                } );
                </script>
						
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
 