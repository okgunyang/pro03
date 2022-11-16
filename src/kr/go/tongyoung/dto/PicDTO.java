package kr.go.tongyoung.dto;

public class PicDTO {
	private int no;
	private String tourno;
	private String picname;
	private int pos;
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
	public String getPicname() {
		return picname;
	}
	public void setPicname(String picname) {
		this.picname = picname;
	}
	
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	@Override
	public String toString() {
		return "PicDTO [no=" + no + ", tourno=" + tourno + ", picname="
				+ picname + ", pos=" + pos + "]";
	}
}
