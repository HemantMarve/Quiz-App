<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>CGC|Test</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
   
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/test.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css"/>"/>   
  </head>
  <body >
  
  	<div class="ctrlqFormContentWrapper col-xs-12 col-sm-6 col-sm-offset-3 col-md-8 col-md-offset-2">
      <div class="ctrlqHeaderMast"></div>
      <div class="ctrlqCenteredContent">
        <div class="ctrlqFormCard">
          <div class="ctrlqAccent"></div>
          <div class="ctrlqFormContent">
          <h4>Question <c:out value='${sessionScope.qnumber}'/>   <br> <br>  TestID:<c:out value='${sessionScope.testid}'/></h4>

            <!-- <div class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1" id="formContainer"> -->
      <form name="Questionform" id="question" method="post" action="addquestion">
      
              <div class="row header">
                <div class="input-field col s12 navbar-collapse" align="center">
                  <h2 style="font-weight: bolder;">Test </h2>
                  <!-- <p><center>Your Feedback Matters</center> </p> -->
                </div>
             

              <div class="row">
                <div class="dynamiclabel form-group">
                  <textarea id="question" name="question" type="number" required class="form-control" data-error="#e2" required placeholder="Enter The Question..."></textarea>
                  <label for="question">Your Question</label>
                  <div id="e2"></div>
                  
                </div>
              </div>

              <div class="row">
                <div class="dynamiclabel form-group">
                  <input type="text" id="opt1" name="opt1" required class="form-control" data-error="#e3" required autofocus="" placeholder="Enter option 1...">
                  <label for="option">Option 1</label>
                  <div id="e3"></div>
                </div>
              </div>

              <div class="row">
                <div class="dynamiclabel form-group">
                  <input type="text" id="opt2" name="opt2" required class="form-control" data-error="#e4" required autofocus="" placeholder="Enter option 2...">
                  <label for="option">Option 2</label>
                  <div id="e4"></div>
                </div>
              </div>
              
              <div class="row">
                <div class="dynamiclabel form-group">
                  <input type="text" id="opt3" name="opt3" required class="form-control" data-error="#e5" required autofocus="" placeholder="Enter option 3...">
                  <label for="option">Option 3</label>
                  <div id="e5"></div>
                </div>
              </div>

              <div class="row">
                <div class="dynamiclabel form-group">
                  <input type="text" id="opt4" name="opt4" required class="form-control" data-error="#e6" required autofocus="" placeholder="Enter option 4...">
                  <label for="option">Option 4</label>
                  <div id="e6"></div>
                </div>
              </div>	

              <div class="row">
                <div class="dynamiclabel form-group">
                  <input type="text" id="answer" name="answer" required class="form-control" data-error="#e7" required autofocus="" placeholder="Answer ... ">
                  <label for="answer">Answer</label>
                  <div id="e7"></div>
                </div>
              </div>	
              <div class="row">
                <div class="input-field col m6 s12">
                <center>
                  <button type="reset" value="reset" class="btn btn-large">Reset</button>
                
                  <input type="submit" name="submitormore" value="AddMore" class="btn submitBtn"></input>            <input type="submit" name="submitormore" value="submittest" class="btn submitBtn"></input>
                  </center>
                </div>
              </div>

            </form>
            <!-- </div> -->
          </div>
        </div>
      </div>
    </div>

  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   

  </body>
</html>