package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import bean.member;
import bean.member_shifts;
import bean.projects;
import bean.register;

public class membershiftManager {
	public int insertShift(member_shifts ms){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		//register reg = new register();
		try {
			Calendar bd = ms.getDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat stf = new SimpleDateFormat("HH:mm");
	        sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));
	        String  dateshift =  sdf.format(bd.getTime());
	        
	        Calendar st = ms.getStartTime();	
	        String  startTime =  stf.format(st.getTime());
	        
	        Calendar et = ms.getEndTime();
	        String  endTime =  stf.format(et.getTime());
	     
			Statement stmt = con.createStatement();
			String sql = "insert into member_shifts(member_shift_id,date,endTime,startTime,status,task_name,register_id)"
					+ "values('"+ms.getMember_shift_id()+"','"
								+dateshift+"','"
								+endTime+"','"
								+startTime+"','"
								+ms.getStatus()+"','"
								+ms.getTask_name()+"','"
								+ms.getRegister().getRegister_id()+"')";
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public int ApproveShift(member_shifts ms){
		ConnectionDB condb = new ConnectionDB();
		Connection con = condb.getConnection();
		
		try {	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat stf = new SimpleDateFormat("HH:mm");
	        sdf.setTimeZone(TimeZone.getTimeZone("GMT+7"));

	        Calendar et = ms.getEndTime();
	        String  endTime =  stf.format(et.getTime());
	     
			Statement stmt = con.createStatement();
			String sql = "update member_shifts "
					+ "set status = "+ms.getStatus()+","
					+ "endTime = '"+endTime+"',"
					+ "task_name = '"+ms.getTask_name()+"' "
					+ "where member_shift_id = '"+ ms.getMember_shift_id()+"'" ;
			int result = stmt.executeUpdate(sql);
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	
	
    public List<member_shifts> getListShifts(){
         List<member_shifts> list = new ArrayList<>();
         ConnectionDB condb = new ConnectionDB();
         Connection con = condb.getConnection();
        try {
            Statement stmt = con.createStatement();
            
            String column = "member_shift_id,date,endTime,startTime,status,task_name,register_id";
            String sql = "select "+column+" from member_shifts";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                String member_shift_id = rs.getString(1);  
                String date = rs.getString(2);
                String endTime  = rs.getString(3);
                String startTime = rs.getString(4);
                int status = rs.getInt(5);
                String task_name = rs.getString(6);
                String register_id = rs.getString(7);
                 
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
						 
              register reg = new register();
              reg.setRegister_id(register_id);
                member_shifts st = new member_shifts(member_shift_id,task_name,sdate,stime,etime,status,reg);

                list.add(st);
            }

            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }

        return list;


    }
    
    
   /*public member_shifts getMemShifts(){
        member_shifts st = new member_shifts();
        ConnectionDB condb = new ConnectionDB();
        Connection con = condb.getConnection();
       try {
           Statement stmt = con.createStatement();
           
           String column = "member_shift_id,date,endTime,startTime,status,task_name,register_id";
           String sql = "select "+column+" from member_shifts";
           ResultSet rs = stmt.executeQuery(sql);
           while(rs.next()) {
               String member_shift_id = rs.getString(1);  
               String date = rs.getString(2);
               String endTime  = rs.getString(3);
               String startTime = rs.getString(4);
               int status = rs.getInt(5);
               String task_name = rs.getString(6);
               String register_id = rs.getString(7);
                
				Calendar sdate = Calendar.getInstance();
               Calendar stime = Calendar.getInstance(); 
				Calendar etime = Calendar.getInstance();
				
				String date1[] = date.split("-");
				String date2[] = date1[2].split(" ");
				String date3[] = date2[1].split(":");
						sdate.set(Integer.parseInt(date1[0]), Integer.parseInt(date1[1])-1, Integer.parseInt(date2[0]), Integer.parseInt(date3[0]), Integer.parseInt(date3[1]));
				
				String date4[] = endTime.split("-");
				String date5[] = date4[2].split(" ");
				String date6[] = date5[1].split(":");
						 etime.set(Integer.parseInt(date4[0]), Integer.parseInt(date4[1])-1, Integer.parseInt(date5[0]), Integer.parseInt(date6[0]), Integer.parseInt(date6[1]));
						 
				String date7[] = startTime.split("-");
				String date8[] = date7[2].split(" ");
				String date9[] = date8[1].split(":");
						stime.set(Integer.parseInt(date7[0]), Integer.parseInt(date7[1])-1, Integer.parseInt(date8[0]), Integer.parseInt(date9[0]), Integer.parseInt(date9[1]));
             register reg = new register();
             reg.setRegister_id(register_id);
               st = new member_shifts(member_shift_id,task_name,sdate,stime,etime,status,reg);

               //list.add(st);
           }

           con.close();
       }catch(SQLException e){
           e.printStackTrace();
       }

       return st;
   }*/
    
    
    public member_shifts getMShifts_byRegis(String r){
         member_shifts st = new member_shifts();
         ConnectionDB condb = new ConnectionDB();
         Connection con = condb.getConnection();
        try {
            Statement stmt = con.createStatement();
            
            String column = "member_shift_id,date,endTime,startTime,status,task_name,register_id";
            String sql = "select "+column+" from member_shifts where register_id = '"+r+"'";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                String member_shift_id = rs.getString(1);  
                String date = rs.getString(2);
                String endTime  = rs.getString(3);
                String startTime = rs.getString(4);
                int status = rs.getInt(5);
                String task_name = rs.getString(6);
                String register_id = rs.getString(7);
                 
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
              register reg = new register();
              reg.setRegister_id(register_id);
                st = new member_shifts(member_shift_id,task_name,sdate,stime,etime,status,reg);

            }

            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }

        return st;


    }
}