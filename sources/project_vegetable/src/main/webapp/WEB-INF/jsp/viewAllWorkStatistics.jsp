<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*,org.itsci.vegetable.dao.*,org.itsci.vegetable.model.*,java.text.*" %>
	    <%
		    ReportManager rpm = new ReportManager(); 
		    List<Member_shifts> listwork = (List<Member_shifts>)request.getAttribute("listwork");
		    
	    	
	    %>
	    <%
	 	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdtf = new SimpleDateFormat("HH:mm");
		SimpleDateFormat hour = new SimpleDateFormat("H");
		SimpleDateFormat min = new SimpleDateFormat("m");
	    sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
	  %> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mitr&family=Roboto+Condensed:wght@300;400;700&display=swap" >
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- css.gg -->
<link href='https://css.gg/css' rel='stylesheet'>

<!-- UNPKG -->
<link href='https://unpkg.com/css.gg/icons/all.css' rel='stylesheet'>

<!-- JSDelivr -->
<link href='https://cdn.jsdelivr.net/npm/css.gg/icons/all.css' rel='stylesheet'>
    <title>สถิติการทำงานของนักศึกษา</title>
</head>
<body>
<jsp:include page="basic/header.jsp" /> 
    <div class="container" align="center">
        <h3 >รายนักศึกษาที่ขอเข้าร่วมโครงการ</h3>
        <h4>" โครงการปลูกผักเเลกค่าเทอม "</h4>  
    <table>
        <tr >
            <td><label class="tr1">รหัสนักศึกษา : </label><input type="search" class="form-control  search_stucode"></td>
            <td><label class="tr2">ปีการศึกษา/เทอม :</label><br>
                <select name="term" id="term" class="form-control registered"  onclick="checkFaculty(regis)">
                        <option value disabled selected>เลือกปีการศึกษา/เทอม</option>
                        <option value="1-2565">ปีการศึกษา2565/เทอม1</option>
                        <option value="2-2565">ปีการศึกษา2565/เทอม2</option>
                </select> 
            </td>
            <td>
                <button type="submit" class="form-control  button-search" role="button" >ค้นหา 
                    &nbsp;<i class="gg-search"></i>
                </button>
            </td>
        </tr>
    </table>
   
        <table class="table table-bordered">
            <thead>
              <tr>
                <th>ลำดับ</th>
                <th>รหัสนักศึกษา</th>
                <th>ชื่อ-นามสกุล</th>
                <th>สาขา</th>
                <th>สถิติ</th>
              </tr>
            </thead>
            <tbody>
            <%int num = 1; for(Member_shifts m:listwork){ %>
              <tr>
                <td><%= num %></td>
                <td><%= m.getRegister().getMember().getStudent_code()%></td>
                <td><%= m.getRegister().getMember().getMember_name() %></td>
                <td><%= m.getRegister().getMember().getStudent_major() %></td>
                <td><%= hour.format(m.getEndTime().getTime())+"ชั่วโมง "+min.format(m.getEndTime().getTime())+"นาที" %></td>
              </tr>
            <% num++;} %>
            
            </tbody>
          </table>
    </div>
    <jsp:include page="basic/footer.jsp" />
</body>
<style>
    body{
    font-family: 'Mitr', sans-serif;
    
}
*{
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: 'Mitr', sans-serif;
}
td{
    align-items: center;
    margin-top: 29px;
    padding: 10px;
}
table{
    margin-top: 30px;
}
.form-control{
    width: 200px;
}
.container{
    margin-top: 160px;
    margin-bottom:150px;
}

/*button search*/
.button-search{
  align-items: center;
  appearance: none;
  background-color: #BDBDBD;
  border-radius: 24px;
  border-style: none;
  box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
  box-sizing: border-box;
  color: #000;
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
  margin-top:20px;
}

.button-search:hover {
  background: #F6F9FE;
  color: #174ea6;
}

.button-search:active {
  box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
  outline: none;
}

.button-search:focus {
  outline: none;
  border: 2px solid #4285f4;
}

.button-search:not(:disabled) {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-search:not(:disabled):hover {
  box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
}

.button-search:not(:disabled):focus {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-search:not(:disabled):active {
  box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
}

.button-search:disabled {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}
</style>
</html>