<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page import="java.util.*,org.itsci.vegetable.dao.*,org.itsci.vegetable.model.*,java.text.SimpleDateFormat" %>
    <% RegisterManager rg = new RegisterManager();
    List<Member> m = rg.getMember();
    
    Member member = (Member) session.getAttribute("showmember");
    
   	ProjectsManager pjm = new ProjectsManager();
	List<Projects> pj = pjm.getProjects(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table class="table table-hover" >
        <thead  align="center">
            <tr>
            <th>รหัสนักศึกษา</th>
            <th>ชื่อ-นามสกุล</th>
            <th>สาขา</th>
            <th></th>
            </tr>
        </thead>
        <tbody align="center">
        <%  
        	response.setContentType("application/vnd.ms-excel");
        	response.setHeader("Content-Disposition","inline;filename=listmember.xls");
        
        	Member mb = (Member) session.getAttribute("member");
        	for(Member mm : m) {%>
            <tr>
            <td><%= mm.getStudent_code() %></td>
            <td><%= mm.getMember_name() %></td>
            <td><%= mm.getStudent_major() %></td> 
            </tr> 
           <%} %>                             
        </tbody>
        </table>

</body>
</html>