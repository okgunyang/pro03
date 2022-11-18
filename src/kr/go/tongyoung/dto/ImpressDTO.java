package kr.go.tongyoung.dto;

public class ImpressDTO {
	private int no;
	private String cate;
	private String tourno;
	private String id;
	private String content;
	private Double star;
	private String imgSrc;
	private String regdate;
	private String place;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getTourno() {
		return tourno;
	}
	public void setTourno(String tourno) {
		this.tourno = tourno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Double getStar() {
		return star;
	}
	public void setStar(Double star) {
		this.star = star;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	@Override
	public String toString() {
		return "ImpressDTO [no=" + no + ", cate=" + cate + ", tourno=" + tourno
				+ ", id=" + id + ", conetnt=" + content + ", star=" + star
				+ ", imgSrc=" + imgSrc + ", regdate=" + regdate + "]";
	}
}
