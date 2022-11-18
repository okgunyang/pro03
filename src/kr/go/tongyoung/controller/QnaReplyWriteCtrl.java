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

@WebServlet("/QnaReplyWriteCtrl.do")
public class QnaReplyWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int no = Integer.parseInt(request.getParameter("no"));
		
		QnaDAO dao = new QnaDAO();
		QnaDTO qna = dao.getQna(no);
		
		request.setAttribute("qna", qna);
			
		//qna/replyWrite.jsp 에 포워딩
		RequestDispatcher view = request.getRequestDispatcher("./qna/replyWrite.jsp");
		view.forward(request, response);
	}
}