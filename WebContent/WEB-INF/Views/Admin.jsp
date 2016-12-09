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
<link rel="stylesheet" href = "<c:url value="/resources/css/adminCSS.css" />" />
<!-- Scripts to add functionality for toggle button -->
<link rel="stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-toggle/2.2.2/css/bootstrap-toggle.css" />
<link rel="stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-toggle/2.2.2/css/bootstrap-toggle.css" />
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

<title>Admin Home</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
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
        <li class="active"><a href="./admin">Home<span class="sr-only">(current)</span></a></li>
        <li><a href="./admin/search">Search</a></li>
        <li><a href="./admin/register">Create Student</a></li>
        <li><a href="./admin/addCourseDetails">Add Courses</a></li>
        <li><a href="./admin/searchCourses">Delete Courses</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <input type="button" class="btn btn-danger" data-toggle="modal" data-target="#logOutWindow" value="Logout" id="logout" style=" margin-top:8px; margin-right:10px;"></li>
      </ul>
      <!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid">
<section class="row">
<div class="jumbotron col-md-12">
    <h1 class="text-center">Welcome Admin</h1>
    <p class="text-center">You can change the course status here.</p>
  </div>  
</section>
<section class="row">
<div class="col-md-8 col-md-offset-2">
	<table class="table table-hover" >
  <thead>
    <tr>
      <th>Course Number</th>
      <th>Course Name</th>
      <th>Status</th>     
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${courses}" var="course">
   			<tr>
   				<td><c:out value="${course.courseNum}"></c:out></td>
   				<td><c:out value="${course.courseDescription}"></c:out></td>
   				<c:choose>
				    <c:when test="${course.active == '0'}">
				        <td>Not Active For Feedback</td>
				 <td><a href="./makeAvailable?id=${course.id}" class="btn btn-success">Activate</a></td>
				    </c:when>    
				    <c:otherwise>
				       	<td>Already Active</td>
				     <td><a href="./makeUnavailable?id=${course.id}" class="btn btn-danger">Deactivate</a></td>    	
				    </c:otherwise>
				</c:choose>
				<td>
					<a href="./generateReport?id=${course.id }" class="btn btn-warning">Report</a>
				</td>
				    </tr>
		</c:forEach>
  </tbody>
</table>
	</div>
	</section>
	
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
                	<form role="form" method="post" action="./logout">
                    	<input type ="submit" class="btn btn-primary btn-block" value="Yes">
                    	<button class="btn btn-danger btn-block" data-dismiss="modal">No</button>
                    </form> 
                </div>
            </div>
        </div>
    </div><!-- modal-dialog -->
	<div class="modal fade" id="MessageModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Information message</h4>
      </div>
      <div class="modal-body">
      <p>${message}</p><br>
      <button class="btn btn-success" data-dismiss="modal">Ok</a>
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
  <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
  <script src="<c:url value="/resources/js/search.js"/>"></script>
  <c:if test="${message != null}">
<script>
$('#MessageModal').modal('show');
</script>
</c:if> 
  <script src="<c:url value="/resources/js/myScript.js"/>"></script>
</body>
</html>