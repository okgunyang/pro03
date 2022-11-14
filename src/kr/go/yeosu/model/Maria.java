package kr.go.yeosu.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Maria {
    static final String DRIVER = "org.mariadb.jdbc.Driver";
    static final String URL = "jdbc:mariadb://127.0.0.1:3308/goverment?serverTimezone=Asia/Seoul";
    static final String USER = "root";
    static final String PW = "1234";
    
	final static String NOTICE_SELECT_ALL = "select * from notice order by regdate desc";
	final static String NOTICE_VISITED_UPDATE = "update notice set visited = visited + 1 where no=?";
	final static String NOTICE_SELECT_ONE = "select * from notice where no=?";
	final static String NOTICE_INSERT = "insert into notice(title, content) values (?, ?)";
	final static String NOTICE_DELEDTE = "delete from notice where no=?";
	final static String NOTICE_UPDATE = "update notice set title=?, content=? where no=?";
	
	final static String USER_JOIN = "insert into user(id, pw, name, birth, email, tel, addr) values (?,?,?,?,?,?,?)";
	final static String USER_LOGIN = "select * form user where id=? and pw=?";
	final static String USER_ID_CHECK = "select * from user where id=?";
	final static String USER_ALL = "select * from user";
	final static String USER_UPDATE = "update user set pw=?, name=?, birth=?, email=?, tel=?, addr=? where id=?";
	final static String VISIT_UPDATE = "update user set visted=visted+1 where id=?";
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER);
		Connection con = DriverManager.getConnection(URL, USER, PW);
		return con;
	}
	
	public static void close(PreparedStatement pstmt, Connection con) {
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		if(rs!=null){
			try {
				rs.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}
