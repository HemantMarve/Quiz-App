<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page isELIgnored="false" %>
  <%@ page import="java.util.*,com.marve.entity.Question" %>
<!DOCTYPE html>
<html>
<head>
<title>Test</title>
<style>
/* The container */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
</style>
</head>
<body>
<form action="submittest.htm" method="post">
	<%int i=1; %>
<c:forEach var="l" items="${sessionScope.test}"> 
<h1><%=i%>. <c:out value="${l.question}"/></h1>
<label class="container"><c:out value="${l.opt1}"/>
  <input type="radio"  value="${l.opt1}" name="<%=i%>">
  <span class="checkmark"></span>
</label>
<label class="container"><c:out value="${l.opt2}"/>
  <input type="radio" value="${l.opt2}" name="<%=i%>">
  <span class="checkmark"></span>
</label>
<label class="container"><c:out value="${l.opt3}"/>
  <input type="radio" value="${l.opt3}" name="<%=i%>">
  <span class="checkmark"></span>
</label>
<label class="container"><c:out value="${l.opt4}"/>
  <input type="radio" value="${l.opt4}" name="<%=i%>">
  <span class="checkmark"></span>
</label>
<input type="hidden" name="ans<%=i%>" value="${l.answer}" />
<br>
<%i++;%>
   </c:forEach>
   <input type="hidden" name="size" value="<%=i%>" />
   <input type="submit" value="Submit">
   </form>

</body>
</html>

