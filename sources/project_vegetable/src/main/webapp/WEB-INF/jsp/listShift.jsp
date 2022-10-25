<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*,org.itsci.vegetable.dao.*,org.itsci.vegetable.model.*,java.text.SimpleDateFormat" %>
    <% 
    	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");   	
    	sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
    	
    	MemberManager mg = new MemberManager();
    	RegisterManager rg = new RegisterManager();
    	
      	MembershiftManager mgs = new MembershiftManager(); 
    	
      	List<Member_shifts> mbs = mgs.getListShifts();
      	
      	Member mb = (Member)session.getAttribute("member"); 
    	
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
<body>
<jsp:include page="basic/header.jsp" />   
	
	<form class="fit">
   	<div class="container" align="center">
        <h2 >รายชื่อสมาชิกที่มาทำงาน</h2>
        <p>" โครงการปลูกผักเเลกค่าเทอม "</p> 
        <div class="scoll-list">           
        <table class="table table-bordered" border="1" style="width:800;">
        <thead  align="center">
            <tr>
            <th>รหัสนักศึกษา</th>
            <th>ชื่อ-นามสกุล</th>
            <th>วันที่ทำงาน</th>
            <th></th>
            </tr>
        </thead>
        
        <tbody  align="center">
        	<% for(Member_shifts ms : mbs ) {%>
            <tr>
            <td><%= rg.getstuCode(ms.getRegister().getRegister_id()).getStudent_code()%></td>
            <td><%= rg.getstuCode(ms.getRegister().getRegister_id()).getMember_name() %></td>
            <td><%= sdf.format(ms.getDate().getTime()) %></td>   
            <td>
                <a href="approveShift?id=<%=rg.getstuCode(ms.getRegister().getRegister_id()).getStudent_code()%>">
                    <button type="button" class="button-17" role="button">ตรวจสอบ
				&nbsp; 	<i class="gg-eye"></i></button>
                </a>
            </td>
            </tr> 
            <% } %> 
        </tbody> 
        
        </table>
        </div>
    </div>
     
    </form>
  
    <jsp:include page="basic/footer.jsp" />
</body>
<style>
@charset "UTF-8";
body{
    font-family: 'Mitr', sans-serif;
}
*{
	z-index:2;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Mitr', sans-serif;
 }
 .fit{
 	 margin-top: 160px;
 	 margin-bottom: 170px;
 }
 thead{
   
    background-color:#EEEEEE;
}
p{
    font-size: 25px;
    color:#FFDD00;
}
 .scoll-list{
 	max-height:400px ;
	overflow:scroll;
	overflow-x:hidden;	 
	padding-top:0;
	margin-bottom:20px;
 }
/*button view*/
.button-17 {
  align-items: center;
  appearance: none;
  background-color: #FFCA28;
  border-radius: 10px;
  border-style: none;
  box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
  box-sizing: border-box;
  color:#000000;
  cursor: pointer;
  display: inline-flex;
  fill: currentcolor;
  font-size: 14px;
  font-weight: 500;
  height: 34px;
  justify-content: center;
  letter-spacing: .25px;
  line-height: normal;
  max-width: 100%;
  overflow: visible;
  padding: 2px 24px;
  position: relative;
  text-align: center;
  text-transform: none;
  transition: box-shadow 280ms cubic-bezier(.4, 0, .2, 1),opacity 15ms linear 30ms,transform 270ms cubic-bezier(0, 0, .2, 1) 0ms;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: auto;
  will-change: transform,opacity;
  z-index: 0;
}

.button-17:hover {
  background: #FFD54F;

}

.button-17:active {
  box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
  outline: none;
}

.button-17:focus {
  outline: none;
  border: 2px solid #4285f4;
}

.button-17:not(:disabled) {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-17:not(:disabled):hover {
  box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
}

.button-17:not(:disabled):focus {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-17:not(:disabled):active {
  box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
}

.button-17:disabled {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}
</style>
</html>