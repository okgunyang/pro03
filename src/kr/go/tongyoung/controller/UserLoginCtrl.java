package kr.go.tongyoung.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.tongyoung.model.UserDAO;

@WebServlet("/UserLoginCtrl.do")
public class UserLoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//id, pw
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String msg = "";
		UserDAO dao = new UserDAO();
		int cnt = dao.userLogin(id, pw);
		HttpSession session = request.getSession();
		if(cnt==1){
			msg = "로그인 성공";
			session.setAttribute("sid", id);
			response.sendRedirect(request.getContextPath());
		} else if(cnt==9) {
			msg = "아이디 또는 비밀번호가 틀립니다.";
			response.sendRedirect("./user/login.jsp?msg="+msg);			
		} else {
			msg = "존재하지 않는 아이디 입니다.";
			response.sendRedirect("./user/login.jsp?msg="+msg);
		}
		
	}

}
