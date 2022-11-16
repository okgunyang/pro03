package kr.go.tongyoung.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//import org.json.JSONObject;
import net.sf.json.*;
//리스트 객체 정보 ajax로 보내기
@WebServlet("/JSONTest3.do")
public class JSONTest3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		TestDAO dao = new TestDAO();
		ArrayList<TestDTO> data = dao.testDataAll();

		PrintWriter out = response.getWriter();
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("data", data);
		
		JSONObject json = new JSONObject();
		json.putAll(map);
		out.println(json.toString());
	}
}
