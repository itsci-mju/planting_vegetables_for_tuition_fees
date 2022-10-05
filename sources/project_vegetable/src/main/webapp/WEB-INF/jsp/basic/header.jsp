<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="org.itsci.vegetable.model.*,org.itsci.vegetable.dao.*,java.util.*,java.text.SimpleDateFormat"  %>
    <%
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
    memberManager mbm = new memberManager();
	logins log = new logins();
	member mb = new member();
	String member_type = null;
	try{
			log = (logins)session.getAttribute("login");
			mb = mbm.getMember(log.getMember().getMember_id());		
	}catch (Exception e) {	
	}

    %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mitr&family=Roboto+Condensed:wght@300;400;700&display=swap" >
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script> 
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="css/footer.css">
<meta charset="UTF-8">
<title>โครงการปลูกผักแลกค่าเทอม</title>
</head>
<body>
   <header class="header_page">
        <div class="logo_main">
            <img src="img/logo.png" class="logo_img">
        </div>
        <div class="web_name">
            <p class="wn1">โครงการปลูกผักแลกค่าเทอม</p>
            <p class="wn2">Maejo University</p>
        </div>
        
         <% if(log != null){ %>
         <%if(log.getStatus()==1){ %>
	        <!-- nav member -->
	        <nav class="nav_bar">
	            <ul>
	                <li><a href="goHomepage">หน้าแรก</a></li>
	                <li><a href="goAddshift">บันทึกเวลาทำงาน</a></li>
	                <li><a href="#">ผลประกอบการ</a></li>
	                <li><a href="#">สถิติการทำงาน</a></li>
	                <li><a href="goViewprofile">ข้อมูลส่วนตัว</a></li>   
	                <li><a href="dologout">ออกจากระบบ</a></li>
	            </ul>
	        </nav>
	        		<%}else if(log.getStatus()==2){ %>
	        <!-- nav shief -->
	         <nav class="nav_bar">
	            <ul>
	                <li><a href="goHomepage">หน้าแรก</a></li>
	                <li><a href="goListall">รายรับรายจ่ายของโครงการ</a></li>
	                <li><a href="goaddIncome">บันทึกรายรับ</a></li>
	                <li><a href="goaddExpense">บันทึกรายจ่าย</a></li>
	                <li><a href="goAddshift">บันทึกเวลาการทำงาน</a></li>
	                <li><a href="golistShift">รายชื่อสมาชิกโครงการ</a></li>
	                <li><a href="#">ผลประกอบการ</a></li>
	                <li><a href="#">สถิติการทำงาน</a></li>
	                <li><a href="dologout">ออกจากระบบ</a></li>
	            </ul>
	        </nav>
	        		<%}else if(log.getStatus()==3){ %>
	          <!-- nav officer -->
	         <nav class="nav_bar">
	            <ul>
	                <li><a href="goHomepage">หน้าแรก</a></li>
	                <li><a href="golistRegisterReq">คำขอเข้าร่วมโครงการ</a></li>
	                <li><a href="golistMember">รายชื่อนักศึกษา</a></li>
	                <li><a href="dologout">ออกจากระบบ</a></li>
	            </ul>
	        </nav>
	        
	       	<%}%>		
	      	<%}else{%>
	        <!-- not login nav user -->
	      
		        <nav class="nav_bar" >
		            <ul>
		                <li><a href="goHomepage">หน้าแรก</a></li>
		                <li><a href="goRegister">ลงทะเบียน</a></li>    
		                <li><a href="goLogin">เข้าสู่ระบบ</a></li>
		            </ul>
		        </nav>
		      
		        <%}%>
	     	
	     	
    </header>
	 	
</body>
</html>