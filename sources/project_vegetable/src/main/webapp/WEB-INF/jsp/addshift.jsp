<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="org.itsci.vegetable.model.*,org.itsci.vegetable.dao.*,java.util.*,java.text.SimpleDateFormat"  %>
<%@ page import="org.itsci.vegetable.manager.RegisterManager" %>
<%	Calendar cd = Calendar.getInstance();
	 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdtf = new SimpleDateFormat("HH:mm");
	    sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
	    String  dateshift =  sdf.format(cd.getTime()); 
	    String  timeshift =  sdtf.format(cd.getTime());  
	  %>  
	   <% 
	 	RegisterManager rgm = new RegisterManager();
	   	Member mb = (Member)session.getAttribute("member");
		register rg = rgm.getRegisterID(mb.getMember_id());
	   %>
		  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>   
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mitr&family=Roboto+Condensed:wght@300;400;700&display=swap" >
    <title>บันทึกเวลาการทำงาน</title>
    <link rel="stylesheet" href="css/addshift.css">
    <script>
    
    </script>
</head>
<body>
<jsp:include page="basic/header.jsp"/>
    <form class="fit" name="fm2" action="insertAddshift" method="POST" >
        <div align="center">
            <table>
                <tr>
	                <td colspan="2" align="center"><img class="img1" src="img/logo.png"><br>
	                	<b>บันทึกเวลาการทำงาน</b>
	                </td>
                </tr>
	            <tr>
	                <td> รหัสนักศึกษา <br>
	                    <input type="text" value="<%=mb.getStudent_code() %>"  name="stucode" id="stucode" class="form-control addShift" placeholder="รหัสนักศึกษา"readonly>
	                </td>
	                <td>ชื่อ-นามสกุล <br>
	                    <input type="text" value="<%=mb.getMember_name() %>" name="name" id="name" class="form-control addShift" placeholder="ชื่อ-นามสกุล"readonly>
	                </td>
	            </tr>
            <tr>
                <td>วันที่ทำงาน <br>
                    <input type="date" value="<%= dateshift %>" name="date" id="date" class="form-control addShift"readonly>
                </td>
                <td>รับหน้าที่ <br>
                    <input type="text" name="task_name" id="task_name" class="form-control addShift" placeholder="รับหน้าที่">
                </td>
            </tr>
            <tr>
                <td>เวลาเข้างาน <br>
                    <input type="time" value="<%= timeshift %>" name="startTime" id="startTime" class="form-control addShift"readonly>
                </td>
                <td>เวลาเข้าออกงาน <br>
                    <input type="time" name="endTime" id="endTime" class="form-control addShift">
                </td>
            </tr>
            <tr>
                <td align="right"><input type="submit" name="submit" value="บันทึก" class="btn btn-success"></td>
                <td><input type="reset" name="reset" value="ยกเลิก" class="btn btn-danger" ></td>
            </tr>
            <tr>
            	<td>
            		<input type="hidden" name="register_id" id="register_id" value="<%= rg.getRegister_id()%>">
            	</td>
            </tr>
            </table>
        </div>
    </form>
    <jsp:include page="basic/footer.jsp" />
    </body>
</html>