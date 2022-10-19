<%@include file="adminHeader.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hamara.kendra.model.BookingServicesDetails" %>

<div id="main-content" class="uidai-mainbodyblock" onload="preloader();">

	<div class="container">
		<div id="maincontent" class="col-xs-12 col-sm-8" role="main">
			<div class="row mt-20">
				<div id="dvHomeBody" class="col-xs-12 mb-0 pb-10">
					<br>

					<%
					List<BookingServicesDetails> bookingService = (List<BookingServicesDetails>) request.getAttribute("listServices");
					if (bookingService != null && !bookingService.isEmpty()) {
					%>

					<table>
						<tr><th>Service Id</th>
						<th>Services Heading</th>
						<th>Actions</th>
						</tr>
						<tr><th></th></tr>
						<%
						for (BookingServicesDetails bookingservice : bookingService) {
						%>
						<tr>
						<td><%=bookingservice.getId()%></td>
							<td><%=bookingservice.getHeading()%></td>
							<td><a href="getDataToUpdate?id=<%=bookingservice.getId()%>">Edit</a></td>
						</tr>
						<%
						}
						%>
					</table>


					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>