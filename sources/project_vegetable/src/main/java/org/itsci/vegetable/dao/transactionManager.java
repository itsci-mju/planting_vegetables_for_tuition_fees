package org.itsci.vegetable.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;
import java.util.Vector;

import org.itsci.vegetable.model.assets;
import org.itsci.vegetable.model.member;
import org.itsci.vegetable.model.projects;
import org.itsci.vegetable.model.transaction;
import org.itsci.vegetable.model.transaction_details;

public class transactionManager {
	/*add income*/
	public int addincome_tsac_detail(transaction_details td){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			
	        
			Statement stmt = con.createStatement();
			String sql = "insert into transaction_details(transaction_detail_id,amount,sum,type,asset_id,transaction_id) "
					+ "values('"+td.getTransaction_detail_id()+"','"
								+td.getAmount()+"','"
								+td.getSum()+"','"
								+td.getType()+"','"
								+td.getAssets().getAsset_id()+"','"
								+td.getTransaction().getTransaction_id()+"');";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	public int addincome_transaction(transaction t){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Calendar tsd = t.getDate_time();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
	        String  transacdate =  sdf.format(tsd.getTime());
	        
			Statement stmt = con.createStatement();
			String sql = "insert into transaction(transaction_id,date_time,term,total_price,member_id) "
					+ "values('"+t.getTransaction_id()+"','"
								+transacdate+"','"
								+t.getTerm()+"','"
								+t.getTotal_price()+"','"
								+t.getMember().getMember_id()+"');";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public int addExpense_tsac_detail(transaction_details td){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			
	        
			Statement stmt = con.createStatement();
			String sql = "insert into transaction_details(transaction_detail_id,amount,sum,type,asset_id,transaction_id) "
					+ "values('"+td.getTransaction_detail_id()+"','"
								+td.getAmount()+"','"
								+td.getSum()+"','"
								+td.getType()+"','"
								+td.getAssets().getAsset_id()+"','"
								+td.getTransaction().getTransaction_id()+"');";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	public int addExpense_transaction(transaction t){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Calendar tsd = t.getDate_time();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
	        String  transacdate =  sdf.format(tsd.getTime());
	        
			Statement stmt = con.createStatement();
			String sql = "insert into transaction(transaction_id,date_time,term,total_price,member_id) "
					+ "values('"+t.getTransaction_id()+"','"
								+transacdate+"','"
								+t.getTerm()+"','"
								+t.getTotal_price()+"','"
								+t.getMember().getMember_id()+"');";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	
	public List<assets> getAssets() {
		List<assets> as = new Vector<>();
		projects p = new projects(); 
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from assets";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int asset_id = rs.getInt(1);
				String asset_price = rs.getString(2);
				String equipment_name = rs.getString(3);
				String equipment_unit = rs.getString(4);
				String product_name = rs.getString(5);
				String product_unit = rs.getString(6);
				String project_id = rs.getString(7);
				
				p.setProject_id(project_id);
				assets a = new assets(asset_id,asset_price,equipment_name,equipment_unit,product_name,product_unit,p);
					 as.add(a);
				 }
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return as;
	}

	public List<transaction> list_transaction() {
		List<transaction> ts = new Vector<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from transaction ";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int transaction_id = rs.getInt(1);
				
				String date_time = rs.getString(2);
				Calendar tdate = Calendar.getInstance(); 
                String date[] = date_time.split("-");
                String date2[] = date[2].split(" ");
                String date3[] = date2[1].split(":");
                
                tdate.set(Integer.parseInt(date[0]), Integer.parseInt(date[1])+1, Integer.parseInt(date2[0]),Integer.parseInt(date3[0]),Integer.parseInt(date3[1]));

				String term = rs.getString(3);
				Double total_price = rs.getDouble(4);
				
				String member_id = rs.getString(5); 
				
				memberManager m = new memberManager();
				member mb = m.getMember(member_id);
				transaction t = new transaction(transaction_id,tdate,total_price,term,mb);
					ts.add(t);
				 }
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ts;
	}


	public transaction transactionID(int tsid) {
		transaction ts = new transaction();
		
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from transaction where transaction_id = "+ tsid  +" ";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int transaction_id = rs.getInt(1);
				
				String date_time = rs.getString(2);
				Calendar tdate = Calendar.getInstance(); 
                String date[] = date_time.split("-");
                String date2[] = date[2].split(" ");
                String date3[] = date2[1].split(":");
                
                tdate.set(Integer.parseInt(date[0]), Integer.parseInt(date[1])+1, Integer.parseInt(date2[0]),Integer.parseInt(date3[0]),Integer.parseInt(date3[1]));

				String term = rs.getString(3);
				Double total_price = rs.getDouble(4);
				
				String member_id = rs.getString(5); 
				
				memberManager m = new memberManager();
				member mb = m.getMember(member_id);
				 ts = new transaction(transaction_id,tdate,total_price,term,mb);	
				 }
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ts;
	}
	
	public assets assetID(int as) {
		assets a = new assets();
		projects p = new projects(); 
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from assets where asset_id = "+ as +"";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int asset_id = rs.getInt(1);
				String asset_price = rs.getString(2);
				String equipment_name = rs.getString(3);
				String equipment_unit = rs.getString(4);
				String product_name = rs.getString(5);
				String product_unit = rs.getString(6);
				String project_id = rs.getString(7);
				
				p.setProject_id(project_id);
				a = new assets(asset_id,asset_price,equipment_name,equipment_unit,product_name,product_unit,p);
					
				 }
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return a;
	}
	
	public List<transaction_details> list_transaction_details(String tid) {
		List<transaction_details> tsd = new Vector<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from transaction_details where transaction_id = "+ tid +"";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int transaction_detail_id = rs.getInt(1);
				int amount = rs.getInt(2);
				double sum = rs.getDouble(3);
				String type = rs.getString(4);
				int asset_id = rs.getInt(5);
				int transaction_id = rs.getInt(6);
				
				assets as = assetID(asset_id);
				transaction ts = transactionID(transaction_id);
	
				transaction_details t = new transaction_details(transaction_detail_id,type,amount,sum,ts,as);
					tsd.add(t);
				 }
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tsd;
	}
	
	public List<transaction> list_income_expense() {
		List<transaction> tsd = new Vector<>();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select sum(total_price),CAST(date_time AS date) from transaction  group by CAST(date_time AS date);";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				
				double total_price = rs.getDouble(1);
				String date_time = rs.getString(2);
				Calendar tdate = Calendar.getInstance(); 
                String date[] = date_time.split("-");
                tdate.set(Integer.parseInt(date[0]), Integer.parseInt(date[1])+1, Integer.parseInt(date[2]));

				transaction t = new transaction(0,tdate,total_price,"",new member());
				
				
					tsd.add(t);
				 }
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(tsd.get(0).getTotal_price());
		return tsd;
	}
	
	public transaction transaction_by_date(String t) {
		transaction ts = new transaction();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select * from transaction  where CAST(date_time AS date) ="+ t +"";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int transaction_id = rs.getInt(1);
				
				String date_time = rs.getString(2);
				Calendar tdate = Calendar.getInstance(); 
                String date[] = date_time.split("-");
                tdate.set(Integer.parseInt(date[0]), Integer.parseInt(date[1])+1, Integer.parseInt(date[2]));
				String term = rs.getString(3);
				Double total_price = rs.getDouble(4);
				
				String member_id = rs.getString(5); 
				
				memberManager m = new memberManager();
				member mb = m.getMember(member_id);
				 ts = new transaction(transaction_id,tdate,total_price,term,mb);	
				 }
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return ts;
	}
}
