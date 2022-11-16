package kr.go.tongyoung.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;

//하나의 객체 정보 ajax로 보내기

@WebServlet("/JSONTest2.do")
public class JSONTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name");
		
		TestDAO dao = new TestDAO();
		TestDTO result = dao.testDataOne(name);
				
		JSONObject json = new JSONObject();
		json.put("name", result.getName());
		json.put("point", result.getPoint());
		PrintWriter out = response.getWriter();
		out.println(json.toString());
	}
}
