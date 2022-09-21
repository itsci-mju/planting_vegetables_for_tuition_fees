package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import bean.member;
import bean.member_shifts;
import bean.projects;
import bean.register;

public class RegisterManager {
	public int insertRegister(register rgt){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		try {
			Calendar rd = rgt.getRegister_date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
	        String  regdate =  sdf.format(rd.getTime());
	        
			Statement stmt = con.createStatement();
			String sql = "insert into register(register_id,member_id,project_id,register_reson,register_date,register_status,register_term) "
					+ "values('"+rgt.getRegister_id()+"','"
								+rgt.getMember().getMember_id()+"','"
								+rgt.getProjects().getProject_id()+"','"
								+rgt.getRegister_reson()+"','"
								+regdate+"','"
								+rgt.getRegister_status()+"','"
								+rgt.getRegister_term()+"');";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public register getRegister(String mid) {
		register rg = new register();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();  
		try {
			Statement stmt = con.createStatement();
			String sql ="select register_id,register_date,register_reson,register_status,register_term,member_id,project_id from register"
							+" where member_id = '"+mid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String register_id = rs.getString(1);
				String register_date = rs.getString(2);
				String register_reson = rs.getString(3);
				int register_status = Integer.parseInt(rs.getString(4));
				String register_term = rs.getString(5);
				
				String member_id = rs.getString(6);
				member mbid = new member();
				mbid.setMember_id(member_id);
				
				String project_id  = rs.getString(7);
				projects pjid = new projects();
				pjid.setProject_id(project_id);
				
				Calendar rdate = Calendar.getInstance(); 
                String date[] = register_date.split("-");
                String date2[] = date[2].split(" ");
                rdate.set(Integer.parseInt(date[0]), Integer.parseInt(date[1])+1, Integer.parseInt(date2[0]));
				
				rg = new register(register_id,register_reson,rdate,register_term,
							register_status, mbid,pjid);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rg;
	}
	
	public register getRegisterID(String mid) {
		register rg = new register();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();  
		try {
			Statement stmt = con.createStatement();
			String sql ="select register_id from register where member_id = '"+mid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String register_id = rs.getString(1);
				rg.setRegister_id(register_id);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rg;
	}
	
	public member getstuCode(String rd) {
		member m = new member();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();  
		try {
			Statement stmt = con.createStatement();
			String sql ="select m.student_code,m.member_name,m.member_id from member m inner join register r on m.member_id = r.member_id inner join member_shifts s on r.register_id = s.register_id where s.register_id = '"+rd+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String stu_code = rs.getString(1);
				String member_name = rs.getString(2);
				String member_id = rs.getString(3);
				m.setStudent_code(stu_code);
				m.setMember_name(member_name);
				m.setMember_id(member_id);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	public member getMember_shift(String s) {
		member m = new member();
		member_shifts shi = new member_shifts();
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();  
		try {
			Statement stmt = con.createStatement();
			String sql ="select m.student_code,m.member_name,m.member_id,s.date,s.startTime,s.endTime from member m inner join register r on m.member_id = r.member_id inner join member_shifts s on r.register_id = s.register_id where m.student_code  = '"+s+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String stu_code = rs.getString(1);
				String member_name = rs.getString(2);
				String member_id = rs.getString(3);
				String date = rs.getString(4);
				String startTime = rs.getString(5);
				String endTime = rs.getString(6);
				
					Calendar sdate = Calendar.getInstance();
					Calendar stime = Calendar.getInstance(); 
					Calendar etime = Calendar.getInstance();
							
							String date1[] = date.split("-");
							sdate.set(Integer.parseInt(date1[0]), Integer.parseInt(date1[1])-1, Integer.parseInt(date1[2]));
					
					String date4[] = endTime.split(":");
					int eth = Integer.parseInt( date4[0]);
					int etm = Integer.parseInt( date4[1]);
							 etime.set(Calendar.HOUR,eth);
							 etime.set(Calendar.MINUTE,etm);
							 
					String date5[] = startTime.split(":");
					int sth = Integer.parseInt( date5[0]);
					int stm = Integer.parseInt( date5[1]);
							 stime.set(Calendar.HOUR,sth);
							 stime.set(Calendar.MINUTE,stm);
							 
				m.setStudent_code(stu_code);
				m.setMember_name(member_name);
				m.setMember_id(member_id);
				//shi.getDate(sdate);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	public List<member> getMemberRequestProject() {
		List<member> list = new ArrayList<>();
		//member m = new member();
		//register  r = new register();
		String Status = "0";
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();  
		try {
			Statement stmt = con.createStatement();
			String sql ="select m.member_id,m.member_name,m.student_faculty,m.student_major,m.student_code,r.register_status from register r inner join member m on r.member_id = m.member_id where r.register_status = '" + Status +"'";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String member_id = rs.getString(1);
				String member_name = rs.getString(2);
				String student_faculty = rs.getString(3);
				String student_major = rs.getString(4);
				String student_code = rs.getString(5);
				//int register_status = rs.getInt(5);
				

				/*m.setStudent_code(stu_code);
				m.setMember_name(member_name);
				m.setMember_id(member_id);
				m.setStudent_major(student_major);
				m.setStudent_faculty(student_faculty);*/
				//r.setRegister_status(register_status);
				member m  = new member(member_id,0,member_name,"",null,
						"",student_code,student_major,student_faculty,"");
				
				//member m  = new member(member_id,0, member_name,student_faculty,null, student_major,student_code, "", "", "");
				list.add(m);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
