package kr.go.tongyoung.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.model.ImpressDAO;

@WebServlet("/DelImpressCtrl.do")
public class DelImpressCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		ImpressDAO dao = new ImpressDAO();
		int cnt = dao.delImpress(no);
		
		if(cnt>=1){
			response.sendRedirect("GetImpressListCtrl.do");
		} else {
			response.sendRedirect("GetImpressListCtrl.do");
		}
	}

}
