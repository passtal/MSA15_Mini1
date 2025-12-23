package board.servlet;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import board.DAO.UserDAO;
import board.DTO.User;
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
    
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if(loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }

        request.getRequestDispatcher("/page/update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); 

        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if(loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }
        
        try {
            String noStr = request.getParameter("no");
            if(noStr == null || noStr.isEmpty()) {
                throw new Exception("유효하지 않은 사용자 번호입니다.");
            }
            int no = Integer.parseInt(noStr);
            
            User user = userDAO.select(no);
            if(user == null) {
                 throw new Exception("DB에서 회원 정보를 찾을 수 없습니다.");
            }
            
            String username = request.getParameter("username");
            String ageStr = request.getParameter("age");
            String sex = request.getParameter("sex");
            
            int age = 0;
            if(ageStr != null && !ageStr.isEmpty()) {
                age = Integer.parseInt(ageStr);
            }

            user.setUsername(username);
            user.setAge(age);
            
            if(sex != null) { 
                user.setSex(sex); 
            }
            String newPassword = request.getParameter("password");
            if(newPassword != null && !newPassword.isEmpty()) {
                user.setPassword(newPassword);
            }
            
            Part profileImgPart = request.getPart("profileImg");
            if(profileImgPart != null && profileImgPart.getSize() > 0 && profileImgPart.getSubmittedFileName() != null && !profileImgPart.getSubmittedFileName().isEmpty()) {
                
                String uploadPath = getServletContext().getRealPath("/upload/profile");
                File uploadDir = new File(uploadPath);
                if(!uploadDir.exists()) uploadDir.mkdirs();
                
                String submitted = profileImgPart.getSubmittedFileName();
                String ext = submitted.substring(submitted.lastIndexOf("."));
                String uploadedName = UUID.randomUUID().toString() + ext;
                
                profileImgPart.write(uploadPath + File.separator + uploadedName);
                
                user.setProfileImg("/upload/profile/" + uploadedName);
            }
            
            int result = userDAO.update(user);
            
            if(result > 0) {
                session.setAttribute("loginUser", user);
                response.sendRedirect(request.getContextPath() + "/");
            } else {
                response.sendRedirect(request.getContextPath() + "/user/update?error=fail");
            }
            
        } catch (Exception e) {
            e.printStackTrace(); 
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}