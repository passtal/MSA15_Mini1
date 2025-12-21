package board.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import board.service.PersistenceLoginsService;
import board.service.PersistenceLoginsServiceImpl;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// url : /users/idCheck
		String root = request.getContextPath();
		
		// /logout - 로그아웃
		System.out.println("로그아웃...");
		HttpSession session = request.getSession();
		
		// 쿠키 제거
		// - 자동 로그인, 토큰
		Cookie rememberMeCookie = new Cookie("rememberMe", "");
		Cookie tokenCookie = new Cookie("token", "");
		Cookie[] deleteCookies = { rememberMeCookie, tokenCookie };
		for (int i = 0; i < deleteCookies.length; i++) {
			Cookie cookie = deleteCookies[i];
			cookie.setPath(root);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		// 자동 로그인 토큰 삭제
		PersistenceLoginsService persistenceLoginsService = new PersistenceLoginsServiceImpl();
		String userId = (String) session.getAttribute("loginId");
		persistenceLoginsService.delete(userId);
		
		session.invalidate();				// 세션 속성 모두 제거 : 세션 무효화
		response.sendRedirect(root + "/");	// 메인 화면으로 이동
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
