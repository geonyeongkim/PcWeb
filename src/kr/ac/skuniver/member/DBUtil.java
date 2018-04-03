package kr.ac.skuniver.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	
	//접속
	public static Connection getConnection(String id,String password) throws ClassNotFoundException, SQLException
	{
		Connection conn=null;
		//3.드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://117.17.142.132:3306",id,password);
		return conn;
	}
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs){
		if(rs!=null)
		{
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		close(conn,ps);
	}
	//close
	public static void close(Connection conn, PreparedStatement ps)
	{
		//2. 선언했던 객체 닫는다.
		if(ps!=null)
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	

}
 