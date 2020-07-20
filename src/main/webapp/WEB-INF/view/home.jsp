<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<a href="test.htm">Create Test</a><br><br>
<a href="feedback.htm">Give Feedback</a><br><br>
<a href="tester.htm">click to Attempt Test</a>
<%
String a=(String)request.getAttribute("testid");
if(a!=null)
{
	out.println("  TestId:"+a);
	}
%>


</body>
</html>