package kr.go.yeosu.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.yeosu.dto.UserDTO;
import kr.go.yeosu.model.UserDAO;

@WebServlet("/GetUserDetailCtrl.do")
public class GetUserDetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = (String) request.getParameter("id");
		
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.userInfo(id);
		
		//dao로 부터 받은 데이터를 view에 디스패치함
		request.setAttribute("dto", dto);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/user/userDetail.jsp");
		view.forward(request, response);
		
	}
}