<%@page import="edu.ict.prj.Dao.EmpDao1"%>
<%@page import="edu.ict.prj.vo.EmpVO1"%>
<%@page import="edu.ict.prj.vo.DeptVO"%>
<%@page import="java.util.List"%>
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
   int empno =Integer.valueOf(request.getParameter("empno"));
            
            EmpDao1 dao = new EmpDao1();
            
            EmpVO1 vo = dao.oneSelect(empno);
            
            if(vo == null){
               out.print("해당 사원이 없습니다." + "<br>");         
            }else{
               
               out.println("사원번호 : " + vo.getEmpno() +"<br>");
               out.println("이름 : " + vo.getEname() +"<br>");
               out.println("직업 : " + vo.getJob() +"<br>");
               out.println("매니저 : " + vo.getMgr() +"<br>");
               out.println("입사일 : " + vo.getHiredate() +"<br>");
               out.println("급여 : " + vo.getSal() +"<br>");
               out.println("커미션 : " + vo.getComm() +"<br>");
               out.println("부서번호 : " + vo.getDeptno() +"<br>");
               out.println("<hr />");
            }
   %>
   <a href="emp_input.html">사원정보 입력</a>
   
</body>
</html>