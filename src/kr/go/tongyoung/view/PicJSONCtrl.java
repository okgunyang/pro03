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

import kr.go.tongyoung.dto.PicDTO;
import kr.go.tongyoung.model.TourDAO;
import net.sf.json.JSONObject;

@WebServlet("/PicJSONCtrl.do")
public class PicJSONCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tourno = request.getParameter("tourno");
		
		PrintWriter out = response.getWriter();
		TourDAO dao = new TourDAO();
		ArrayList<PicDTO> picList = dao.JSONPicList(tourno);
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("picList", picList);
		JSONObject json = new JSONObject();
		json.putAll(map);
		out.println(json);
	}
}