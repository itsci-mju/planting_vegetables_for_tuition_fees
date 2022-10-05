<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*,org.itsci.vegetable.dao.*,org.itsci.vegetable.model.*,java.text.SimpleDateFormat" %>
     <%
	    transactionManager tm = new transactionManager(); 
	    List<transaction> ts =  tm.list_income_expense(); 
	    List<transaction_details> td = tm.list_transaction_details("td");
	    %>
	    <%
	 	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	    sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>   
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">  
    <link rel="stylesheet" href="css/editincomeExpense.css">
    <title>แก้ไขรายรับรายจ่าย</title>
</head>
<style>
.container{
	margin-top:150px;
	margin-bottom:150px;
}
</style>
<body>
<jsp:include page="basic/header.jsp" /> 
    <div class="container" align="center">
        <h2 >แก้ไขรายรับรายจ่าย</h2>
        <p>" โครงการปลูกผักเเลกค่าเทอม "</p>  
        <div>
            <table>
                <tr>
                  <td>
                  วันที่ทำรายการ : 
                  <input type="text" class="form-control date_time" name="date_time" id="date_time" value="<%= sdf.format( tm.list_transaction().get(0).getDate_time().getTime()) %>" readonly>
                 </td> 
                 <td>
                	 ประเภท : 
                  <input type="text" class="form-control type"  name="type" id="type" value="" readonly> 
                </td>
        </tr>
          </table>
        </div>
    <div class="container-fluid" >       
        <table class="table table-hover" >
        <thead  align="center">
            <tr>
            <th>ลำดับ</th>
            <th>เวลาข้อมูล</th>    
            <th>ชื่อ</th>
            <th>จำนวน</th> 
            <th>ราคา</th>
            <th>รวม</th>
            <th></th>
            </tr>
        </thead>
        <tbody  align="center">
            <tr>
            <td></td>
            <td></td>
            <td></td>  
            <td></td>
            <td></td>
            <td></td>
            <td> 
               <a href=""><i class="far fa-trash-alt"></i></a>
               <a href=""><i class="far fa-edit"></i></a>
             </td>
            </tr>                           
        </tbody>
        </table>
        </div>  
        <div>
            <form class="fit" method="post" action="#" >       
                <table align="center">  
                    <tr>
                        <td>
                            <p class="p3">แก้ไขรายละเอียดข้อมูล</p>
                        </td>
                    </tr>              
                    <tr>
                        <td>
                            <div class="form-floating">
                                <select name="cars" class="custom-select"  style="height:55px;">
                                    <option disabled selected>เลือกสินค้า</option>
                                    <option value="1">ผักบุ้ง</option>
                                    <option value="2">ผักกาด</option>
                                    <option value="3">ถั่ว</option>
                                  </select>                 
                              </div>
                        </td>
                        <td>
                             <div class="form-floating">
                                <input type="text" name="price" id="price" class="form-control registered" value=""  placeholder="ราคา" >
                                <label for="floating">ราคา</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-floating" >
                                <input type="text" name="amount" id="amount" class="form-control registered" placeholder="จำนวน" value=""  >
                                <label for="floating">จำนวน</label>
                            </div>
                        </td>
                        <td>
                            <div class="form-floating" >
                                <input type="text" name="sum" id="sum" class="form-control registered" placeholder="รวม" value=""  >
                                <label for="floating">รวม</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-floating">
                                <select name="cars" class="custom-select"  style="height:55px;">
                                    <option disabled selected>เลือกหน่วย</option>
                                    <option value="1">ผักบุ้ง</option>
                                    <option value="2">ผักกาด</option>
                                    <option value="3">ถั่ว</option>
                                  </select>                 
                              </div>
                        </td>
                        <td>
                            <div class="form-floating" >
                                <input type="text" name="name" id="name" class="form-control registered" placeholder="ผู้บันทึก" value=""  >
                                <label for="floating">ผู้บันทึก</label>
                            </div>
                        </td>
                    </tr>
                    <tr align="center"> 
                        <td>
                            <button type="submit" class="btn btn-success"  name="submit">บันทึกข้อมูล</button>
                        </td> 
                        <td>
                            <button type="reset" name="reset" class="btn btn-danger" >ยกเลิก</button>
                        </td>
                    </tr> 
                </table>   
                	
            </form>
      </div>
     </div>
<jsp:include page="basic/footer.jsp" />
</body>
</html>