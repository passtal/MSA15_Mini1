package board.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import board.service.UserService;
import board.service.UserServiceImpl;

@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService userService = new UserServiceImpl();
       
	/**
	 * [GET]
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getPathInfo();
		
		response.setContentType("text/plain; charset=UTF-8;");
		
		// /idCheck - 아이디 중복 확인
		if("/idCheck".equals(path)) {
			System.out.println("아이디 중복 확인...");
			String userId = request.getParameter("user_id");
			boolean idCheck = userService.idCheck(userId);
			response.getWriter().print(idCheck);
			return;
		}
		
		// /usernameCheck - 닉네임 중복 확인
		if("/usernameCheck".equals(path)) {
			System.out.println("닉네임 중복 확인...");
			String userName = request.getParameter("username");
			boolean userNamecheck = userService.userNameCheck(userName);
			response.getWriter().print(userNamecheck);
			return;
		}
		
		
	}

	/**
	 * [POST]
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}