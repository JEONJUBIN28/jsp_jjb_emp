<%@page import="edu.ict.prj.vo.EmpVO1"%>
<%@page import="java.util.List"%>
<%@page import="edu.ict.prj.Dao.EmpDao1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>사원 정보</h1>
	<%
	p

		EmpDao1 dao = new EmpDao1();
		
		List<EmpVO1> empList = dao.empSelect();
		
		pageContext.setAttribute("empList", empList);
		
		/* out.println("사원번호 : " + vo.getEmpno() +"<br>");
		        out.println("이름 : " + vo.getEname() +"<br>");
		        out.println("직업 : " + vo.getJob() +"<br>");
		        out.println("매니저 : " + vo.getMgr() +"<br>");
		        out.println("입사일 : " + vo.getHiredate() +"<br>");
		        out.println("급여 : " + vo.getSal() +"<br>");
		        out.println("커미션 : " + vo.getComm() +"<br>");
		        out.println("부서번호 : " + vo.getDeptno() +"<br>");
		        out.println("<hr />"); */
	%>
	<c:forEach var="emp" items="${empList}">
		사원번호 : ${emp.getEmpno()} 사원이름 : ${emp.ename} 직업 : ${emp.job} 매니저 : ${emp.mgr} 입사일 : ${emp.hiredate} 급여 : ${emp.sal} 커미션 : ${emp.deptno} 부서번호 : ${emp.deptno}<br>
	
	</c:forEach>
   
</body>
</html>