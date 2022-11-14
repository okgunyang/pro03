package kr.go.yeosu.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminCtrl.do")
public class AdminCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = "admin";
		
		request.setAttribute("admin", user);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/admin.jsp");
		view.forward(request, response);
	}
}
