<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*,org.itsci.vegetable.dao.*,org.itsci.vegetable.model.*" %>
<%@ page import="org.itsci.vegetable.manager.projectsManager" %>
<% projectsManager pjm = new projectsManager();
    	List<projects> pj = pjm.getProjects(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>   
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mitr&family=Roboto+Condensed:wght@300;400;700&display=swap" >
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/register.css">
<script src="js/register.js"></script>
<body>
<jsp:include page="basic/header.jsp" />
  <form class="fit" name="regis" method="POST" action="getRegister">
        <div align="center" >
        	<b class="h">ลงทะเบียน</b>
        	<b class="t">เข้าร่วมโครงการปลูกผักเเลกค่าเทอม</b>
            <table>
                <tr>
                    <td>คำนำหน้า:<br>
                        <input type="radio" name="prefix" id="prefix"  value="นาย" checked > นาย
                        <input type="radio" name="prefix" id="prefix"  value="นางสาว" > นางสาว
 						<label id="radios" style="color: red; 200px;">&nbsp;</label>
                    </td>
                      
                    <td>ปีการศึกษา/เทอม: <br>
                            <select name="term" id="term" class="form-control registered"  onclick="checkFaculty(regis)">
                                <option value disabled selected>เลือกปีการศึกษา/เทอม</option>
                                <option value="1-2565">ปีการศึกษา2565/เทอม1</option>
                                <option value="2-2565">ปีการศึกษา2565/เทอม2</option>
                            </select> 
                            <label class="alert-label" id="alertTerm"></label>
                    </td>
                </tr>
               <tr>
                    <td>ชื่อ-นามสกุล: <br>
                        <div class="form-floating">
                        <input type="text" name="name" id="name" placeholder="ชื่อ-นามสกุล" class="form-control registered" onblur="checkname(regis)">
                        <label class="alert-label" id="alertName"></label>
                        </div>
                    </td>
                    <td>รหัสนักศึกษา: <br>
                        <input type="text" name=stucode id="stucode" placeholder="รหัสนักศึกษา" maxlength="10" class="form-control registered" onblur="checkStuid(regis)">
                    	<label class="alert-label" id="alertStuID"></label>
                    </td>
               </tr>
               <tr>
                    <td>เบอร์โทรศัพท์: <br>
                        <input type="text" name="phone" id="phone" placeholder="เบอร์โทรศัพท์" maxlength="10" class="form-control registered"  onblur="checkPhone(regis)">
                     	<label class="alert-label" id="alertPhone"></label>
                    </td>
                    <td>สาขา: <br>
                        <input type="text" name="major" id="major" placeholder="สาขา" class="form-control registered" onblur="checkMajor(regis)">
                    	<label class="alert-label" id="alertMajor"></label>
                    </td>
               </tr>
                <tr>
                    <td>วันเกิด: <br>
                        <input type="date" name="birthday" id="birthday" class="form-control registered" onblur="checkBirthday(regis)">
                    	  <label class="alert-label" id="alertBirthday"></label>
                    </td>
                    <td>สังกัดคณะ/โครงการ:<br>
                        <select name="faculty" id="faculty" class="form-control registered" onclick="checkFaculty(regis)" >
                            <option value disabled selected>สังกัดคณะ/โครงการ</option>
                            <% for(int i=0;i<pj.size();i++){%>
                            <option value="<%= pj.get(i).getProject_id() %>"><%= pj.get(i).getName() %></option>
                            <%}%>
   
                        </select> 
                        <label class="alert-label" id="alertFaculty"></label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">เหตุผลในการเข้าโครงการ: <br>
                        <textarea name="reason" id="reason" class="form-control registered" placeholder="เหตุผลในการเข้าโครงการ" style="width: 450px; height: 100px; resize: none;" onblur="checkReason(regis)"></textarea>
                    	<label class="alert-label" id="alertReason"></label>
                    </td>
                </tr>      
            </table>
            <div align="left" style="width: 300px; margin-top: 20px;">
                <p style="margin-bottom: 0;"> Email: </p>          	
                <input type="email" name="email" id="email" placeholder="ใช้อีเมลของมหาวิทยาลัยในการสมัคร" class="form-control registered" style="width: 300px;" onblur="checkEmail(regis)" >
                <label class="alert-label" id="alertEmail"></label>
                
                <p align="left" style="margin-bottom: 0;">Password: </p>
                <input type="password" name="password" id="password" placeholder="รหัสผ่าน" class="form-control registered" style="width: 300px;" onblur="checkPassword(regis)" > 
            	<label class="alert-label" id="alertPassword"></label>
            </div>
                <input type="submit" value="ลงทะเบียน"  class="btnsubmit btnSite">
            </div>
    </form>   
<jsp:include page="basic/footer.jsp" />
</body>
</html>