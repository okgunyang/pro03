<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.go.tongyoung.service.*" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%
	//캐릭터셋 설정
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	//메일 폼에서 보내온 데이터 받기
	String name = request.getParameter("name");
	String from = request.getParameter("from");
	String from2 = "kkt09072@naver.com";
	String tel = request.getParameter("tel");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String to = "kkt09072@naver.com";
	
	Properties p = new Properties();
	
	p.put("mail.smtp.host","smtp.naver.com"); 
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	
	try {
	    Authenticator auth = new SMTPAuthenticatior();
	    Session ses = Session.getInstance(p, auth);
		
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		
		msg.setSubject(title); //  제목
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("보내는 사람 : ");
		buffer.append(name+"\n");
		buffer.append("연락처 : ");
		buffer.append(tel+"\n");		
		buffer.append("이메일 : ");
		buffer.append(from+"\n");		
		buffer.append("제목 : ");
		buffer.append(title+"\n");
		buffer.append("내용 : ");
		buffer.append(content+"\n");
		
		Address fromAddr = new InternetAddress(from2);
		msg.setFrom(fromAddr);	

		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람 
		
		msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
		Transport.send(msg); // 전송   
		
	} catch(Exception e){
		e.printStackTrace();
		return;
	} finally {
		response.sendRedirect("index.jsp");
	}
%>