package kr.go.tongyoung.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.tongyoung.dto.ImpressDTO;

public class ImpressDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	
	public ArrayList<ImpressDTO> getImpressList() {
		ArrayList<ImpressDTO> impList = new ArrayList<ImpressDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.IMPRESS_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ImpressDTO dto = new ImpressDTO();
				dto.setNo(rs.getInt("no"));
				dto.setCate(rs.getString("cate"));
				dto.setTourno(rs.getString("tourno"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setStar(rs.getDouble("star"));
				dto.setImgSrc(rs.getString("imgsrc"));
				dto.setRegdate(rs.getString("regdate"));
				impList.add(dto);
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch(SQLException e){
			System.out.println("SQL 구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return impList;
	}
	
	public ImpressDTO getImpress(int no){
		ImpressDTO dto = new ImpressDTO();
		try {
			con = Maria.getConnection();
			//해당 레코드를 검색
			pstmt = con.prepareStatement(Maria.IMPRESS_SELECT_ONE);
			pstmt.setInt(1, no);		
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setNo(rs.getInt("no"));
				dto.setCate(rs.getString("cate"));
				dto.setTourno(rs.getString("tourno"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setStar(rs.getDouble("star"));
				dto.setImgSrc(rs.getString("imgsrc"));
				dto.setRegdate(rs.getString("regdate"));
			}

		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch(SQLException e){
			System.out.println("SQL 구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return dto;
	}
	
	public void addImpress(ImpressDTO dto){
		try {
			con = Maria.getConnection();
			//글 추가
			pstmt = con.prepareStatement(Maria.IMPRESS_INSERT);
			pstmt.setString(1, dto.getCate());
			pstmt.setString(2, dto.getTourno());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getContent());
			pstmt.setDouble(5, dto.getStar());
			pstmt.setString(6, dto.getImgSrc());
			pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch(SQLException e){
			System.out.println("SQL 구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
	}

	public int delImpress(int no) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			//글 삭제
			pstmt = con.prepareStatement(Maria.IMPRESS_DELETE);
			pstmt.setInt(1, no);
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch(SQLException e){
			System.out.println("SQL 구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}

	public int modifyImpress(ImpressDTO dto) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			//글 추가
			pstmt = con.prepareStatement(Maria.IMPRESS_UPDATE);
			
			pstmt.setString(1, dto.getContent());
			pstmt.setDouble(2, dto.getStar());
			pstmt.setString(3, dto.getId());		
			pstmt.setInt(4, dto.getNo());
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch(SQLException e){
			System.out.println("SQL 구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e){
			System.out.println("잘못된 연산 및 요청으로 인해 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}
}
