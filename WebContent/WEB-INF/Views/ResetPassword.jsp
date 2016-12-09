<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  adding bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
<link rel="stylesheet" href = "<c:url value="/resources/css/ourCSS.css" />" />
<link>
<title>Reset Password</title>
</head>
<body style="position:relative;" data-spy="scroll" data-target="#bs-navbar-collapse">
<nav class="navbar navbar-default navbar-fixed-top overflow">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="./home"><img src="<c:url value="/resources/images/logo.PNG" />" />
</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-navbar-collapse">
      <ul class="nav navbar-nav">
        <li class=""><a href="./home">Home<span class="sr-only">(current)</span></a></li>
        <li><a href="./home#AboutUs">About Us</a></li>
        <li><a href="./home#ContactUs">Contact Us</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid" style="padding-top:7%;">
<section class="row">
<div class="col-sm-4 col-sm-offset-4" style="background:lightgrey;padding:3%">
<h1 class="text-center">ResetPassword</h1>
<span class="text-center">&nbsp;&nbsp;&nbsp;To reset password follow these steps below<br>
1.Enter new password<br>
2.Re-enter the password<br>
3.Good to go Enjoy!!<br>
<form method="post" action="./resetProcessing" style="padding-top:5%;">
<div class="form-group">
<input type="password" name="password" class="form-control" placeholder="enter new password" required>
</div>
<div class="form-group">
<input type="password" name="newPassword" class="form-control" placeholder="confirm password" required>
</div>
<div class="form-group">
<input type="hidden" name="email" value="${email}">
</div>
<input type="submit" name="resetpassword" value="Reset Password" class="btn btn-success">
</form>
</div>
</section>
</div>
<!-- Adding jQuery and Bootstrap javascript -->
<script
  src="https://code.jquery.com/jquery-3.1.1.js"
  integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
  crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
  integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
  crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/myScript.js"/>"></script>
</body>
</html>