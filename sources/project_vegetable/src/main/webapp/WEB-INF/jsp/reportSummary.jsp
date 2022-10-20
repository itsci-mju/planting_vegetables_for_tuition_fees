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
		List<Transaction_details> ts = (List<Transaction_details>) request.getAttribute("list_details");
    	//List<Transaction_details> tsd = (List<Transaction_details>) request.getAttribute("ListTran");
	    TransactionManager tm = new TransactionManager(); 
	    ReportManager rm = new ReportManager();
	    String type = (String) request.getAttribute("type");
	    String startdate = (String) request.getAttribute("startdate");
	    String enddate = (String) request.getAttribute("enddate");
	
	    /*ค่าเริ่มต้นที่เเสดง*/
	    /*
	    if(ts == null){
	    	ts = rm.list_Alltransaction_details();
	    	type = "1";	 
	    }
	    */
	%>
	<%
	 	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat sdt = new SimpleDateFormat("HH:mm");
	    DecimalFormat df = new DecimalFormat("###,###,###.00");
	    
	    String date_time = (String) request.getAttribute("date");
		    
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
  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- css.gg -->
<link href='https://css.gg/css' rel='stylesheet'>

<!-- UNPKG -->
<link href='https://unpkg.com/css.gg/icons/all.css' rel='stylesheet'>

<!-- JSDelivr -->
<link href='https://cdn.jsdelivr.net/npm/css.gg/icons/all.css' rel='stylesheet'>
    <title>รายงานผลประกอบการของโครงการ</title>
</head>
<body>
<jsp:include page="basic/header.jsp" /> 
    <div class="container" align="center">
        <h3 >รายงานผลประกอบการ</h3>
        <h4>" โครงการปลูกผักเเลกค่าเทอม "</h4> 
        <form action="search_report_summary"  method="POST">
	        <table>
	        
		        <tr>
		        	<td><a href="reportSummary">
		        		<button type="submit" class="form-control  button-print" role="button" onclick="PrintTable()">รายงานผลประกอบการ 
		                    &nbsp;<img class="img_print" src="img/print.png">
		                </button>
		                </a></td>
		            <td><label class="tr1">วันที่ทำรายการ : </label><input type="date"  name="startdate" class="form-control  search_stucode" value="<%= startdate %>"></td>
		            <td><label class="tr3">ถึง</label></td>
		            <td><label class="tr1">วันที่สิ้นสุดทำรายการ : </label><input type="date" name="enddate"  class="form-control  search_stucode" value="<%= enddate %>"></td>
		            <td><label class="tr2">ประเภท :</label>
		                <div class="form-floating">
		                <select name="cars" class="custom-select" style="width:200px;">
		                    
			                     <option value="1" <% if(type.equals("1")) {%> selected  <%} %>>ทั้งหมด</option>
			                     <option value="สินค้า" <% if(type.equals("สินค้า")) {%> selected  <%} %>>รายรับ</option>
			                     <option value="อุปกรณ์" <% if(type.equals("อุปกรณ์")) {%> selected  <%} %>>รายจ่าย</option>
			                   
		                  </select>                 
		              </div>
		            </td>
		            <td>
		                <button type="submit" class="form-control  button-search" role="button" >ค้นหา 
		                    &nbsp;<i class="gg-search"></i>
		                </button>
		            </td>
		        </tr>
	    	</table>
        </form> 
    <div id="dvContents" >
        <table class="table table-bordered" id="dvContents" border="1">
            <thead>
              <tr>
                <th>วันที่</th>
                <th>เวลา</th>
                <th>ประเภท</th>
                <th>ราคา</th>
                <th>รายละเอียด</th>
                <th>รวม</th>
                <th>ต้นทุน</th>
                <th>ยอดคงเหลือสุทธิ</th>
              </tr>
            </thead>
            <tbody>
            <% if(ts.size() > 0) { %>
            <% double total = 0; %>
            	<% for(int i = 0; i < ts.size(); i++) {%>  
            	<% if(i == 0) {%>  
            		<% total = ts.get(i).getAssets().getProjects().getCost_amount(); %>
            	<% } %>
	              <tr>
	                <td><%= sdf.format(ts.get(i).getTransaction().getDate_time().getTime()) %></td>
	                <td><%= sdt.format(ts.get(i).getTransaction().getDate_time().getTime()) %></td>
	                <td><%= ts.get(i).getType() %></td>
	                <% if(ts.get(i).getType().equals("สินค้า")){ %>
	                <td><%= df.format(Integer.parseInt(ts.get(i).getAssets().getAsset_price())) %></td>
	                <% }else{ %>
	                <td><%= df.format(ts.get(i).getSum()/ts.get(i).getAmount()) %></td>
	                <% } %>  
	                
	                <% if(ts.get(i).getType().equals("สินค้า")){ %>
	                <td><%= ts.get(i).getAssets().getProduct_name() +" "+ ts.get(i).getAmount() +" "+ ts.get(i).getAssets().getProduct_unit() %></td>	 
	                <% }else{ %>
	                <td><%= ts.get(i).getAssets().getEquipment_name() +" "+ ts.get(i).getAmount() +" "+ ts.get(i).getAssets().getEquipment_unit() %></td>	
	                <% } %>    
	                       
	                <td><%= df.format(ts.get(i).getTransaction().getTotal_price()) %></td>
	                
	                <td><%= df.format( ts.get(i).getAssets().getProjects().getCost_amount() ) %></td>
	                <% 
	                	if(ts.get(i).getType().equals("สินค้า")){
		                	total += (ts.get(i).getTransaction().getTotal_price());
	                	}else{
		                	total -= (ts.get(i).getTransaction().getTotal_price());
	                	}
	                %>
	                <td><%= df.format( total ) %></td>
	                
	              </tr>
             	<% } %>
             <% } %>
            </tbody>
          </table>
    </div>
    </div>
<jsp:include page="basic/footer.jsp" />
</body>
<script type="text/javascript">
    function PrintTable() {
    	/*
    	var divToPrint=document.getElementById("dvContents");
        newWin= window.open("");
        newWin.document.write(divToPrint.outerHTML);
        newWin.print();
        newWin.close();
    	*/
        var printWindow = window.open('', '','height=700,width=1200');
        printWindow.document.write('<html><head><title>.</title></head>');
 
        
        //Print the DIV contents i.e. the HTML Table.
        printWindow.document.write('<body> <div align="center"> <h3>รายงานผลประกอบการ</h3> <h4> โครงการปลูกผักเเลกค่าเทอม </h4>  ');
        var divContents = document.getElementById("dvContents").innerHTML;
        
        printWindow.document.write(divContents);
        printWindow.document.write('</div> </body>');
 
        printWindow.document.write('</html>');
        printWindow.document.close();
        printWindow.print();
        
    }
    
    
    
</script>




<style >
    body{
    font-family: 'Mitr', sans-serif;
    
}
*{
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: 'Mitr', sans-serif;
   z-index: 2;
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
    margin-top: 180px;
    margin-bottom:150px;
}
.h4{
	
}
.tr3 {
    margin-top: 39px;
}
    /*button search*/
.button-search{
  align-items: center;
  appearance: none;
  background-color: #BDBDBD;
  border-radius: 10px;
  border-style: none;
  box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
  box-sizing: border-box;
  color: #000;
  cursor: pointer;
  display: inline-flex;
  fill: currentcolor;
  font-size: 14px;
  font-weight: 500;
  height: 36px;
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
  margin-top:31px;
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

  /*button print*/
.button-print{
  align-items: center;
  appearance: none;
  background-color: #FFE082;
  border-radius: 10px;
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
  margin-top:31px;
}

.button-print:focus {
  outline: none;
  border: 2px solid #4285f4;
}

.button-print:not(:disabled) {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-print:not(:disabled):hover {
  box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
}

.button-print:not(:disabled):focus {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}

.button-print:not(:disabled):active {
  box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
}

.button-print:disabled {
  box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
}
.img_print{
	width:25px;

}
</style>
    
</html>