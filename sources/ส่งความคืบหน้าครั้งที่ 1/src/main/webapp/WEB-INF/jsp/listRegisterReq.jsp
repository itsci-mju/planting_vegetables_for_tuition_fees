<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,util.*,bean.*,java.text.SimpleDateFormat" %>
<%
    RegisterManager rg = new RegisterManager();
    List<member> member = rg.getMemberRequestProject();
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
    <title>รายนักศึกษาที่ขอเข้าร่วมโครงการ</title>
    <link rel="stylesheet" href="css/lisRegisterReq.css">
</head>
<body>
	<jsp:include page="basic/header.jsp" /> 
	<form class="fit"> 
    <div class="container" align="center">
        <h2 >รายนักศึกษาที่ขอเข้าร่วมโครงการ</h2>
        <p>" โครงการปลูกผักเเลกค่าเทอม "</p>  
    <div class="container-fluid" >       
        <table class="table table-hover" >
        <thead  align="center">
        
            <tr>
            <th>ลำดับที่</th>
            <th>รหัสนักศึกษา</th>
            <th>ชื่อ-นามสกุล</th>
            <th>คณะ</th>
            <th>สาขา</th>
            <th>###</th>
            </tr>
           
        </thead>
        <tbody  align="center">
        <%int num = 1; for(member m : member) {%>
            <tr>
            <td><%=num %></td>
            <td><%=m.getStudent_code()%></td>
            <td><%=m.getMember_name() %></td>
            <td><%=m.getStudent_faculty() %></td> 
            <td><%=m.getStudent_major() %></td>  
            <td>
                <a href="addShift?stu=<%=m.getStudent_code()%>">
                    <button type="button" class="btn btn-warning">ตรวจสอบ</button>
                </a>
            </td>
            </tr> 
           <%num++;} %>
                                        
        </tbody>
        </table>
        </div>  
    </div>
    </form>
    <jsp:include page="basic/footer.jsp" />
</body>
</html>