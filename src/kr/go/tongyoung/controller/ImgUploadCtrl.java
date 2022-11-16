package kr.go.tongyoung.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import javax.imageio.ImageIO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.tongyoung.dto.PicDTO;
import kr.go.tongyoung.model.TourDAO;
import net.sf.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("/ImgUploadCtrl.do")
public class ImgUploadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int maxSize = 10*1024*1024;
		String saveFolder = "D:/kim6/pro01/pro03/webapps/upload"; //개발자 디렉토리
		String uploadPath = request.getRealPath("/upload"); //서버 디렉토리
		
		TourDAO dao = new TourDAO(); 
		PicDTO dto = new PicDTO();
		try {
			//서버 디렉토리에 먼저 파일을 업로드
			//MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8");
			
			int pos = Integer.parseInt(multi.getParameter("pos"));
			String tourno = multi.getParameter("tourno");
				
			Enumeration files=multi.getFileNames();
		
			String file1 =(String) files.nextElement();
			String fileName1=multi.getFilesystemName(file1);
			
			String imageURL = uploadPath + fileName1;
			
			try {
				//개발자 컴퓨터에도 파일 업로드
				File imgURL = new File(imageURL);
				String extension = imageURL.substring(imageURL.lastIndexOf(".")+1); // 확장자
				
				BufferedImage image = ImageIO.read(imgURL);
				File file = new File(saveFolder + fileName1);
				if(!file.exists()) { // 해당 경로의 폴더가 존재하지 않을 경우
					file.mkdirs(); // 해당 경로의 폴더 생성
				}
				
				ImageIO.write(image, extension, file); // image를 file로 업로드
				System.out.println("이미지 업로드 완료!");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			dto.setPicname(fileName1);
			dto.setPos(pos);
			dto.setTourno(tourno);

			int cnt = dao.fileUpload(dto);
			if(cnt>=1){
				System.out.println("업로드 성공");
			} else {
				System.out.println("업로드 실패");
				response.sendRedirect("./tour/imgUpload.jsp?no="+pos+"&tourno="+tourno);
			}

			PrintWriter out = response.getWriter();
			TourDAO tour = new TourDAO();
			ArrayList<PicDTO> picList = tour.JSONPicList(tourno);
			
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("picList", picList);
			
			JSONObject json = new JSONObject();
			json.putAll(map);
			out.println(json);
			
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}