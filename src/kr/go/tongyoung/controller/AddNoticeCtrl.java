package kr.go.tongyoung.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.dto.NoticeDTO;
import kr.go.tongyoung.model.NoticeDAO;

@WebServlet("/AddNoticeCtrl.do")
public class AddNoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeDTO dto = new NoticeDTO();
		dto.setTitle(title);
		dto.setContent(content);
		
		NoticeDAO dao = new NoticeDAO();
		int cnt = dao.addNotice(dto);
		
		if(cnt>=1){
			response.sendRedirect("GetNoticeListCtrl.do");
		} else {
			response.sendRedirect("./notice/addNotice.jsp");
		}
	}
}