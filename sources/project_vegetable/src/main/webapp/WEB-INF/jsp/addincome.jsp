<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*,org.itsci.vegetable.dao.*,org.itsci.vegetable.model.*,java.text.SimpleDateFormat" %>
	    <%
	    TransactionManager tm = new TransactionManager(); 
	    List<Assets> as = tm.getAssets();
	    List<Transaction> ts; 
	    ts = tm.list_transaction();
	    %>
	    <%
	 	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdtf = new SimpleDateFormat("HH:mm");
	    sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
	  %> 
	     <% 
	 	RegisterManager rgm = new RegisterManager();
	   	Member mb = (Member)session.getAttribute("member"); 
		Register rg = rgm.getRegisterID(mb.getMember_id());
	   %>
   		
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
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> 

<title>บันทึกรายรับ</title>
	<script type="text/javascript">
		function autoPrice(){
			var product_name = document.getElementById("product_name").value;
			var asset_price = document.getElementById("asset_price").innerHTML;
			console.log(product_name);
			 <% for(int i=0;i<as.size();i++){%>
				if( product_name == <%= as.get(i).getAsset_id() %>)	{
					document.getElementById("asset_price").value = "<%= as.get(i).getAsset_price() %>";
					document.getElementById("product_unit").value = "<%= as.get(i).getProduct_unit() %>";
				}else{
					asset_price = 0 ;
				}		 
			 <%}%>
		}
		
		function calTotalprice(){
			var amount = document.getElementById("amount").value;
			var asset_price = document.getElementById("asset_price").innerHTML;
			console.log(product_name);
			document.getElementById("sum").value = amount*document.getElementById("asset_price").value;	
			
		}

	</script>

</head>


<body> 
<jsp:include page="basic/header.jsp" /> 
    <form align="center" action="addIncome"  method="POST" > 
    <div  class="main">
        <h3>บันทึกรายรับ</h3>
        <h4>"โครงการปลูกผักเเลกค่าเทอม"</h4>
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
                     <div>
	                     <select name="product_name" id="product_name" class="custom-select" style="height:58px;" onchange="autoPrice()">                 
		                    <option value disabled selected>เลือกสินค้า</option>
		                    <% for(int i=0;i<as.size();i++){%>
                            <option value="<%= as.get(i).getAsset_id() %>"><%= as.get(i).getProduct_name() %></option>
                            <%}%>
		                </select>         
                      </div>
                </td>
                <td>
                     <div class="form-floating">
                   		
                        <input type="text" name="asset_price" id="asset_price" class="form-control registered" value=""  placeholder="ราคา" readonly>
                        <label for="floating">ราคา</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="form-floating" >
                        <input type="text" name="amount" id="amount" class="form-control registered" placeholder="จำนวน" value="" onkeyup="calTotalprice()" >
                        <label for="floating">จำนวน</label>
                    </div>
                </td>
                <td>
                    <div class="form-floating" >
                        <input type="text" name="sum" id="sum" class="form-control registered" placeholder="รวม" value="" readonly >
                        <label for="floating">รวม</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="form-floating">
                        <input type="text" name="product_unit" id="product_unit" class="form-control registered" placeholder="หน่วย" readonly >
                        <label for="floating">หน่วย</label>              
                      </div>
                </td>
                <td>
                    <div class="form-floating" >
                        <input type="text" name="name" id="name" class="form-control registered" placeholder="ผู้บันทึก" value="<%= mb.getMember_name() %>" readonly>
                        <label for="floating">ผู้บันทึก</label>
                    </div>
                </td>
            </tr>
            <tr colapan="2" align="center">
                <td></td>
                <td>
                    <input type="submit" class="btn btn-success" value="เพิ่มรายการ" id="add" name="add" onclick="clearValue()">
                </td> 
            </tr> 
        </table>   
                
       </div> 
       </div>	
    </form>
        <div class="list" align="center" >
            <h3>รายการขายสินค้า</h3>
         <div style="width:800px;  height:100px; overflow:auto;">
        <table class="table table-bordered" id="table-bordered" align="center" >
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
        <% for(Transaction t : ts ) {%>
        <% List<Transaction_details> td = tm.list_transaction_details(t.getTransaction_id()); %>
         <% if( !td.get(0).getAssets().getProduct_name().equals("-")){ %> 
            <tr>
                <td><%= sdf.format(t.getDate_time().getTime()) %></td>
                <td><%= sdtf.format(t.getDate_time().getTime()) %></td>
                <td><%= td.get(0).getAssets().getProduct_name() %> </td>
                <td><%= td.get(0).getAmount() %> <%= td.get(0).getAssets().getProduct_unit() %></td>
                <td><%= td.get(0).getSum() %></td>
                
                <td>
                    <a>
                        <i class="far fa-trash-alt"></i>
                    </a> 
                </td>   
            </tr>
            <%} %>
            <%} %>
        </tbody>
        </table>
        </div>   
    </div>    
    <jsp:include page="basic/footer.jsp" />
</body>
<style>
	*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Mitr', sans-serif;
 }
 .main{
 	margin-top:150px;
	margin-bottom:20px;
 }

  body{
    font-family: 'Mitr', sans-serif;
    
}

.form-control{
    width:215px;
    margin: 5px;
}

.table-bordered{
   width: 800px;
}
.custom-select{
    width: 215px;
    height: 58px;
    margin: 5px;
}
.list{
 	max-height:400px ;
	overflow:scroll;
	overflow-x:hidden;	 
	padding-top:0;
	margin-bottom:90px;
}
thead{
  background-color: #E0E0E0;
}
h4{
	color:#F9CF0B;
}
.p2{
	margin-top: 10px;
    margin-bottom: 10px;
}
</style>
</html>