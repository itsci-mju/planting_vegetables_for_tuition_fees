<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*,util.*,bean.*,java.text.SimpleDateFormat" %>
    <% 
    	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");   	
    	sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
    	
    	memberManager mg = new memberManager();
    	RegisterManager rg = new RegisterManager();
    	
      	membershiftManager mgs = new membershiftManager(); 
    	
      	List<member_shifts> mbs = mgs.getListShifts();
      	
      	member mb = (member)session.getAttribute("member"); 
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mitr&family=Roboto+Condensed:wght@300;400;700&display=swap" >
<title>รายชื่อสมาชิกที่มาทำงาน</title>
</head>
<link rel="stylesheet" href="css/listShift.css">
<body>
<jsp:include page="basic/header.jsp" />   
	
	<form class="fit">
   	<div class="container" align="center">
        <h2 >รายชื่อสมาชิกที่มาทำงาน</h2>
        <p>" โครงการปลูกผักเเลกค่าเทอม "</p>            
        <table class="table table-hover" >
        
        <thead  align="center">
            <tr>
            <th>รหัสนักศึกษา</th>
            <th>ชื่อ-นามสกุล</th>
            <th>วันที่ทำงาน</th>
            <th></th>
            </tr>
        </thead>
        <tbody  align="center">
        	<% for(member_shifts ms : mbs ) {%>
            <tr>
            <td><%= rg.getstuCode(ms.getRegister().getRegister_id()).getStudent_code()%></td>
            <td><%= rg.getstuCode(ms.getRegister().getRegister_id()).getMember_name() %></td>
            <td><%= sdf.format(ms.getDate().getTime()) %></td>   
            <td>
                <a href="approveShift?id=<%=rg.getstuCode(ms.getRegister().getRegister_id()).getStudent_code()%>">
                    ตรวจสอบ
                </a>
            </td>
            </tr> 
            <% } %> 
        </tbody> 
        </table>
    </div>
     
    </form>
  
    <jsp:include page="basic/footer.jsp" />
</body>
</html>