package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.logins;
import bean.member;

public class LoginManager {

	public logins verifyLogin(String em,String pw){
		logins l = null;
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Statement stmt = con.createStatement();
			String sql = "select email,password,status,member_id from logins where email = '" + em +
					"' and password = '"+pw+"'";
			ResultSet rs = stmt.executeQuery(sql); 
			while (rs.next() && rs.getRow()==1) {
				String email = rs.getString(1);
				String pwd = rs.getString(2);
				int status = Integer.parseInt(rs.getString(3));
				String member_id = rs.getString(4);
				member mb = new member();
				mb.setMember_id(member_id);
				 l = new logins (email,pwd,status,mb);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}return l;

	}

}
