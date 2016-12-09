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
<title>Register</title>
</head>
<body style="position:relative;" data-spy="scroll" style="padding-top:70px;">
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
      <div class="navbar-form navbar-right">
      <form action="./authentication" method="post">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Student Number" name="studentNumber" required>
          <input type="password" class="form-control" placeholder="Password" name="password" required>
        </div>
        <input type="submit" class="btn btn-default" value="Log In"/>
        <a href="./studentregister" id="btnRegister" class="btn btn-default">Register</a>
      </form> 
      
    </div>
      <!-- <div class="navbar-form navbar-right">
      <form>
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Student Id">
          <input type="password" class="form-control" placeholder="Password">
        </div>
        <button type="submit" class="btn btn-default">Log In</button>
        <a href="./studentregister" id="btnRegister" class="btn btn-default">New User</a>
      </form> 
      
    </div> -->
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid" style="margin-top:0px;">
<div class="row">
<h1 class="text-center">Enter details here</h1>
<section class="col-sm-4 col-sm-offset-4">
<form method="post" action="./activateStudent">
       <div class="form-group">
       <input type="text" class="form-control" name="studentnum" placeholder="Enter Student Number" required>
       </div>
       <div class="form-group">
       <input type="email" class="form-control" name="email" placeholder="Enter email" required>
       </div>
       <div class="form-group">
       <input type="password" class="form-control" name="password" placeholder="Enter Password" required>
       </div>
        <input type="submit" value="Register" class="btn btn-success">
        <a href="./home" type="button" class="btn btn-warning" data-dismiss="modal">Later</a>
       </form>
</section>
</div>
<div class="modal fade" id="MessageModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Information message</h4>
      </div>
      <div class="modal-body">
      <p>${message}</p><br><br>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
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
  <script src="<c:url value="/resources/js/myScript.js"/>" />
</body>
</html>