package com.demo.doa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.demo.model.UserBean;

public class UserDAO {


		Connection con;
		
		public UserDAO(){
			try{
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test123", "root","password");

				if(con!=null){
					System.out.println("connected again");
			
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
		public int deleteUser(String id){
			int x = 0;
			try{
				PreparedStatement ps1 = con.prepareStatement("delete from users where username=?");
				ps1.setString(1, id);
				x = ps1.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}
			return x;
		}
		
		public int insertUser(UserBean user) {
			int x = 0;
			try{
				PreparedStatement ps = con.prepareStatement("insert into users values(?,?)");
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getPassword());
				x = ps.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return x;
		}
		
		public int updateUser(String uname, String password, String id){
			int x=0;
			try{
				PreparedStatement ps = con.prepareStatement("update users set username = ?, password = ? where username=? ");
				ps.setString(1, uname);
				ps.setString(2, password);
				ps.setString(3, id);
			x = ps.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return x;
		}

}
