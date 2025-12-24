package board.servlet;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import board.DTO.User;
import board.exception.AppException;
import board.exception.ErrorCode;
import board.service.UserService;
import board.service.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/user/update")
public class UserUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private UserService userService = new UserServiceImpl();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if(loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }

        request.getRequestDispatcher("/page/user/update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); 

        String ct = request.getContentType();
        
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if(loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }
        
        try {
            
        	String username = request.getParameter("username");
        	String ageString = request.getParameter("age");
        	String sex = request.getParameter("sex");
            int age = 0;

            if ( username != null && username.isBlank() ) {
            	username = null;
            }
            
            if( ageString != null && !ageString.isBlank() ) {
            	age = Integer.parseInt(ageString);
            }
            
            if (sex != null && sex.isBlank()) {
            	sex = null;
            }
            
            String profileImg = null;

			
			if (ct != null && ct.toLowerCase().startsWith("multipart/")) {
				Part profileImgPart = request.getPart("profileImg");
				
				if(profileImgPart != null && profileImgPart.getSize() > 0 ) {
					
					String uploadPath = getServletContext().getRealPath("/upload/profile");
					File uploadDir = new File(uploadPath); 
					
					if(!uploadDir.exists()) {
						uploadDir.mkdirs();
					}
					
					String submitted = profileImgPart.getSubmittedFileName();
					
					if( submitted != null && !submitted.isBlank() ) {
						
						String ext = "";
						int dot = submitted.lastIndexOf('.');
						
						if( dot != -1 && dot < submitted.length() - 1 ) {
							ext = submitted.substring(dot).toLowerCase();
						}
						if (ext.equals(".png") || ext.equals(".jpg") || ext.equals(".jpeg") || ext.equals(".webp")) {
							
							String uploadedName = UUID.randomUUID().toString() + ext;
							
							profileImgPart.write(uploadPath + File.separator + uploadedName);
							
							profileImg = "/upload/profile/" + uploadedName;
							
						}
						
					}
					
				}
				
			}

            User user = new User();
            user.setNo(loginUser.getNo());
            
            if (username != null) {
            	user.setUsername(username);
            }
            
            if (age > 0) {
            	user.setAge(age);
            }
            
            user.setSex(sex);
            user.setProfileImg(profileImg);

            userService.updateMyPage(user);

            User refreshed = userService.selectByNo(loginUser.getNo());
            refreshed.setPassword(null);
            session.setAttribute("loginUser", refreshed);

            response.sendRedirect(request.getContextPath() + "/");
        	
        } catch (AppException e) {
			request.setAttribute("errorCode", e.getErrorCode());
			request.getRequestDispatcher("/page/user/update.jsp").forward(request, response);
        } catch (NumberFormatException e) {
        	throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
        } catch (Exception e) {
        	throw new AppException(ErrorCode.COMMON_INTERNAL_ERROR, e);
        }
    }
}