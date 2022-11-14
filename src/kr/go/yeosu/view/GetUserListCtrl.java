package kr.go.yeosu.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.yeosu.dto.UserDTO;
import kr.go.yeosu.model.UserDAO;

@WebServlet("/GetUserListCtrl.do")
public class GetUserListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8 초기화
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//dao에서 목록 불러오기 호출하여 반환받음
		UserDAO dao = new UserDAO();
		ArrayList<UserDTO> userList = dao.getUserList();
		
		//dao로 부터 받은 데이터를 view에 디스패치함
		request.setAttribute("list", userList);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/user/userList.jsp");
		view.forward(request, response);
	}
}