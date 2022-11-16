package kr.go.tongyoung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.dto.PicDTO;
import kr.go.tongyoung.model.TourDAO;

import net.sf.json.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ImgResearchCtrl.do")
public class ImgResearchCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String tourno = request.getParameter("tourno");
			
		PrintWriter out = response.getWriter();
		TourDAO tour = new TourDAO();
		ArrayList<PicDTO> picList = tour.JSONPicList(tourno);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("picList", picList);
		
		JSONObject json = new JSONObject();
		json.putAll(map);
		out.println(json);
	}
}