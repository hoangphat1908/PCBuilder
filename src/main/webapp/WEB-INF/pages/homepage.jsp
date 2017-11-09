<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>PCBuilder Home</title>
</head>
<body>
	<h3>UserList</h3>
    <table border="1" width="70%">
   		<tr>
   			<td>First Name</td>
   			<td>Last Name</td>
   			<td>Email</td>
   			<td>Password</td>
   		</tr>
   		<c:forEach items="${userList}" var="user">
   		<tr>
   			<td>${user.first}</td>
   			<td>${user.last}</td>
   			<td>${user.email}</td>
   			<td>${user.password}</td>
   		</tr>
   		</c:forEach>
   </table>
   <form:form id="registerForm" modelAttribute="user" method="POST">
   <table align="center">
       <tr>
           <td>
               <form:label path="first">First Name: </form:label>
           </td>
           <td>
               <form:input path="first" name="first" id="first" />
           </td>
       </tr>
       <tr>
           <td>
               <form:label path="last">Last Name:</form:label>
           </td>
           <td>
               <form:input path="last" name="last" id="last" />
           </td>
       </tr>
       <tr>
           <td>
               <form:label path="email">Email:</form:label>
           </td>
           <td>
               <form:input path="email" name="email" id="email" />
           </td>
       </tr>
       <tr>
           <td>
               <form:label path="password">Password:</form:label>
           </td>
           <td>
               <form:password path="password" name="password" id="password" />
           </td>
       </tr>
       <tr>
           <td></td>
           <td align="left">
               <form:button id="register" name="register">Register</form:button>
           </td>
       </tr>
   </table>
</form:form>
</body>
</html>
