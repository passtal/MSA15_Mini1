package board.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import board.DTO.User;
import board.service.UserService;
import board.service.UserServiceImpl;

@MultipartConfig
@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UserService userService = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String type = request.getParameter("type");
		
		if( type == null || type.isBlank() ) {
			response.sendRedirect(root + "/signup/type");
			return;
		}
		
		type = type.trim().toUpperCase();
		
		switch (type) {
			case "ROLE_USER":
			case "ROLE_OWNER": request.setAttribute("type", type);
						  request.getRequestDispatcher("/page/signup.jsp").forward(request, response);
						  return;
			default : response.sendRedirect(root + "/signup/type");
					  return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String root = request.getContextPath();
		String ct = request.getContentType();
		String profilePath = "/static/img/default-profile.png";
		String userauth = request.getParameter("type");
		
		if( userauth == null || userauth.isBlank() ) {
			response.sendRedirect(root + "/signup/type");
			return;
		}
		
		userauth = userauth.trim().toUpperCase();
		
		switch (userauth) {
			case "ROLE_USER":
			case "ROLE_OWNER":
				// 프로필 이미지 업로드를 하지 않아도 가입이 가능하도록 설정
				Part profileImgPart = null;
				
				if (ct != null && ct.toLowerCase().startsWith("multipart/")) {
					profileImgPart = request.getPart("profileImg");
					
					if(profileImgPart != null && profileImgPart.getSize() > 0 ) {
						
						String uploadPath = getServletContext().getRealPath("/upload/profile");
						File uploadDir = new File(uploadPath);
						
						if( !uploadDir.exists() ) {
							uploadDir.mkdirs();
						}
						
						String submitted = profileImgPart.getSubmittedFileName();
						
						if( submitted == null || submitted.isBlank() ) {
							
						}
						else {
							
							String ext = "";
							int dot = submitted.lastIndexOf('.');
							
							if( dot != -1 && dot < submitted.length() - 1 ) {
								ext = submitted.substring(dot).toLowerCase();
							}
							if (!(ext.equals(".png") || ext.equals(".jpg") || ext.equals(".jpeg") || ext.equals(".webp"))) {
								
							}
							
							else {
								String uploadedName = UUID.randomUUID().toString() + ext;
								
								profileImgPart.write(uploadPath + File.separator + uploadedName);
								
								profilePath = "/upload/profile/" + uploadedName;
								
							}
							
							
						}
						
						
					}
					
				}
				
				// 회원가입
				System.out.println("회원가입 요청 처리...");
				String userId = request.getParameter("user_id");
				String password = request.getParameter("password");
				String username = request.getParameter("username");
				String age = request.getParameter("age");
				String sex = request.getParameter("sex");
				User user = User.builder()
						.id( UUID.randomUUID().toString() )
						.userId(userId)
						.password(password)
						.username(username)
						.age(Integer.valueOf(age))
						.sex(sex)
						.profileImg(profilePath)
						.build();
				User saved = userService.signupWithAuth(user, userauth);
				// 회원가입 성공
				if( saved != null ) {
					response.sendRedirect(root + "/");
					return;
				} 
				// 회원가입 실패
				else {
					response.sendRedirect(root + "/signup/type?error=true");
					return;
				}
				
			default : response.sendRedirect(root + "/signup/type?error=true");
					  return;
		}
		
	}

}
