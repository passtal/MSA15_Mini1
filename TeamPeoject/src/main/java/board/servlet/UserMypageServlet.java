package board.servlet;

import java.io.IOException;

import board.DAO.UserDAO;
import board.DTO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/mypage")
public class UserMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();

	@Override
	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        
        if(loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }
        
        try {
			User user = userDAO.select(loginUser.getNo());
			request.setAttribute("user", user);
			request.getRequestDispatcher("/page/mypage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
	
	

}
