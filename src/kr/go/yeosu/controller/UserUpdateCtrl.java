package kr.go.yeosu.controller;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.yeosu.dto.UserDTO;
import kr.go.yeosu.model.UserDAO;
import kr.go.yeosu.service.AES256;

@WebServlet("/UserUpdateCtrl.do")
public class UserUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//id, pw, name, birth, email, tel, addr
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String addr1 = request.getParameter("address1");
		String addr2 = request.getParameter("address2");
		String addr = request.getParameter("addr");
		if(addr1!=null){
			addr = addr1 + "\n" + addr2;
		}
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String birth = request.getParameter("birth");
        
		boolean result = false;

		int cnt = 0, suc = 0;
		UserDAO dao = new UserDAO();	
		UserDTO user = new UserDTO();
        String key = "%02x";
        String encrypted = "";
        try {
			encrypted = AES256.encryptAES256(pw, key);
		} catch (Exception e) {
			e.printStackTrace();
		} 
        
		user.setId(id);
		user.setPw(encrypted);
		user.setName(name);
		user.setAddr(addr);
		user.setTel(tel);
		user.setEmail(email);
		user.setBirth(birth);
		suc = dao.updateUser(user);
		
		if(suc>=1){
			response.sendRedirect("/");
		} else {
			response.sendRedirect("UserInfoCtrl");
		}
	}
}