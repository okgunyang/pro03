package kr.go.tongyoung.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.dto.TourDTO;
import kr.go.tongyoung.model.TourDAO;

@WebServlet("/GetTourListCtrl.do")
public class GetTourListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8 초기화
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//dao에서 목록 불러오기 호출하여 반환받음
		TourDAO dao = new TourDAO();
		ArrayList<TourDTO> tourList = dao.getTourList();
		
		//dao로 부터 받은 데이터를 view에 디스패치함
		request.setAttribute("list", tourList);
		
		RequestDispatcher view = request.getRequestDispatcher("./tour/tourList.jsp");
		view.forward(request, response);
	}
}