package kr.go.tongyoung.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.tongyoung.dto.QnaDTO;

public class QnaDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	
	public ArrayList<QnaDTO> getQnaList() {
		ArrayList<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.QNA_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				QnaDTO dto = new QnaDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setAuthor(rs.getString("author"));
				dto.setResDate(rs.getString("regdate"));
				dto.setLev(rs.getInt("lev"));
				dto.setParno(rs.getInt("parno"));
				dto.setSec(rs.getString("sec"));
				dto.setVisited(rs.getInt("visited"));
				qnaList.add(dto);
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
		return qnaList;
	}
	
	public QnaDTO getQna(int no){
		QnaDTO dto = new QnaDTO();
		try {
			con = Maria.getConnection();
			//읽은 횟수 증가
			pstmt = con.prepareStatement(Maria.QNA_VISITED_UPDATE);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
			//해당 레코드를 검색
			pstmt = con.prepareStatement(Maria.QNA_SELECT_ONE);
			pstmt.setInt(1, no);		
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setResDate(rs.getString("regdate"));
				dto.setAuthor(rs.getString("author"));
				dto.setSec(rs.getString("sec"));
				dto.setVisited(rs.getInt("visited"));
				dto.setLev(rs.getInt("lev"));
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
	
	public int addQna(QnaDTO dto){
		int cnt = 0, no;
		try {
			con = Maria.getConnection();
			//글 추가
			pstmt = con.prepareStatement(Maria.QNA_INSERT);
			pstmt.setString(1, dto.getTitle()); 
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getAuthor());
			pstmt.setInt(4, dto.getLev());
			pstmt.setString(5, dto.getSec());
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = con.prepareStatement(Maria.QNA_SELECT_UP);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt("no");
			} else {
				no = 0;
			}
			rs.close();
			pstmt.close();
			
			pstmt = con.prepareStatement(Maria.QNA_INSERT_UPDATE);
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

	public int addReply(QnaDTO dto){
		int cnt = 0;
		try {
			con = Maria.getConnection();
			//답변글 추가
			pstmt = con.prepareStatement(Maria.QNA_REPLY_INSERT);
			pstmt.setString(1, dto.getTitle()); 
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getAuthor());
			pstmt.setInt(4, dto.getLev());
			pstmt.setInt(5, dto.getParno());
			pstmt.setString(6, dto.getSec());
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
		return cnt;
	}
	
	public int delQna(int no, int parno) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			//글 추가
			if(no==parno) {
				pstmt = con.prepareStatement(Maria.QNA_ALL_DELEDTE);
			} else {
				pstmt = con.prepareStatement(Maria.QNA_DELEDTE);
			}
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

	public int modifyQna(QnaDTO dto) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			//글 추가
			pstmt = con.prepareStatement(Maria.QNA_UPDATE);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getAuthor());
			pstmt.setString(4, dto.getSec());
			pstmt.setInt(5, dto.getLev());
			pstmt.setInt(6, dto.getNo());
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
