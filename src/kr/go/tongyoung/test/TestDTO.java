package kr.go.tongyoung.test;
public class TestDTO {
	private String name;
	private int point;
	public TestDTO(){ }
	public TestDTO(String name, int point) {
		this.name = name;
		this.point = point;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "TestDTO [name=" + name + ", point=" + point + "]";
	}
}
