<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page isELIgnored="false" %>
  <%@ page import="java.util.*,com.marve.entity.Feedback" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="letstart.htm">
Enter TestId: 
<input type="text" name="testid" required/><br><br>
Enter user name: 
<input type="text" name="user" required/><br><br>
Enter Roll No.: 
<input type="text" name="roll" required/>
<br><br>
Enter Email: 
<input type="email" name="email" required/>
<br><br>
<input type="submit" name="start">
</form>
<br>
<%if(request.getAttribute("error")!=null)
      {%>
	<h2>  ${error}</h2>
	  
	 <%  }%>


</body>
</html>