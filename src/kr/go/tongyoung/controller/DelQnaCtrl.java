package kr.go.tongyoung.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.model.QnaDAO;


@WebServlet("/DeleteQnaCtrl.do")
public class DelQnaCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		int parno = Integer.parseInt(request.getParameter("parno"));

		QnaDAO dao = new QnaDAO();
		int cnt = dao.delQna(no, parno); 
		
		if(cnt>=1){
			response.sendRedirect("GetQnaListCtrl.do");
		} else {
			response.sendRedirect("GetQnaDetailCtrl.do?no="+no);
		}
	}
}
