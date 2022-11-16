package kr.go.tongyoung.dto;

public class TourDTO {
	private int no;
	private String tourno;
	private String cate;
	private String place;
	private String comment1;
	private String comment2;
	private String imgURL;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTourno() {
		return tourno;
	}
	public void setTourno(String tourno) {
		this.tourno = tourno;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getComment1() {
		return comment1;
	}
	public void setComment1(String comment1) {
		this.comment1 = comment1;
	}
	public String getComment2() {
		return comment2;
	}
	public void setComment2(String comment2) {
		this.comment2 = comment2;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	@Override
	public String toString() {
		return "TourDTO [no=" + no + ", tourno=" + tourno + ", cate=" + cate
				+ ", place=" + place + ", comment1=" + comment1 + ", comment2="
				+ comment2 + "]";
	}
}
