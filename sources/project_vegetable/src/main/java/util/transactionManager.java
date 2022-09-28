package util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;
import bean.assets;
import bean.transaction;
import bean.transaction_details;

public class transactionManager {
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
	public int addincome_assets(assets as){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {        
			Statement stmt = con.createStatement();
			String sql = "insert into assets(asset_id,asset_price,equipment_name,equipment_unit,product_name,product_unit,project_id) "
					+ "values('"+as.getAsset_id()+"','"
								+as.getAsset_price()+"','"
								+as.getEquipment_name()+"','"
								+as.getEquipment_unit()+"','"
								+as.getProduct_name()+"','"
								+as.getProduct_unit()+ "','"
								+as.getProjects().getProject_id()+"');";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}


}
