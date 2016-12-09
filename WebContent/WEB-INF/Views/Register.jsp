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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">

<link>
<title>Add Student</title>
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
      <a href="#top"><img src="<c:url value="/resources/images/logo.PNG" />" />
</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-navbar-collapse">
      <ul class="nav navbar-nav">
        <li><a href="../admin">Home<span class="sr-only">(current)</span></a></li>
        <li><a href="./search">Search</a></li>
        <li class="active"><a href="./register">Create Student</a></li>
        <li><a href="./addCourseDetails">Add Courses</a></li>
        <li><a href="./searchCourses">Delete Courses</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <input type="button" class="btn btn-danger" data-toggle="modal" data-target="#logOutWindow" value="Logout" id="logout" style=" margin-top:8px; margin-right:10px;"></li>
      </ul>
      </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid" style="margin-top:0px;">
<div class="row">
<div class="col-sm-4 col-sm-offset-4">
</div>
</div>
<div class="row">
<div class="jumbotron">
	<h1 class="text-center">Enter details here</h1>
</div>
<section class="col-sm-4 col-sm-offset-4">
<form method="post" action="./addstudent">
       <div class="form-group">
       <input type="text" class="form-control" name="studentNumber" placeholder="Enter Student Number" required>
       </div>
       <div class="form-group">
       <input type="text" class="form-control" name="firstName" placeholder="Enter First Name" required>
       </div>
       <div class="form-group">
       <input type="text" class="form-control" name="lastName" placeholder="Enter Last Name" required>
       </div>
       <div class="form-group">
       <select name="courseIds" multiple class="selectpicker form-control">
       <c:forEach items="${courses}" var="course">
   			<option value="${course.id}">${course.courseNum} &nbsp;${course.courseDescription}</option>
		</c:forEach>
		</select>
		</div>
       <div class="form-group">
       <input type="email" class="form-control" name="email" placeholder="Enter email" required>
       </div>
       <div class="form-group">
       <input type="hidden" class="form-control" name="password" value="password" placeholder="Enter Password" required>
       </div>
       
        <input type="submit" value="Add Student" class="btn btn-success">
       </form>
</section>
</div>
<div class="modal fade" id="MessageModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Information message</h4>
      </div>
      <div class="modal-body">
      <c:if test="${message == 'Account Created successfully'}">
      <p>${message}</p><br>
      <a href="./register" class="btn btn-success">Add Another</a>
      <a href="../admin" class="btn btn-success">Not now</a>
      </c:if>
      <c:if test="${message != 'Account Created successfully'}">
      <p>${message}</p><br>
      <a href="./register" class="btn btn-success">Ok</a>
      </c:if>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="logOutWindow">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title">Logout</h3>
                </div>

                <!-- body (form) -->
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                        	<label>Are you sure you want to logout?</label>
                        </div>
                    </form>
                </div>

                <!-- form with buttons -->
                <div class="modal-footer">
                	<form role="form" method="post" action="../logout">
                    	<input type ="submit" class="btn btn-primary btn-block" value="Yes">
                    	<button class="btn btn-danger btn-block" data-dismiss="modal">No</button>
                    </form> 
                </div>
            </div>
        </div>
    </div><!-- modal-dialog -->
</div>
<!-- Adding jQuery and Bootstrap javascript -->
<script
  src="https://code.jquery.com/jquery-3.1.1.js"
  integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
  crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
  integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>
  <script>
  $('.selectpicker').selectpicker({
  style: 'btn-default',
  size: 4
});
  </script>
  <c:if test="${message != null}">
<script>
$('#MessageModal').modal('show');
</script>
</c:if> 
  <script src="<c:url value="/resources/js/myScript.js"/>"></script>
</body>
</html>