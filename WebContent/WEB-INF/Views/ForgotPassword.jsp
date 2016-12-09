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
<title>Forgot Password</title>
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
        <li><a href="./home">Home<span class="sr-only">(current)</span></a></li>
        <li><a href="./home#AboutUs">About Us</a></li>
        <li><a href="./home#ContactUs">Contact Us</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid" style="padding-top:7%;">
<section class="row">
<div class="col-sm-4 col-sm-offset-4" style="background:lightgrey;padding:3%">
<h1 class="text-center">Forgot Password</h1>
<span class="text-center">&nbsp;&nbsp;&nbsp;Forgot password Don't worry follow these steps below<br>
1.Enter you student id and click on Reset Password Button<br>
2.We will send you a reset password email follow the link<br>
3.On new page enter your password<br>
<form method="post" action="./sendemail" style="padding-top:5%;">
<div class="form-group">
<input type="text" name="studentid" class="form-control" placeholder="enter student id" required>
</div>
<input type="submit" name="forgotpassword" value="Reset Password" class="btn btn-success">
</form>
</div>
</section>
<div class="modal fade" id="MessageModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Student id not registered</h4>
      </div>
      <div class="modal-body">
     <p>${message}</p>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
</div>
<!-- Adding jQuery and Bootstrap javascript -->
<script
  src="https://code.jquery.com/jquery-3.1.1.js"
  integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
  crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
  integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
  crossorigin="anonymous"></script>
 <c:if test="${message != null}">
<script>
$('#MessageModal').modal('show');
</script>
</c:if>
<script src="<c:url value="/resources/js/myScript.js"/>"></script>
</body>
</html>