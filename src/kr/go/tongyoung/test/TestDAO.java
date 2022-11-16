package kr.go.tongyoung.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.go.tongyoung.model.Maria;

public class TestDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	
	public TestDTO testDataOne(String name){
		TestDTO dto = new TestDTO();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TEST_SELECT_ONE);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setName(rs.getString("name"));
				dto.setPoint(rs.getInt("point"));
			}
		} catch(Exception e){
			System.out.println("잘못된 연산");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return dto;
	}

	public ArrayList<TestDTO> testDataAll() {
		ArrayList<TestDTO> list = new ArrayList<TestDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TEST_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TestDTO dto = new TestDTO();
				dto.setName(rs.getString("name"));
				dto.setPoint(rs.getInt("point"));
				list.add(dto);
			}
		} catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return list;
	}
}
