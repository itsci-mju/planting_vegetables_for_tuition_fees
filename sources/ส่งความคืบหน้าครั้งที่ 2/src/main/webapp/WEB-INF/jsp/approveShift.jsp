<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="bean.*,util.*,java.util.*,java.text.SimpleDateFormat"  %>
   <%	Calendar cd = Calendar.getInstance();
	 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdtf = new SimpleDateFormat("HH:mm");
	    sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
	    String  dateshift =  sdf.format(cd.getTime()); 
	    String  timeshift =  sdtf.format(cd.getTime());  
	    
	    RegisterManager rg = new RegisterManager();
	    membershiftManager ms = new membershiftManager();    
	    
	    member m = (member) session.getAttribute("ShowMember");
	    member mb = rg.getMember_shift(m.getStudent_code());
		register r = rg.getRegisterID(mb.getMember_id());
	   	member_shifts mbs = ms.getMShifts_byRegis(r.getRegister_id());
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
    <title>ตรวจสอบเวลาการทำงาน</title>
    <link rel="stylesheet" href="css/addshift.css">
    <script>
    
    </script>
</head>
<body>

<jsp:include page="basic/header.jsp"/>
    <form class="fit" name="fm2" action="updateApproveshift" method="POST" >
        <div align="center">
        
            <table>
                <tr>
	                <td colspan="2" align="center"><img class="img1" src="img/logo.png"><br>
	                	<b>ตรวจสอบเวลาการทำงาน</b> <input type="hidden" value="<%= mbs.getMember_shift_id() %>"  name="member_shift_id" id="member_shift_id" >
	                </td>
                </tr>
	            <tr>
	                <td> รหัสนักศึกษา <br>
	                    <input type="text" value="<%= m.getStudent_code() %>"  name="stucode" id="stucode" class="form-control addShift" placeholder="รหัสนักศึกษา"readonly>
	                </td>
	                <td>ชื่อ-นามสกุล <br>
	                    <input type="text" value="<%= m.getMember_name() %>" name="name" id="name" class="form-control addShift" placeholder="ชื่อ-นามสกุล"readonly>
	                </td>
	            </tr>
            <tr>
                <td>วันที่ทำงาน <br>
                    <input type="text" value="<%= sdf.format(mbs.getDate().getTime())%>" name="date" id="date" class="form-control addShift"readonly>
                </td>
                <td>รับหน้าที่ <br>
                    <input type="text" value="<%= mbs.getTask_name() %>" name="task_name" id="task_name" class="form-control addShift" placeholder="รับหน้าที่">
                </td>
            </tr>
            <tr>
                <td>เวลาเข้างาน <br>
                    <input type="time" value="<%= sdtf.format(mbs.getStartTime().getTime()) %>" name="startTime" id="startTime" class="form-control addShift"readonly>
                </td>
                <td>เวลาเข้าออกงาน <br>
                    <input type="time" value="<%= sdtf.format(mbs.getEndTime().getTime()) %>" name="endTime" id="endTime" class="form-control addShift">
                </td>
            </tr>
            <tr>
                <td align="right"><input type="submit" name="submit" value="อนุมัติ" class="btn btn-success"></td>
                <td><input type="reset" name="reset" value="ไม่อนุมัติ" class="btn btn-danger" ></td>
            </tr>
            
            </table>
        </div>
    </form>
    <jsp:include page="basic/footer.jsp" />
</body>
</html>