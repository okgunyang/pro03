package kr.go.tongyoung.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.dto.QnaDTO;
import kr.go.tongyoung.model.QnaDAO;

@WebServlet("/UpdateQnaCtrl.do")
public class UpdateQnaCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String sql = "";
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		//결과를 데이터베이스로 부터 받아서 VO에 저장
		QnaDAO dao = new QnaDAO();
		QnaDTO qna = dao.getQna(no);

		request.setAttribute("vo", qna);
			
		//qna/updateQna.jsp 에 포워딩
		RequestDispatcher view = request.getRequestDispatcher("./qna/updateQna.jsp");
		view.forward(request, response);
	}
}