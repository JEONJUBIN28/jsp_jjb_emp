<%@page import="edu.ict.prj.vo.EmpVO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>Emp EL</h1>
   <%
   EmpVO1 emp = new EmpVO1();
         emp.setEmpno(1000);
         emp.setEname("홍길동");
         	
         pageContext.setAttribute("emp", emp);
   %>
   ${emp.getEname()}<br>
   ${emp.ename}<br>
   
</body>
</html>