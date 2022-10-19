<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head>
<title></title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<c:url value="/css/popup.css" var="popup" />
<link href="${popup}" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body onload="load()">

<%  

String msg = (String) request.getAttribute("msg");

String msgRes = (String) request.getAttribute("msgRes");


if(msgRes == "true"){

%>

<div class="container">
  <!-- Trigger the modal with a button 
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
-->
  <!-- Modal -->
  <div class="modal show" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Slot Booked Successfully</h4>
        </div>
        <div class="modal-body">
          <p>Thanks for booking slot we will notify you soon on the your booking status.</p>
          <br>
          <br>
          <center> <p>You can also provide your feedback on our service <a href="feedback">Feedback</a></p></center>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="redirect()">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<%
}

%>



<script type="text/javascript">
    $(window).on('load', function() {
        $('#myModal').modal('show');
    });
</script>

<script type="text/javascript">
  function redirect(){
	  var url = "/";
		window.location.href = url;
  }
</script>

</body>
</html>