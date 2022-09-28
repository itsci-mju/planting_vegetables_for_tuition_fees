<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Mitr&family=Roboto+Condensed:wght@300;400;700&display=swap" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>   
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">   
<title>บันทึกรายรับ</title>
</head>
<link rel="stylesheet" href="css/addincome.css">
<body> 
<jsp:include page="basic/header.jsp" /> 
    <form align="center"> 
    <div  class="main">
        <h2>บันทึกรายรับ</h2>
        <h3>"โครงการปลูกผักเเลกค่าเทอม"</h3>
       <div class="fit"align="center">
        <table >  
            <tr>
                <td>
                    <p class="p2">รายละเอียดข้อมูล</p>
                </td>
            </tr>   
            <tr> 
            	<td><input type="hidden" name="term" id="term">
            	</td>
            	<td>
            	<input type="hidden" name="type" id="type">
            	</td>
               
            </tr>           
            <tr>
                <td>
                     <div class="form-floating">
                        <input type="text" name="product_name" id="product_name" class="form-control registered" value=""  placeholder="ชื่อสินค้า" >
                        <label for="floating">ชื่อสินค้า</label>               
                      </div>
                </td>
                <td>
                     <div class="form-floating">
                        <input type="text" name="asset_price" id="asset_price" class="form-control registered" value=""  placeholder="ราคา" >
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
                        <input type="text" name="product_unit" id="product_unit" class="form-control registered" placeholder="หน่วย"  >
                        <label for="floating">หน่วย</label>              
                      </div>
                </td>
                <td>
                    <div class="form-floating" >
                        <input type="text" name="name" id="name" class="form-control registered" placeholder="ผู้บันทึก" value=""  >
                        <label for="floating">ผู้บันทึก</label>
                    </div>
                </td>
            </tr>
            <tr colapan="2" align="center">
                <td></td>
                <td>
                    <button type="submit" class="btn btn-success" id="add" name="add">เพิ่มรายการ</button>
                </td> 
            </tr> 
        </table>   
                
       </div> 
       </div>	
    </form>
        <div class="list" align="center" >
            <h2>รายการขายสินค้า <button type="submit" value="submit" class=" btn btn-secondary">บันทึกข้อมูล</button> </h2>
            
        <table class="table table-bordered" align="center">
        <thead>
            <tr>
            <th>วันที่</th>
            <th>เวลา</th>
            <th>ชื่อสินค้า</th>
            <th>จำนวน</th>
            <th>รวม</th>
            <th></th>
            <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>John</td>
                <td>Doe</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>
                    <a>
                        <i class="far fa-trash-alt"></i>
                    </a> 
                </td>
                <td>
                    <a>
                        <i class="far fa-edit"></i>
                    </a>
                </td>
            </tr>
        </tbody>
        </table>
    </div>    
    <jsp:include page="basic/footer.jsp" />
</body>
</html>