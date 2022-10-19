<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hamara Kendra Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="style.css">
    <c:url value="/css/admin/loginstyle.css" var="jstlloginstyle" />
	<link href="${jstlloginstyle}" rel="stylesheet" />
	<c:url value="/css/admin/loader.css" var="jstlloaderstyle" />
	<link href="${jstlloaderstyle}" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="/js/preLoader.js"></script>
	
</head>
<body onload="preloader();">
<div id="cover-spin"></div>
<main class="main">
    <div class="wrapper">
        <div class="card">
            <div class="title">
                <h1 class="title title-large">Sign In</h1>
                <p class="title title-subs"></p>
            </div>
            <br>
               <div class="line">
                <span class="line-bar"></span>
                <span class="line-bar"></span>
            </div>
            
            <form class="form" action="admin/adminLogin" method="post">
                <div class="form-group">
                    <input type="text" name="email" id="email" class="input-field" placeholder="Email address">
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="input-field" placeholder="Password">
                </div>
                <div class="form-group">
                   <!--  <a href="#" class="linktext">Forgot Password</a> -->
                    <input type="submit" name="submit"  class="input-submit" value="Login">
                </div>
                <br>
                <%
                String msg = (String) request.getAttribute("msg");
                if(msg!=null){
                %>
               <center><b><%=msg %></b></center> 
                
                <%} %>
            </form>
            <div class="line">
                <span class="line-bar"></span>
                <span class="line-bar"></span>
            </div>
            
        </div>
    </div>
</main>
</body>
</html>

