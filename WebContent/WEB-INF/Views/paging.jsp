<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<html version="-//W3C//DTD HTML 4.01 Transitional//EN">

    <head>
        <!-- <style type="text/css">    
            .pg-normal {
                color: black;
                font-weight: normal;
                text-decoration: none;    
                cursor: pointer;    
            }
            .pg-selected {
                color: black;
                font-weight: bold;        
                text-decoration: underline;
                cursor: pointer;
            }
        </style> -->

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
	<!-- <link rel="stylesheet" href="css/style.css"> -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript">
	function Pager(tableName, itemsPerPage) {
	    this.tableName = tableName;
	    this.itemsPerPage = itemsPerPage;
	    this.currentPage = 1;
	    this.pages = 0;
	    this.inited = false;
	    
	    this.showRecords = function(from, to) {        
	        var rows = document.getElementById(tableName).rows;
	        // i starts from 1 to skip table header row
	        for (var i = 1; i < rows.length; i++) {
	            if (i < from || i > to)  
	                rows[i].style.display = 'none';
	            else
	                rows[i].style.display = '';
	        }
	    }
	    
	    this.showPage = function(pageNumber) {
	    	if (! this.inited) {
	    		alert("not inited");
	    		return;
	    	}

	        var oldPageAnchor = document.getElementById('pg'+this.currentPage);
	        oldPageAnchor.className = 'pg-normal';
	        
	        this.currentPage = pageNumber;
	        var newPageAnchor = document.getElementById('pg'+this.currentPage);
	        newPageAnchor.className = 'pg-selected';
	        
	        var from = (pageNumber - 1) * itemsPerPage + 1;
	        var to = from + itemsPerPage - 1;
	        this.showRecords(from, to);
	    }   
	    
	    this.prev = function() {
	        if (this.currentPage > 1)
	            this.showPage(this.currentPage - 1);
	    }
	    
	    this.next = function() {
	        if (this.currentPage < this.pages) {
	            this.showPage(this.currentPage + 1);
	        }
	    }                        
	    
	    this.init = function() {
	        var rows = document.getElementById(tableName).rows;
	        var records = (rows.length - 1); 
	        this.pages = Math.ceil(records / itemsPerPage);
	        this.inited = true;
	    }

	    this.showPageNav = function(pagerName, positionId) {
	    	if (! this.inited) {
	    		alert("not inited");
	    		return;
	    	}
	    	var element = document.getElementById(positionId);
	    	
	    	var pagerHtml = '<a onclick="' + pagerName + '.prev();" class="pg-normal"> &#171 Prev </a> | ';
	        for (var page = 1; page <= this.pages; page++) 
	            pagerHtml += '<a id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</a> | ';
	        pagerHtml += '<a onclick="'+pagerName+'.next();" class="pg-normal"> Next &#187;</a>';            
	        
	        element.innerHTML = pagerHtml;
	    }
	}


	</script>        
    </head>
    
    <body>
    <div class="container-fluid">
        <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="jumbotron">
                <h1>Student Feedback Questionnaire</h1>
                <p>Student Feedback Questionnaire is a means for students to provide information to faculty and administration to strengthen teaching effectivenss. As such it is a developmental/formative tool.Please answer thoroughly and honestly using the response scale provided by each question </p>
                <ul>
                    <li>All Questions are compulsory</li>
                    <li>All answers will be confidential and anonymous</li>
                </ul>
            </div>
        </div>
        </div>
        <div class="row">
        <div class="col-md-12">
            <form action="./addresponse" method="post" enctype="application/x-www-form-urlencoded">
         <input type="hidden" value="${studentid}" name="studentid"/>
         <input type="hidden" value="${courseid}" name="courseid"/>
        <table class="table table-hover" id="results">
          <thead>
            <tr>
                <th>Question</th>
                <th>Selection</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>The professor was well prepared for each class/lab<br>
                    <div>
                      <input type="radio" name="response1" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response1" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response1" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response1" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response1" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>
            <tr>
              <td>2</td>
              <td>The professor presented his/her materials in a clear manner<br>
                    <div>
                     <input type="radio" name="response2" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response2" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response2" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response2" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response2" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>
            <tr>
              <td>3</td>
              <td>The pace the proferssor set for the course for appropriate for me<br>
                    <div>
                      <input type="radio" name="response3" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response3" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response3" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response3" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response3" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>
            <tr>
              <td>4</td>
              <td>The professor helped me think critically about the topics in the course<br>
                    <div>
                      <input type="radio" name="response4" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response4" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response4" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response4" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response4" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>
            <tr>
              <td>5</td>
              <td>The professor used a variety of teaching methods(e.g., group work,multi-media,case studies,lecture etc).<br>
                    <div>
                      <input type="radio" name="response5" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response5" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response5" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response5" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response5" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            
             <tr>
              <td>6</td>
              <td>The professor treated me with courtesy.<br>
                    <div>
                      <input type="radio" name="response6" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response6" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response6" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response6" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response6" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>
             <tr>
              <td>7</td>
              <td>The professor provided clear explanation about student work would be evaluated in course  <br>
                    <div>
                      <input type="radio" name="response7" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response7" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response7" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response7" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response7" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>
             <tr>
              <td>8</td>
              <td>The way professor taught helped me learn<br>
                    <div>
                      <input type="radio" name="response8" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response8" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response8" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response8" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response8" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>
            <tr>
              <td>9</td>
              <td>The professor provided me with useful feedback about my progress<br>
                    <div>
                      <input type="radio" name="response9" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response9" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response9" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response9" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response9" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>

			<tr>
              <td>10</td>
              <td>The professor managed student classroom behaviour<br>
                    <div>
                      <input type="radio" name="response10" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response10" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response10" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response10" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response10" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>
            
            <tr>
              <td>11</td>
              <td>The professor motivated me to learn<br>
                    <div>
                     <input type="radio" name="response11" value="5" required>Strongly Agree &nbsp;<br>
                      <input type="radio" name="response11" value="4">Agree &nbsp;<br>
                      <input type="radio" name="response11" value="3">Disagree &nbsp;<br>
                      <input type="radio" name="response11" value="2">Strongly Disagree &nbsp;<br>
                      <input type="radio" name="response11" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>

            <tr>
              <td>12</td>
              <td>The professor responded to my course-related voice messages or emails within 2 school days<br>
                    <div>
                      <input type="radio" name="response12" value="5" required>Always &nbsp;<br>
                      <input type="radio" name="response12" value="4">Almost Always &nbsp;<br>
                      <input type="radio" name="response12" value="3">Rarely &nbsp;<br>
                      <input type="radio" name="response12" value="2">Never &nbsp;<br>
                      <input type="radio" name="response12" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>

            <tr>
              <td>13</td>
              <td>The professor returned assignemtns and tests within 2-week period.<br>
                    <div>
                      <input type="radio" name="response13" value="5" required>Always &nbsp;<br>
                      <input type="radio" name="response13" value="4">Almost Always &nbsp;<br>
                      <input type="radio" name="response13" value="3">Rarely &nbsp;<br>
                      <input type="radio" name="response13" value="2">Never &nbsp;<br>
                      <input type="radio" name="response13" value="1">Not applicable &nbsp;<br>
                     </div>
              </td>
              
            </tr>

            <tr>
              <td>14</td>
              <td>Compared with other courses i have taken this semester , my effort in this course was...<br>
                    <div>
                      <input type="radio" name="response14" value="3" required>Greater than in other courses &nbsp;<br>
                      <input type="radio" name="response14" value="2">Same as in other courses &nbsp;<br>
                      <input type="radio" name="response14" value="1">Less than in other courses &nbsp;<br>
                     </div>
              </td>
              
            </tr>

            <tr>
              <td>15</td>
              <td>Overall the learning experience in this course was <br>
                    <div>
                      <input type="radio" name="response15" value="4" required>Excellent &nbsp;<br>
                      <input type="radio" name="response15" value="3">Above Average &nbsp;<br>
                      <input type="radio" name="response15" value="2">Below Average &nbsp;<br>
                      <input type="radio" name="response15" value="1">Poor &nbsp;<br>
                     </div>
              </td>
              
            </tr>

            <tr>
                <td>16</td>
                <td>What did you like about this course?<br>
                <div>
                <textarea rows="5" cols="70" name="response16"placeholder="Enter your comments here" required></textarea>
                </div>
                </td>
            </tr>

            <tr>
                <td>17</td>
                <td>What would make this course a better learning experience?<br>
                <div>
                <textarea rows="5" cols="70" name="response17" placeholder="Enter your comments here" required></textarea>
                </div>
                </td>
            </tr>

          </tbody>
        </table>
            <div class="text-center">
                <div id="pageNavPosition"></div>
            <div><input type="submit"/>&nbsp;<input type="reset" /></div>
            </div>
        </form>        
        </div>
            
        </div> <!-- row -->
    </div><!-- container-fluid -->
    <script type="text/javascript"><!--
        var pager = new Pager('results', 5); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    //--></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    </body>

</html>
