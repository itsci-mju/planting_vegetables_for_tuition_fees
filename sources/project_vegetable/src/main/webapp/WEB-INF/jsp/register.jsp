<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*,org.itsci.vegetable.dao.*,org.itsci.vegetable.model.*" %>
    <% ProjectsManager pjm = new ProjectsManager();
    	List<Projects> pj = pjm.getProjects(); 
    	
    	String resultRegis = null;
    	try{
    		resultRegis = (String) request.getAttribute("resultRegis");
    	}catch(Exception e){
    	
    	}
    	LoginManager lm = new LoginManager();
        List<Logins> l = lm.getAllLogin();       
        
    	Logins log = new Logins();
        String err_login = null;
        
        MemberManager mg = new MemberManager();
        List<Member> listmem = mg.getListmember();
    	try{
    			log = (Logins)session.getAttribute("login");
    			err_login = (String) request.getAttribute("result");			
    	}catch (Exception e) {	
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mitr&family=Roboto+Condensed:wght@300;400;700&display=swap" >
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
  
  <script type="text/javascript">
  function check(regis){
	  // select option ปีการศึกษา/เทอม//
	  
	    var labelAlertterm  = document.getElementById("alertTerm");
	    labelAlertterm.innerText="";
	    if(regis.term.value==("")){
	      labelAlertterm.innerText="กรุณาเลือกปีการศึกษา/เทอม";
	      labelAlertterm.style.color="#ff5252";
	      return false;
	    }

	//ชื่อ-นามสกุล//
      var Name = /^([ก-์]{2,50})([\s]{1,2})([ก-์]{2,50})$/;
      var labelAlert1  = document.getElementById("alertName");
      labelAlert1.innerText="";
      if(regis.name.value==("")){
        labelAlert1.innerText="กรุณากรอกชื่อ";
        labelAlert1.style.color="#ff5252";
        return false;
        }
      if(!regis.name.value.match(Name)){
          labelAlert1.style.color="#ff5252";
          labelAlert1.innerText="กรุณากรอกชื่อเป็นภาษาไทยเท่านั้น";
          regis.name.value = "";
          return false;
        }
    
      // รหัสนักศึกษา //
      var Stuid = /^[1-9]{1}([0-9]{9})$/;
      var labelAlert2  = document.getElementById("alertStuID");
      labelAlert2.innerText="";
      if(regis.stucode.value==("")){
          labelAlert2.innerText="กรุณากรอกรหัสนักศึกษา";
          labelAlert2.style.color="#ff5252";
          return false;
        }
       if(!regis.stucode.value.match(Stuid)){
          labelAlert2.style.color="#ff5252";
          labelAlert2.innerText="กรุณากรอกรหัสนักศึกษาเป็นตัวเลข 10 ตัวเลขเท่านั้นและไม่ขึ้นต้นด้วยเลข 0 " ;
          regis.stucode.value = "";
          return false;
        }
      	<%for(Member mb : listmem ){%>
  	  	if(regis.stucode.value =='<%= mb.getStudent_code() %>' ){
    	    document.getElementById('alertStuID').innerHTML = "รหัสนักศึกษานี้เคยสมัครแล้ว";
    	    labelAlert2.style.color="#ff5252";
    	    return false;
    	  }
    	<%}%>
    	 
    	 // เบอร์โทรศัพท์ //
    	var Phone = /^[0]{1}([0-9]{9})$/;
        var labelAlert3  = document.getElementById("alertPhone");
        labelAlert3.innerText="";
        if(regis.phone.value==("")){
            labelAlert3.innerText="กรุณากรอกเบอร์โทรศัพท์";
            labelAlert3.style.color="#ff5252";
            return false;
          }
         if(!regis.phone.value.match(Phone)){
            labelAlert3.style.color="#ff5252";
            labelAlert3.innerText="กรุณากรอกเบอร์โทรศัพท์เป็นตัวเลขเท่านั้นและขึ้นต้นด้วยเลข 0 " ;
            regis.phone.value = "";
            return false;
          }
    
        
    	 // สาขา //
        var Major = /^([ก-์]{4,50})$/;
        var labelAlert4  = document.getElementById("alertMajor");
        labelAlert4.innerText="";
        if(regis.major.value==("")){
            labelAlert4.innerText="กรุณากรอกชื่อสาขา";
            labelAlert4.style.color="#ff5252";
            return false;
          }
        if(!regis.major.value.match(Major)){
            labelAlert4.style.color="#ff5252";
            labelAlert4.innerText="กรุณากรอกชื่อสาขาเป็นภาษาไทยเท่านั้น" ;
            regis.major.value = "";
            return false;
          }

        var Birthday = new Date;
        Birthday.setHours(0,0,0,0);
        alertBirth = document.getElementById("alertBirthday");
        alertBirth.innerText="";
        var date = new Date(regis.birthday.value)
        if(regis.birthday.value==""){
          alertBirth.innerText="กรุณากรอก วัน/เดือน/ปี";
          alertBirth.style.color="#ff5252";
          return false;
        }
       if(date >=today) {
          alertBirth.innerText="วัน/เดือน/ปี ต้องไม่ใช่ปัจจุบันหรืออนาคต";
          regis.birthday.value= ""
          alertBirth.style.color="#ff5252";
          return false;
        }
       

       // select option สังกัดคณะ/โครงการ //
       
        var labelAlertfaculty  = document.getElementById("alertFaculty");
        labelAlertfaculty.innerText="";
        if(regis.faculty.value==("")){
          labelAlertfaculty.innerText="กรุณาเลือกปีการศึกษา/เทอม";
          labelAlertfaculty.style.color="#ff5252";
          return false;
        }

	
	  // เหตุผลในการเข้าโครงการ //
	   var Reason = /^([ก-์]{10,255})$/;
	   var labelAlert5  = document.getElementById("alertReason");
	   labelAlert5.innerText="";
	   if(regis.reason.value==("")){
	      labelAlert5.innerText="กรุณากรอกเหตุผลในการเข้าโครงการ";
	      labelAlert5.style.color="#ff5252";
	      return false;
	     }
	   if(!regis.reason.value.match(Reason)){
	      labelAlert5.style.color="#ff5252";
	      labelAlert5.innerText="กรุณากรอกเหตุผลในการเข้าโครงการเป็นภาษาไทยเท่านั้นเเละมีความยาว 10 ตัวขึ้นไป" ;
	       regis.reason.value = "";
	       return false;
	     }
	 //อีเมล//
	    var Email = /^(mju|MJU)[0-9]{10}([@mju.ac.th]{10})$/;
	    var labelAlertemail  = document.getElementById("alertEmail");
	    labelAlertemail.innerText="";
	    if(regis.email.value==("")){
	      labelAlertemail.innerText="กรุณากรอกอีเมล";
	      labelAlertemail.style.color="#ff5252";
	      return false;
	      }
	    if(!regis.email.value.match(Email)){
	        labelAlertemail.style.color="#ff5252";
	        labelAlertemail.innerText="อีเมลต้องเป็นตัวอักษรภาษาอังกฤษและตัวเลขต้องขึ้นต้นด้วย mju เท่านั้นและมีความยาว 23 ตัวเท่านั้น";
	        return false;
	      }
	 	
	    <%for(Logins lg : l){%>
	  	  if(regis.email.value == '<%= lg.getEmail() %>' ){
	  	    document.getElementById('alertEmail').innerHTML = "อีเมล์นี้ถูกใช้แล้ว";
	  	    labelAlertemail.style.color="#ff5252";
	  	  return false;
	  	  }
	  	<%}%>
	  	
	 
	
	   // รหัสผ่าน //
	 
	    var Password = /^[A-Za-z0-9]{6,16}$/;
	    var labelAlertpassword  = document.getElementById("alertPassword");
	    labelAlertpassword.innerText="";
	    if(regis.password.value==("")){
	      labelAlertpassword.innerText="กรุณากรอกรหัสผ่าน";
	      labelAlertpassword.style.color="#ff5252";
	      return false;
	      }
	      else if(!regis.password.value.match(Password)){
	        labelAlertpassword.style.color="#ff5252";
	        labelAlertpassword.innerText="รหัสผ่านต้องเป็นตัวอักษรภาษาและตัวเลขเท่านั้นและมีความยาวตั้งแต่ 6-16 ตัว";
	        return false; 
	      }
	   	 
	    }  
	
	  </script>
<title>ลงทะเบียนเข้าร่วมโครงการปลูกผักเเลกค่าเทอม</title>
</head>
<link rel="stylesheet" href="css/register.css">
<body>
<jsp:include page="basic/header.jsp" />
  <form class="fit" name="regis" method="POST" action="insertRegister">
        <div align="center" >
        	<b class="h">ลงทะเบียน</b>
        	<b class="t">เข้าร่วมโครงการปลูกผักเเลกค่าเทอม</b>
            <table>
              <%if( resultRegis != null) {%>
              <div class="col-md-12">
	            <div class="bg-light rounded p-3">	    		
					<p class="mb-0 d-inline-block" style="color:red"><span class="icon-exclamation-circle text-warning"></span> <%=resultRegis %></p>            
	            </div> <br> 
          	</div> 
              <%} %>
                <tr>
                    <td>คำนำหน้า:<br>
                        <input type="radio" name="prefix" id="prefix"  value="นาย" checked > นาย
                        <input type="radio" name="prefix" id="prefix"  value="นางสาว" > นางสาว
 						<label id="radios" style="color: red; 200px;">&nbsp;</label>
                    </td>
                   
                    <td>ปีการศึกษา/เทอม: <br> 
                    <div class="form-floating">
                            <select name="term" id="term" class="custom-select registered">
                                <option value disabled selected>เลือกปีการศึกษา/เทอม</option>
                                <option value="1-2565">ปีการศึกษา2565/เทอม1</option>
                                <option value="2-2565">ปีการศึกษา2565/เทอม2</option>
                            </select> 
                            <label class="alert-label" id="alertTerm"></label>
                            </div> 
                    </td>
                    
                </tr>
               <tr>
                    <td>ชื่อ-นามสกุล: <br>
                        <div class="form-floating">
                        <input type="text" name="name" id="name" placeholder="ชื่อ-นามสกุล" class="form-control registered" >
                        <label class="alert-label" id="alertName"></label>
                        </div>
                    </td>
                    <td>รหัสนักศึกษา: <br>
                        <input type="text" name=stucode id="stucode" placeholder="รหัสนักศึกษา" maxlength="10" class="form-control registered" >
                    	<label class="alert-label" id="alertStuID"></label>
                    </td>
               </tr>
               <tr>
                    <td>เบอร์โทรศัพท์: <br>
                        <input type="text" name="phone" id="phone" placeholder="เบอร์โทรศัพท์" maxlength="10" class="form-control registered" >
                     	<label class="alert-label" id="alertPhone"></label>
                    </td>
                    <td>สาขา: <br>
                        <input type="text" name="major" id="major" placeholder="สาขา" class="form-control registered">
                    	<label class="alert-label" id="alertMajor"></label>
                    </td>
               </tr>
                <tr>
                    <td>วันเกิด: <br>
                        <input type="date" name="birthday" id="birthday" class="form-control registered" >
                    	  <label class="alert-label" id="alertBirthday"></label>
                    </td>
                    <td>สังกัดคณะ/โครงการ:<br>
                      <div class="form-floating">
                        <select name="faculty" id="faculty" class="custom-select registered">
                            <option value disabled selected>สังกัดคณะ/โครงการ</option>
                            <% for(int i=0;i<pj.size();i++){%>
                            <option value="<%= pj.get(i).getProject_id() %>"><%= pj.get(i).getName() %></option>
                            <%}%>
   
                        </select> 
                        <label class="alert-label" id="alertFaculty"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">เหตุผลในการเข้าโครงการ: <br>
                        <textarea name="reason" id="reason" class="form-control registered" placeholder="เหตุผลในการเข้าโครงการ" style="width: 450px; height: 100px; resize: none;"></textarea>
                    	<label class="alert-label" id="alertReason"></label>
                    </td>
                </tr>      
            </table>
            <div align="left" style="width: 300px; margin-top: 20px;">
                <p style="margin-bottom: 0;"> Email: </p>          	
                <input type="email" name="email" id="email" placeholder="ใช้อีเมลของมหาวิทยาลัยในการสมัคร" class="form-control registered" style="width: 300px;">
                <label class="alert-label" id="alertEmail"></label>
                
                <p align="left" style="margin-bottom: 0;">Password: </p>
                <input type="password" name="password" id="password" placeholder="รหัสผ่าน" class="form-control registered" style="width: 300px;"> 
            	<label class="alert-label" id="alertPassword"></label>
            </div>
                <input type="submit" value="ลงทะเบียน"  class="btnsubmit btnSite" Onclick="return check(regis)">
            </div>
    </form>   
<jsp:include page="basic/footer.jsp" />
</body>
</html>