package kr.go.tongyoung.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.dto.QnaDTO;
import kr.go.tongyoung.model.QnaDAO;


@WebServlet("/QnaReplyWriteProCtrl.do")
public class QnaReplyWriteProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int parno = Integer.parseInt(request.getParameter("parno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		String sec = request.getParameter("sec");
		int lev = Integer.parseInt(request.getParameter("lev"));

		QnaDTO dto = new QnaDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setAuthor(author);
		dto.setLev(lev);
		dto.setSec(sec);
		dto.setParno(parno);
		
		QnaDAO dao = new QnaDAO();
		int cnt = dao.addReply(dto);
		
		//결과를 데이터베이스로 부터 받아서 VO에 저장
		if(cnt>=1){
			response.sendRedirect("GetQnaListCtrl.do");
		} else {
			response.sendRedirect("QnaReplyWriteCtrl.do?no="+parno);
		}
	}
}