package kr.go.tongyoung.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;

import org.junit.Test;

public class MariaDBTest {
    private final static Logger log = Logger.getGlobal();
    private static final String DRIVER = "org.mariadb.jdbc.Driver";
    private static final String URL = "jdbc:mariadb://127.0.0.1:3308/goverment?serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PW = "1234";
    
	@Test
	public void connectionTest() throws ClassNotFoundException {
		
		Class.forName(DRIVER);
		
		String sql = "select now() as time";
		try(
			Connection conn = DriverManager.getConnection(URL,USER,PW);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			) {
			
			assertNotNull(conn);
			log.info("conn : " + conn);
			log.info("pstmt : " + pstmt);
			
			rs.next();
			log.info(rs.getString("time"));
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}	
}
