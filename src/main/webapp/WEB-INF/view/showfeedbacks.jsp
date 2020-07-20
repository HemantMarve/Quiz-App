<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page isELIgnored="false" %>
  <%@ page import="java.util.*,com.marve.entity.Feedback" %>  
<!DOCTYPE html>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>

<table id="customers">
  <tr>
    <th>User</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>Code</th>
    <th>Feedback</th>
  </tr>
  <c:forEach var="listfeedbacks" items="${feedbacks}"> 
  <tr> 
  <td>${listfeedbacks.name}</td>
  <td>${listfeedbacks.email}</td>
  <td>${listfeedbacks.mobile}</td>
  <td>${listfeedbacks.code}</td>
  <td>${listfeedbacks.message}</td>
  </tr>
   </c:forEach>
</table>
</body>
</html>
