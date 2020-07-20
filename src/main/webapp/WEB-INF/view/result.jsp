<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page isELIgnored="false" %>
  <%@ page import="java.util.*,com.marve.entity.Question" %>
<!DOCTYPE html>
<html>
<head>
<title>Result</title>
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
<h1>Marks: ${requestScope.marks}/${requestScope.size}</h1>
<a href="feedback.htm">Give Feedback</a><br>
	<%int i=0;%>
	<%LinkedList<Question> p=(LinkedList<Question>)request.getSession().getAttribute("test");%>
	<%ArrayList<String> j=(ArrayList<String>)request.getAttribute("answers");%>
<c:forEach var="l" items="${sessionScope.test}"> 
<h1><%=i+1%>. <c:out value="${l.question}"/></h1>
<label class="container"><c:out value="${l.opt1}"/>
  <input type="radio"  value="${l.opt1}" name="<%=i%>" <c:choose>
    <c:when test="${l.opt1==l.answer}">
        checked="checked"
    </c:when>    
    <c:otherwise>
        disabled 
    </c:otherwise>
</c:choose>>
  <span class="checkmark"></span>
</label>
<label class="container"><c:out value="${l.opt2}"/>
  <input type="radio" value="${l.opt2}" name="<%=i%>" <c:choose>
    <c:when test="${l.opt2==l.answer}">
        checked="checked"
    </c:when>    
    <c:otherwise>
        disabled 
    </c:otherwise>
</c:choose>>
  <span class="checkmark"></span>
</label>
<label class="container"><c:out value="${l.opt3}"/>
  <input type="radio" value="${l.opt3}" name="<%=i%>" <c:choose>
    <c:when test="${l.opt3==l.answer}">
        checked="checked"
    </c:when>    
    <c:otherwise>
        disabled 
    </c:otherwise>
</c:choose>>
  <span class="checkmark"></span>
</label>
<label class="container"><c:out value="${l.opt4}"/>
  <input type="radio" value="${l.opt4}" name="<%=i%>" 
  <c:choose>
    <c:when test="${l.opt4==l.answer}">
        checked="checked"
    </c:when>    
    <c:otherwise>
        disabled 
    </c:otherwise>
</c:choose>>
  <span class="checkmark"></span>
</label>
<c:choose>
    <c:when test="<%=j.get(i).equals(p.get(i).getAnswer())%>">
        <h3 style="color:#008000">Correct Answer</h3>
       <h2 style="color:#008000">YourAns: <%=j.get(i) %></h2>
    </c:when>    
    <c:otherwise>
        <h3   style="color:#FF0000">Wrong answer</h3>
         <h2 style="color:#FF0000">YourAns: <%=j.get(i) %> </h2>
    </c:otherwise>
</c:choose>
<br>
<%i++; %>
   </c:forEach>
</body>
</html>

