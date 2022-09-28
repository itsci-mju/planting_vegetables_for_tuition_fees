// ชื่อ //
function checkname(regis){
    var Name = /^([ก-์]{2,50})([\s]{1,2})([ก-์]{2,50})$/;
    var labelAlert1  = document.getElementById("alertName");
    if(regis.name.value==("")){
      labelAlert1.innerText="กรุณากรอกชื่อ";
      labelAlert1.style.color="#ff5252";
      }
      else if(!regis.name.value.match(Name)){
        labelAlert1.style.color="#ff5252";
        labelAlert1.innerText="กรุณากรอกชื่อเป็นภาษาไทยเท่านั้น";
        regis.name.value = "";
      }
      else{
        labelAlert1.innerText="สามารถใช้ชื่อนี้ได้";
        labelAlert1.style.color= "#4CAF50";
      }
    } 

// รหัสนักศึกษา //
function checkStuid(regis){
    var Stuid = /^[1-9]{1}([0-9]{9})$/;
    var labelAlert2  = document.getElementById("alertStuID");
    if(regis.stucode.value==("")){
        labelAlert2.innerText="กรุณากรอกรหัสนักศึกษา";
        labelAlert2.style.color="#ff5252";
      }
      else if(!regis.stucode.value.match(Stuid)){
        labelAlert2.style.color="#ff5252";
        labelAlert2.innerText="กรุณากรอกรหัสนักศึกษาเป็นตัวเลข 10 ตัวเลขเท่านั้นและไม่ขึ้นต้นด้วยเลข 0 " ;
        
        regis.stucode.value = "";
      }
      else{
        labelAlert2.innerText="สามารถใช้รหัสนักศึกษานี้ได้";
        labelAlert2.style.color= "#4CAF50";
      }
    } 
  

 // เบอร์โทรศัพท์ //
function checkPhone(regis){
  var Phone = /^[0]{1}([0-9]{9})$/;
  var labelAlert3  = document.getElementById("alertPhone");
  if(regis.phone.value==("")){
      labelAlert3.innerText="กรุณากรอกเบอร์โทรศัพท์";
      labelAlert3.style.color="#ff5252";
    }
    else if(!regis.phone.value.match(Phone)){
      labelAlert3.style.color="#ff5252";
      labelAlert3.innerText="กรุณากรอกเบอร์โทรศัพท์เป็นตัวเลขเท่านั้นและขึ้นต้นด้วยเลข 0 " ;
      
      regis.phone.value = "";
    }
    else{
      labelAlert3.innerText="สามารถใช้เบอร์โทรศัพท์นี้ได้";
      labelAlert3.style.color= "#4CAF50";
    }
  } 
   
 // สาขา //
 function checkMajor(regis){
  var Major = /^([ก-์]{4,50})$/;
  var labelAlert4  = document.getElementById("alertMajor");
  if(regis.major.value==("")){
      labelAlert4.innerText="กรุณากรอกชื่อสาขา";
      labelAlert4.style.color="#ff5252";
    }
    else if(!regis.major.value.match(Major)){
      labelAlert4.style.color="#ff5252";
      labelAlert4.innerText="กรุณากรอกชื่อสาขาเป็นภาษาไทยเท่านั้น" ;
      
      regis.major.value = "";
    }
    else{
      labelAlert4.innerText="สามารถใช้ชื่อสาขานี้ได้";
      labelAlert4.style.color= "#4CAF50";
    }
  } 
   
  // วันเกิด //
  function checkBirthday(regis){
    var today = new Date;
    today.setHours(0,0,0,0);
    alertBirth = document.getElementById("alertBirthday");

    var date = new Date(regis.birthday.value)
    if(regis.birthday.value==""){
      alertBirth.innerText="กรุณากรอก วัน/เดือน/ปี";
      alertBirth.style.color="#ff5252";
    }
    else if(date >=today) {
      alertBirth.innerText="วัน/เดือน/ปี ต้องไม่ใช่ปัจจุบันหรืออนาคต";
      regis.birthday.value= ""
      alertBirth.style.color="#ff5252";
    }
    else{
      alertBirth.innerText="สามารถใช้วันเกิดนี้ได้";
      alertBirth.style.color= "#4CAF50";
    }
}   

// เหตุผลในการเข้าโครงการ //
function checkReason(regis){
 var Reason = /^([ก-์]{10,255})$/;
 var labelAlert5  = document.getElementById("alertReason");
 if(regis.reason.value==("")){
    labelAlert5.innerText="กรุณากรอกเหตุผลในการเข้าโครงการ";
    labelAlert5.style.color="#ff5252";
   }
   else if(!regis.reason.value.match(Reason)){
    labelAlert5.style.color="#ff5252";
    labelAlert5.innerText="กรุณากรอกเหตุผลในการเข้าโครงการเป็นภาษาไทยเท่านั้นเเละมีความยาว 10 ตัวขึ้นไป" ;
     
     regis.reason.value = "";
   }
   else{
    labelAlert5.innerText="สามารถใช้เหตุผลในการเข้าโครงการนี้ได้";
    labelAlert5.style.color= "#4CAF50";
   }
 } 

 // อีเมล //
function checkEmail(regis){
  var Email = /^(mju|MJU)[0-9]{10}([@mju.ac.th]{10})$/;
  var labelAlertemail  = document.getElementById("alertEmail");
  if(regis.email.value==("")){
    labelAlertemail.innerText="กรุณากรอกอีเมล";
    labelAlertemail.style.color="#ff5252";
    }
    else if(!regis.email.value.match(Email)){
      labelAlertemail.style.color="#ff5252";
      labelAlertemail.innerText="อีเมลต้องเป็นตัวอักษรภาษาอังกฤษและตัวเลขต้องขึ้นต้นด้วย mju เท่านั้นและมีความยาว 23 ตัวเท่านั้น";
      
    }
    else{
      labelAlertemail.innerText="สามารถใช้อีเมลนี้ได้";
      labelAlertemail.style.color= "#4CAF50";
    }
  }  

 // select option ปีการศึกษา/เทอม//
function checkTerm(regis){
  var labelAlertterm  = document.getElementById("alertTerm");
  if(regis.term.value==("")){
    labelAlertterm.innerText="กรุณาเลือกปีการศึกษา/เทอม";
    labelAlertterm.style.color="#ff5252";
  }
  else{
    labelAlertterm.innerText="";
    }
}


 // select option สังกัดคณะ/โครงการ //
 function checkFaculty(regis){
  var labelAlertfaculty  = document.getElementById("alertFaculty");
  if(regis.faculty.value==("")){
    labelAlertfaculty.innerText="กรุณาเลือกปีการศึกษา/เทอม";
    labelAlertfaculty.style.color="#ff5252";
  }
  else{
    labelAlertfaculty.innerText="";
    }
}


 // รหัสผ่าน //
 function checkPassword(regis){
  var Password = /^[A-Za-z0-9]{6,16}$/;
  var labelAlertpassword  = document.getElementById("alertPassword");
  if(regis.password.value==("")){
    labelAlertpassword.innerText="กรุณากรอกรหัสผ่าน";
    labelAlertpassword.style.color="#ff5252";
    }
    else if(!regis.password.value.match(Password)){
      labelAlertpassword.style.color="#ff5252";
      labelAlertpassword.innerText="รหัสผ่านต้องเป็นตัวอักษรภาษาและตัวเลขเท่านั้นและมีความยาวตั้งแต่ 6-16 ตัว";
      
    }
    else{
      labelAlertpassword.innerText="สามารถใช้รหัสผ่านนี้ได้";
      labelAlertpassword.style.color= "#4CAF50";
    }
  }  
