package kr.go.tongyoung.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.model.TourDAO;

@WebServlet("/DelTourCtrl.do")
public class DelTourCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		TourDAO dao = new TourDAO();
		int cnt = dao.delTour(no);
		
		if(cnt>=1){
			response.sendRedirect("GetTourListCtrl.do");
		} else {
			response.sendRedirect("GetTourDetailCtrl.do?no="+no);
		}
	}

}
