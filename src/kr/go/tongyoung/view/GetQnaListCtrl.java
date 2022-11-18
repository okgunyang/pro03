package kr.go.tongyoung.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.dto.QnaDTO;
import kr.go.tongyoung.model.QnaDAO;

@WebServlet("/GetQnaListCtrl.do")
public class GetQnaListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
				
		QnaDAO dao = new QnaDAO();
		//결과를 데이터베이스로 부터 받아서 리스트로 저장
		ArrayList<QnaDTO> qnaList = dao.getQnaList();

		request.setAttribute("qnaList", qnaList);
		
		//qna/qnaList.jsp 에 포워딩
		RequestDispatcher view = request.getRequestDispatcher("./qna/qnaList.jsp");
		view.forward(request, response);			
	}
}
