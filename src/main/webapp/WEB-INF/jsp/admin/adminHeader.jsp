<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" class="no-js lang-en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000046" />
<meta name="keywords" content="" />
<meta name="rights" content="." />
<meta name="robots" content="index, follow" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<title>Admin Dashboard - Hamara Kendra</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<c:url value="/css/mixed.min.css" var="jstlmixed" />
<link href="${jstlmixed}" rel="stylesheet" />


<c:url value="/css/chatbot.css" var="jstlCss222" />
<link href="${jstlCss222}" rel="stylesheet" />


<style type="text/css">
#js-mainnav.white ul.level1 .childcontent {
	margin: -20px 0 0 172px;
}

@media screen and (max-width: 767px) {
	#js-mainnav.megamenu.noJS ul.megamenu li {
		display: none;
	}
}
</style>

<c:url value="/js/jquery-3.3.1.min.js" var="jstlJs1" />
<script src="${jstlJs1}" type="text/javascript" />

<c:url value="/js/jquery-migrate.min.js" var="jstlJs2" />
<script src="${jstlJs2}" type="text/javascript" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<c:url value="/js/custom.js" var="jstlJs3" />
<script src="${jstlJs3}" type="text/javascript" defer="defer"
	async="async" />

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<c:url value="/js/chatBot.js" var="jstlJs34" />
<script src="${jstlJs34}" type="text/javascript" />


<c:url value="/css/style.css" var="jstlstyle" />
<link href="${jstlstyle}" rel="stylesheet" />

<c:url value="/css/admin/loader.css" var="jstlloaderstyle" />
<link href="${jstlloaderstyle}" rel="stylesheet" />

<c:url value="/js/preLoader.js" var="jstlreloaderstyleJS" />
<script src="${jstlreloaderstyleJS}"></script>



<script type="text/javascript">
	jQuery.noConflict();
	jQuery(document).ready(function() {
		jQuery(".child-class").find(".cs-top-gradient").remove();
		jQuery(".child-class").find(".content-body").remove();
	})

	jQuery(window).on('load', function() {

	});
	jQuery(document).ready(function() {
		jQuery(".child-class").find(".cs-top-gradient").remove();
		jQuery(".child-class").find(".content-body").remove();
	})

	function do_nothing() {
		return;
	}
</script>

</head>
<body class=" home no-background parentid-2376  com_content view-article  itemid-2376 guest  lang-en" >
<input type="hidden" name="servinf" value="M100
">
<div class="tj-overlay hide"></div>
<div class="wrapper">	
			<div id="header-top" class="uidai-header-top">
			<div class="container">
				<div class="row">
							<div class="tjbase-module language-switcher-desktop hidden-xs pull-right" id="tjmod-334">
								<div class="module-content">
						<div class="mod-languages">
								<form name="lang" method="post" action="#">
									<select class="inputbox advancedSelect"
										onchange="document.location.replace(this.value);"
										title="select a language">
										<option dir="ltr" value="/" selected="selected">
											English</option>
										<option dir="ltr" value="/hi/">
									</select> <span class="dropdown-arrow"></span>
								</form>

							</div>
							
					</div>

		</div>
		<div class="tjbase-module col-md-6 col-sm-7  hidden-xs  li-inline-block text-decoration-none  pull-right pr-0 mt-5" id="tjmod-332">
		<div class="module-content">
			<div class="custom"  >
				<ul class="list-unstyled separator-gray  m-0 pull-right">
				</ul>
	   		</div>
		</div>
		</div>
		</div>
		</div>
	</div>
	
	
	<!-- Header Start -->
	<div id="header" class="uidai-header">
		<!-- Logo Start -->
		<div id="header-logo" class="uidai-header-1">
		<div class="container">
		<div class="row">
		<div class="tjbase-module pull-left mt-5 mb-5 pr-15 col-xs-9 text-left" id="tjmod-270">
		<div class="module-content">
		<div class="custom"  >
			<p class="mb-0">
			<a href="/../">
			<img class="logo-xs" src="/img/logo.png" alt="hamarakendra" style="width: 110px;height:50px" /></a>
			</p>
		</div>
		</div>
		</div>
		<div class="tjbase-module pull-right mt-5 pr-15 col-xs-3 text-right" id="tjmod-443">
		<div class="module-content">	
		<div class="custom"  >
		<p class="mb-0">
			
		</p>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		<!-- Logo End -->
		
		<div class="contrast-bg">
		<div id="menuSearch-languagearea" class="uidai-header-2">
		<div class="container ">
		<div class="row">
	<div class="tjbase-module  Mod-headerMobileMenu pull-left pl-15 visible-xs visible-sm pt-10" id="tjmod-271">
		<div class="module-content">
		<div class="hamburger-toggle-btn cursor-pointer ripple" title="Navigation">
		
		</div>
		<div class="hamburger-toggle-block closed">
		<div class="hamburger-header col-xs-12 border-bottom"><span class="hamburger-close pull-left back-menu-icon" title="Close Navigation"></span>
		</div>

		<ul class="nav   nav-pills ">
		<li class="item-2376 current active deeper dropdown parent" data-menulevel=1><a class="dropdown-toggle" href="/"  
		data-toggle="dropdown">Update Services<em class="caret"></em></a>

		<ul class="dropdown-menu">
		<li class="item-2377 parent" data-menulevel=2><a href="" >List Of Services</a></li>
		</ul>

		</li>
		</div>

	<script>
	/*Mobile Menu*/
		jQuery('.hamburger-toggle-btn').click( function() {
			jQuery('.hamburger-toggle-block').toggleClass('closed');
			jQuery('.tj-overlay').removeClass('hide');
			jQuery('body').addClass('noscroll');
		});
		jQuery('.hamburger-close').click( function() {
			jQuery('.hamburger-toggle-block').addClass('closed');
			jQuery('.tj-overlay').addClass('hide');
			jQuery('body').removeClass('noscroll');
		});
		var containercart = jQuery(".hamburger-toggle-block");
		jQuery(document).ready(function(){
			jQuery(document).mouseup(function (ecart)
			{
				if ((!containercart.is(ecart.target) && containercart.has(ecart.target).length === 0))
				{
					containercart.addClass('closed');
					jQuery('.tj-overlay').addClass('hide');
					jQuery('body').removeClass('noscroll');
		
				};
			});
		});

		jQuery(document).on('click', '.hamburger-toggle-block a.dropdown-toggle em', function () {
		
		jQuery('.hamburger-toggle-block .nav-pills>li.deeper').not(jQuery(this).parents('li')).removeClass('open');
		jQuery(this).parents('li').toggleClass('open');
		
		return false;
		});
		//jQuery('.hamburger-toggle-block a.dropdown-toggle').removeAttr("href");
		</script>					</div>

	</div>
	
	<!-- Mobile Layout Menu Bar Start -->
	<div class="tjbase-module col-md-9  col-sm-8  col-xs-2 ttpl-megamenu hidden-xs hidden-sm" id="tjmod-297">
		<div class="module-content">
		<div id="js-mainnav" class="clearfix megamenu horizontal left white noJS">
		<div id="css3-megaMenuToggle" class="megaMenuToggle">
		Menu<span class="megaMenuToggle-icon"></span>
		</div>
		<div class="js-megamenu clearfix" id="js-meganav">
		<ul class="megamenu level0">
		
		<li  class="mega first haschild active submenu-align-auto">
		<a href="/"  class="mega first active " id="menu2376" ><span class="menu-title">
			<i class="font-icon "></i>Home</span></a>
		</li>
		
		<li  class="mega first haschild  submenu-align-auto">
			<a  class="mega first haschild active " id="menu2376" >
				<span class="menu-title"> <i class="font-icon "></i>Update Services</span>
			</a>
			<div class="childcontent cols6 ">
			<div class="childcontent-inner-wrap">
			<div class="childcontent-inner clearfix" style="width: 1024px;">
			<div class="megacol column1 first" style="width: 202px;">
				<ul class="megamenu level1">
				<li  class="mega first group submenu-align-fullwidth">
				<div class="group clearfix">
				<div class="group-title">
					<a href="listServices"  class="mega first group " id="menu2377" >
					<span class="menu-title">
					<i class="font-icon "></i>List Services</span></a>
				</div>
				<!-- <div class="group-content">
					<ul class="megamenu level1">
					<li  class="mega first submenu-align-auto">
						<a href="bookappointment?serv='newAadhaar'"  class="mega " id="menu2378" >
						<span class="menu-title">
						<i class="font-icon "></i>List of Services</span></a>
					</li>
						
					
					</ul>
				</div>
					 -->
			
				</div>
				</li>
				</ul>
			</div>
			
	
		
		
		
		</div></li>
		
		</ul>
		</div></div>
	</div>
	</div>
	<!-- Mobile Layout Menu Bar ENd -->
	
	<div class="tjbase-module pull-right pr-15 language-switcher-mobile border-sep-left visible-xs" id="tjmod-111">
	<div class="module-content">
	<div class="mod-languages">
	<form name="lang" method="post" action="#">
    	 <select class="inputbox advancedSelect" onchange="document.location.replace(this.value);" title="select a language">
			<option dir="ltr" value="/" selected="selected">
		English</option>	
		</select>
		<span class="dropdown-arrow"></span>
	</form>
	
	</div>
	</div>
	</div>
	
	<div class="tjbase-module search-mod pull-right simple-search" id="tjmod-1081">
	<div class="module-content">
	<div class="search-form-content">
	<div class="search-mod pull-right">
	</div>			
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	