<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*,org.itsci.vegetable.dao.*,org.itsci.vegetable.model.*,java.text.SimpleDateFormat" %>
     <%
	    transactionManager tm = new transactionManager(); 
	    List<transaction> ts =  tm.list_income_expense(); 
	   
	    %>
	    <%
	 	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	    sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
	  %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">  
<meta charset="UTF-8">
<title>รายรับรายจ่ายของโครงการ</title>
</head>
<link rel="stylesheet" href="css/listIncomeandExpense.css">
<body>
<jsp:include page="basic/header.jsp" /> 
	<div class="container">
	 <h2>รายรับรายจ่าย</h2>
	 <h3>"โครงการปลูกผักเเลกค่าเทอม"</h3>
	  <table class="table table-bordered">
    <thead>   
      <tr>
        <th>วันที่</th>
        <th>รวม</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <% for(transaction t : ts ) {%>
      <tr>
 
        <td><%= sdf.format(t.getDate_time().getTime()) %></td>
        <td><%= t.getTotal_price()  %></td>
        <td><a href="goEdit_income_expense?id=<%= sdf.format(t.getDate_time().getTime()) %>">
        		<button type="button" class="btn btn-warning">ดูรายละเอียด</button>
        	</a>
        </td>
        <td><a>
               <i class="far fa-trash-alt"></i>
            </a> 
        </td>
      </tr> 
      <%} %>
    </tbody>
  </table>

	</div>
<jsp:include page="basic/footer.jsp" />
</body>
</html>