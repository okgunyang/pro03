package kr.go.tongyoung.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.go.tongyoung.dto.PicDTO;
import kr.go.tongyoung.dto.TourDTO;

public class TourDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public int loadLastNo(){	//중복 아이디 체크 / 회원가입시 가입전 체크
		int no = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.LOAD_LAST_NO);
			rs = pstmt.executeQuery();
			if(rs.next()){ 
				no = rs.getInt("no") + 1;	
			} else { 
				no = 1;	
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return no;
	}
	
	public int fileUpload(PicDTO dto){
		int cnt = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.FILE_UPLOAD);
			pstmt.setString(1, dto.getTourno());
			pstmt.setString(2, dto.getPicname());
			pstmt.setInt(3, dto.getPos());
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}

	public ArrayList<PicDTO> JSONPicList(String tourno) {
		ArrayList<PicDTO> picList = new ArrayList<PicDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.JSON_PICLIST);
			pstmt.setString(1, tourno);
			rs = pstmt.executeQuery();
			while(rs.next()){
				PicDTO pic = new PicDTO();
				pic.setNo(rs.getInt("no"));
				pic.setTourno(rs.getString("tourno"));
				pic.setPicname(rs.getString("picname"));
				pic.setPos(rs.getInt("pos"));
				picList.add(pic);
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return picList;
	}

	public int addTour(TourDTO dto) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.ADD_TOUR);
			pstmt.setString(1, dto.getTourno());
			pstmt.setString(2, dto.getCate());
			pstmt.setString(3, dto.getPlace());
			pstmt.setString(4, dto.getComment1());
			pstmt.setString(5, dto.getComment2());
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}

	public ArrayList<TourDTO> getTourList() {
		ArrayList<TourDTO> tourList = new ArrayList<TourDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_LIST_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TourDTO tour = new TourDTO();
				tour.setNo(rs.getInt("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setPlace(rs.getString("place"));
				tourList.add(tour);
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return tourList;
	}

	public TourDTO getTour(int no) {
		TourDTO tour = new TourDTO();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_LIST_DETAIL);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				tour.setNo(rs.getInt("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setPlace(rs.getString("place"));
				tour.setComment1(rs.getString("comment1"));
				tour.setComment2(rs.getString("comment2"));
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return tour;
	}

	public int delTour(int no) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_DEL);
			pstmt.setInt(1, no);
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}

	public int modifyTour(TourDTO dto) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			//tourno=?, cate=?, place=?, comment1=?, comment2=? where no=?
			pstmt = con.prepareStatement(Maria.MODIFY_TOUR);
			pstmt.setString(1, dto.getTourno());
			pstmt.setString(2, dto.getCate());
			pstmt.setString(3, dto.getPlace());
			pstmt.setString(4, dto.getComment1());
			pstmt.setString(5, dto.getComment2());
			pstmt.setInt(6, dto.getNo());
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}

	public ArrayList<TourDTO> JSONPlaceList() {
		ArrayList<TourDTO> tourList = new ArrayList<TourDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_LIST_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TourDTO tour = new TourDTO();
				tour.setNo(rs.getInt("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setPlace(rs.getString("place"));
				tourList.add(tour);
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return tourList;
	}

	public ArrayList<TourDTO> getTourCateList(String cate) {
		ArrayList<TourDTO> tourList = new ArrayList<TourDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_CATE_LIST);
			pstmt.setString(1, cate); 
			rs = pstmt.executeQuery();
			while(rs.next()){
				TourDTO tour = new TourDTO();
				tour.setNo(rs.getInt("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setPlace(rs.getString("place"));
				tour.setImgURL(rs.getString("picname"));
				tour.setComment1(rs.getString("comment1"));
				tour.setComment2(rs.getString("comment2"));
				tourList.add(tour);
			}
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패");
		} catch(Exception e){
			System.out.println("SQL 구문이 처리되지 못했거나 연산이 잘못되었습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return tourList;
	}
}
