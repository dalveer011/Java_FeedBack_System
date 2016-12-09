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
<title>Home</title>
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
      <a href="#top"><img src="<c:url value="/resources/images/logo.PNG" />" />
</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#home">Home<span class="sr-only">(current)</span></a></li>
        <li><a href="#AboutUs">About Us</a></li>
        <li><a href="#ContactUs">Contact Us</a></li>
        
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
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid" style="margin-top:0px;">
<div class="row spacingHome" id="home">
<div id="carousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel" data-slide-to="0" class="active"></li>
    <li data-target="#carousel" data-slide-to="1"></li>
    <li data-target="#carousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="<c:url value="/resources/images/carousel1.jpg" />" alt="...">
    </div>
    <div class="item">
      <img src="<c:url value="/resources/images/carousel2.jpg" />" alt="...">
    </div>
     <div class="item">
      <img src="<c:url value="/resources/images/img4.jpg" />" alt="...">
    </div>
    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="row" style="padding-top:30px;">
<div class="col-sm-4 verticalLine">
<img src="<c:url value ="/resources/images/survey.jpg"/>" class="img-responsive center-block "/>
<h2 class="text-center">Why Feedback is important ?</h2>
</div>
<div class="col-sm-6">
<p><strong>Feedback can motivate</strong> 
By asking for feedback, it can actually motivate employees to perform better. 
Employees like to feel valued and appreciate being asked to provide feedback that 
can help formulate business decisions. And feedback from client, suppliers, vendors, 
and stakeholders can be used to motivate to build better working relations</p><br>
<p><strong>Feedback can improve performance</strong>
Feedback is often mistaken for criticism. In fact, what is viewed as negative criticism is actually 
constructive criticism and is the best find of feedback that can help to formulate better decisions 
to improve and increase performance.
</p>
</div>
</div>
<div class="row">
<div class="col-sm-offset-4">
<blockquote>
  <p>Feedback is the breakfast of champions.</p>
  <footer>Ken Blanchard</footer>
</blockquote>
</div>
</div>
</div>
<hr>
<div id="AboutUs" style="padding-top:50px;padding-bottom:50px;">
<div class="row spacing">
<div class="col-sm-4 verticalLine">
<img src="<c:url value ="/resources/images/profile.gif"/>" class="img-responsive center-block img-circle "/>
<h2 class="text-center">Syed Mazhar<br> Hossain</h2>
</div>
<div class="col-sm-6">
<span>Il était une fois une maman cochon qui avait trois petits cochons.
Elle les aimait beaucoup, mais comme il n'y avait pas assez de nourriture pour  
qu'ils puissent</span>
</div>
</div>
<div class="row spacing">
<div class="col-sm-4 verticalLine">
<img src="<c:url value ="/resources/images/profile.gif"/>" class="img-responsive center-block img-circle "/>
<h2 class="text-center">Damil Panchal</h2>
</div>
<div class="col-sm-6">
<span>Il était une fois une maman cochon qui avait trois petits cochons.
Elle les aimait beaucoup, mais comme il n'y avait pas assez de nourriture pour  
qu'ils puissent</span>
</div>
</div>
<div class="row spacing">
<div class="col-sm-4 verticalLine">
<img src="<c:url value ="/resources/images/profile.gif"/>" class="img-responsive center-block img-circle "/>
<h2 class="text-center">Dalveer Singh</h2>
</div>
<div class="col-sm-6">
<span>Il était une fois une maman cochon qui avait trois petits cochons.
Elle les aimait beaucoup, mais comme il n'y avait pas assez de nourriture pour  
qu'ils puissent</span>
</div>
</div>
</div>
<hr>
<div class="row spacing" id="ContactUs" style="padding-top:50px;padding-bottom:50px;">
<h1 class="text-center header">Contact us</h1>
<section class="col-sm-6 col-sm-offset-3">
<form>
  <div class="form-group">
    <label for="email">Email address</label>
    <input type="email" class="form-control" id="email" placeholder="Email">
  </div>
  <div class="form-group">
    <label for="name">Name</label>
    <input type="text" class="form-control" id="name" placeholder="Name">
  </div>
  <div class="form-group">
    <label for="comments">Comments</label>
    <textarea type="text" class="form-control" id="comments" rows="15" cols="20" ></textarea>
  </div>
  <button type="submit" class="btn btn-success">Submit</button>
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
      <c:if test="${message == 'invalid password'}">
      <p>Please enter correct username and password <a href="./forgotPassword">Forgot Password</p>
      </c:if>
       <c:if test="${message != 'invalid password'}">
      <p>${message}</p>
      </c:if>
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
<script src="<c:url value="/resources/js/myScript.js"/>"></script>
</body>
</html>