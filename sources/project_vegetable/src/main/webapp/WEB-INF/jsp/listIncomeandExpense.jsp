<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*,org.itsci.vegetable.dao.*,org.itsci.vegetable.model.*,java.text.*" %>
     <%
     	MemberManager mbm = new MemberManager();
		Logins log = new Logins();
		Member mb = new Member();	
		try{
				log = (Logins)session.getAttribute("login");
				mb = mbm.getMember(log.getMember().getMember_id());		
		}catch (Exception e) {	
			
		} 
		/*ค่าเริ่มต้น เปล่าๆ*/
     	List<Transaction_details> ts = (List<Transaction_details>) request.getAttribute("ListTran");
    	List<Transaction_details> tsd = (List<Transaction_details>) request.getAttribute("list_details");
	    TransactionManager tm = new TransactionManager(); 
	    String type = (String) request.getAttribute("type");
	    String select_date = (String) request.getAttribute("new_date");
		/*ค่าเริ่มต้นที่เเสดง*/
	    if(ts == null){
	    	ts = tm.Alltransaction_by_search();
	    	type = "1";	 
	    }
	    %>
	    <%
		 	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		    DecimalFormat df = new DecimalFormat("###,###,###.00");
	 	%>
	 	
<!DOCTYPE html>
<html>
<head>
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

<meta charset="UTF-8">
<title>รายรับรายจ่ายของโครงการ</title>
</head>
<!-- <link rel="stylesheet" href="css/listIncomeandExpense.css"> -->
<body>
<jsp:include page="basic/header.jsp" /> 
	<div class="container" align="center"> 
	 <h2>รายรับรายจ่ายของโครงการ</h2>
	 <h3>"โครงการปลูกผักแลกค่าเทอม"</h3>
	<form action="search_income_expense"  method="POST">
		<div class="">
		<label class="">วันที่:</label>
		<input type="date" name="date" value="<%= select_date %>" class="form-control registered " >
		
				<label class="">ประเภท:</label>
				<select name="type" id="type" class="form-control registered ">
					<% if(type.equals("1")) {%>
	                     <option value="1" selected>ทั้งหมด</option>
	                     <option value="สินค้า">รายรับ</option>
	                     <option value="อุปกรณ์">รายจ่าย</option>
	                <%}else if (type.equals("สินค้า")){ %>
	                     <option value="1" >ทั้งหมด</option>
	                     <option value="สินค้า"selected>รายรับ</option>
	                     <option value="อุปกรณ์">รายจ่าย</option>
	                <%}else if (type.equals("อุปกรณ์")){ %>
	                	 <option value="1" >ทั้งหมด</option>
	                     <option value="สินค้า">รายรับ</option>
	                     <option value="อุปกรณ์"selected>รายจ่าย</option>
	                <%} %>
	             </select>
	             <button type="submit" class="button-20" role="button" >ค้นหา 
	             	&nbsp;<i class="gg-search"></i>
	             </button>
       		</div>
	</form>
	<div class="scoll-list">
	<table class="table table-bordered" align="center"  style="width:800;">
    <thead align="center">   
      <tr>
        <th>วันที่</th>
        <th>ประเภท</th>
        <th>รายละเอียด</th>
        <th>ราคา</th>
        <th>รวม</th>
        <th class="th-width"></th>
      </tr>
    </thead>
    <tbody align="center">
    <% if(ts.size() > 0) { %>
    <% for(Transaction_details td : ts ) {%>  
    <% Transaction t = tm.transactionID(td.getTransaction().getTransaction_id()); %>
      <tr>
        <td><%= sdf.format(t.getDate_time().getTime()) %></td>
         <% SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	      	 String date = sd.format(t.getDate_time().getTime());
			 String date1[]=date.split("-");
			 int year = Integer.parseInt(date1[0]);
			 String new_date = date.replace(date1[0],String.valueOf(year));
             tsd = tm.Alltransaction_details_by_search(new_date);
          %>
      	  <td> 
      	  	  <% for(Transaction_details detail : tsd ) {%>
	      	  	  <% if(type.equals(detail.getType())){ %>
			        	<div><%= detail.getType() %></div>
			      <%}else if (type.equals("1")){%>
			      		<div><%= detail.getType() %></div>
			      <%} %>	
	          <%}%>
	      </td>
          <td> 
	      <% for(Transaction_details detail : tsd ) {%>
	      <!-- ประเภทข้อมูลให้ตรงตรงกับที่เลือก-->
	      	  <% if(type.equals(detail.getType())){ %>
			        	<% if(detail.getType().equals("สินค้า")){%>
		        	 		<div><%= detail.getAssets().getProduct_name()+" "+detail.getAmount()+" "+detail.getAssets().getProduct_unit() %></div>
		      			 <%}else if (detail.getType().equals("อุปกรณ์")){%>
		           			<div><%= detail.getAssets().getEquipment_name()+" "+detail.getAmount()+" "+detail.getAssets().getEquipment_unit() %></div>
		      			 <%}%>
		  <!-- ประเภทข้อมูลที่ไม่ใช่ สินค้าเเละอุปกรณ์ -->
			    <%}else if (type.equals("1")){%>
			      		 <% if(detail.getType().equals("สินค้า")){%>
		        	 		<div><%= detail.getAssets().getProduct_name()+" "+detail.getAmount()+" "+detail.getAssets().getProduct_unit() %></div>
		      			 <%}else if (detail.getType().equals("อุปกรณ์")){%>
		           			<div><%= detail.getAssets().getEquipment_name()+" "+detail.getAmount()+" "+detail.getAssets().getEquipment_unit() %></div>
		      			 <%}%>
			  <%} %> 
	      <%}%>
          </td>
           
          <td> 
      	  	  <% for(Transaction_details detail : tsd ) {%>
		        	   <% if(type.equals(detail.getType())){ %>
			        	<div><%= df.format(detail.getSum()) %></div>
			      <%}else if (type.equals("1")){%>
			      		<div><%= df.format(detail.getSum())  %></div>
			      <%} %>	

	          <%}%>
	      </td>
        <td><%= df.format( td.getTransaction().getTotal_price()) %></td>
      
        <td>
        <% if(!type.equals("1")){ %>
        	<a href="goEdit_income_expense?date=<%= sdf2.format(t.getDate_time().getTime()) %>&&type=<%= td.getType() %>">
				<button type="button" class="button-17" role="button" >ดู 
				&nbsp; 	<i class="gg-eye"></i></button></a>
		<%} %>
        	<a href="">
				<button type="button" class="button-19" role="button" >ยกเลิก
				&nbsp; &nbsp;	<i class="gg-trash"></i>
				</button></a>
   
        </td>
      </tr> 
      <%} %>
      <%}else{%>
      	<tr>
      		<td colspan="6"><h1 align="center">ไม่มีรายการเเสดง</h1></td>
      	</tr>
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
 .scoll-list{
 	max-height:300px ;
	overflow:scroll;
	overflow-x:hidden;	 
	padding-top:0;
	margin-bottom:90px;
 }
.container{
	margin-top:180px;
	margin-bottom:200px;
}
.s_date{
 margin-top: 40px;
}
.p_date{
	margin-right: 565px;
}
.t_date{
    margin-right: 265px;
    margin-top: -36px;
}
.ty_seltype{
margin-left: 40px;
}
.p_type{
margin-right: 265px;
overflow: visible;
}
.sel_type{
margin-right: 265px;
}
.btn{
	width:50px;
}
i{

}
table{
	width:1000px;
	margin-top:50px;
}
.th-width{
	width:400px;
}
th{
	width:250px;
	align:center;
}
thead{
  background-color: #00AE3B;
}

/*button view*/
.button-17 {
  align-items: center;
  appearance: none;
  background-color: #017f3f;
  border-radius: 24px;
  border-style: none;
  box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
  box-sizing: border-box;
  color: #fff;
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
  background: #F6F9FE;
  color: #174ea6;
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

/*button edit*/
.button-19 {
  align-items: center;
  appearance: none;
  background-color: #dc3545;
  border-radius: 24px;
  border-style: none;
  box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
  box-sizing: border-box;
  color: #fff;
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

.button-19:hover {
  background: #F6F9FE;
  color: #174ea6;
}

.button-19:active {
  box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
  outline: none;
}

.button-19:focus {
  outline: none;
  border: 2px solid #4285f4;
}

.button-19:not(:disabled) {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-19:not(:disabled):hover {
  box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
}

.button-19:not(:disabled):focus {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-19:not(:disabled):active {
  box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
}

.button-19:disabled {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}
/*button search*/
.button-20 {
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

.button-20:hover {
  background: #F6F9FE;
  color: #174ea6;
}

.button-20:active {
  box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
  outline: none;
}

.button-20:focus {
  outline: none;
  border: 2px solid #4285f4;
}

.button-20:not(:disabled) {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-20:not(:disabled):hover {
  box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
}

.button-20:not(:disabled):focus {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-20:not(:disabled):active {
  box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
}

.button-20:disabled {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

/*ค้นหา*/
.registered{
	width:260px;
}
</style>

</html>