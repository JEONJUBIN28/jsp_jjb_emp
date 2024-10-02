<%@page import="edu.ict.prj.vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="edu.ict.prj.Dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>dept 테이블 </h1>
	<%
		DeptDao dao = new DeptDao();
	
		List<DeptVO> deptList = dao.deptSelect();
		
		for(DeptVO vo : deptList){
			
			out.print("부서번호+" + vo.getDeptno() + "<br>");
			out.print("부서이름+" + vo.getDname() + "<br>");
			out.print("부서위치+" + vo.getLoc() + "<br>");
		}
	
	%>

</body>
</html>