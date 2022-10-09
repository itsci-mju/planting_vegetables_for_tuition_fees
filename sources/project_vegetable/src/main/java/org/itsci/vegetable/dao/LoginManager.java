package org.itsci.vegetable.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.itsci.vegetable.model.Logins;
import org.itsci.vegetable.model.Member;

public class LoginManager {

	public Logins verifyLogin(String em,String pw){
		Logins l = null;
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
				Member mb = new Member();
				mb.setMember_id(member_id);
				 l = new Logins (email,pwd,status,mb);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}return l;

	}

}
