package kr.go.tongyoung.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.dto.TourDTO;
import kr.go.tongyoung.model.TourDAO;
import net.sf.json.*;

@WebServlet("/CateLoadCtrl.do")
public class CateLoadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
		
		String cate = request.getParameter("cate");
		System.out.println("카테고리: "+cate);
		TourDAO dao = new TourDAO();
		
		ArrayList<TourDTO> result = dao.getTourCateList(cate);

		PrintWriter out = response.getWriter();
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		JSONObject json = new JSONObject();
		json.putAll(map);
		out.println(json.toString());
	}
}